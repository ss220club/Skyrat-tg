/datum/action/cooldown/spell/jaunt/mirror_walk
	name = "Mirror Walk"
	desc = "Позволяет незаметно и свободно перемещаться по станции в пределах мира зеркала. \
		Войти в мир зеркал и выйти из него можно только при наличии рядом отражающих поверхностей и предметов, \
		например, окна, зеркала, отражающие стены или оборудование."
	background_icon_state = "bg_heretic"
	overlay_icon_state = "bg_heretic_border"
	button_icon = 'icons/mob/actions/actions_minor_antag.dmi'
	button_icon_state = "ninja_cloak"

	cooldown_time = 6 SECONDS
	jaunt_type = /obj/effect/dummy/phased_mob/mirror_walk
	spell_requirements = NONE

	/// The time it takes to enter the mirror / phase out / enter jaunt.
	var/phase_out_time = 1.5 SECONDS
	/// The time it takes to exit a mirror / phase in / exit jaunt.
	var/phase_in_time = 2 SECONDS
	/// Static typecache of types that are counted as reflective.
	var/static/list/special_reflective_surfaces = typecacheof(list(
		/obj/structure/window,
		/obj/structure/mirror,
	))

/datum/action/cooldown/spell/jaunt/mirror_walk/Grant(mob/grant_to)
	. = ..()
	RegisterSignal(grant_to, COMSIG_MOVABLE_MOVED, PROC_REF(update_status_on_signal))

/datum/action/cooldown/spell/jaunt/mirror_walk/Remove(mob/remove_from)
	. = ..()
	UnregisterSignal(remove_from, COMSIG_MOVABLE_MOVED)

/datum/action/cooldown/spell/jaunt/mirror_walk/can_cast_spell(feedback = TRUE)
	. = ..()
	if(!.)
		return FALSE

	var/we_are_phasing = is_jaunting(owner)
	var/turf/owner_turf = get_turf(owner)
	if(!is_reflection_nearby(get_turf(owner_turf)))
		if(feedback)
			to_chat(owner, span_warning("Поблизости нет отражающих поверхностей, чтобы [we_are_phasing ? "выйти из мира": "войти в мир"] зеркал здесь!"))
		return FALSE

	if(owner_turf.is_blocked_turf(exclude_mobs = TRUE))
		if(feedback)
			to_chat(owner, span_warning("Что-то блокирует вас от [we_are_phasing ? "выход из мира": "входа в мир"] зеркал здесь!"))
		return FALSE

	return TRUE

/datum/action/cooldown/spell/jaunt/mirror_walk/cast(mob/living/cast_on)
	. = ..()
	if(is_jaunting(cast_on))
		return exit_jaunt(cast_on)
	else
		return enter_jaunt(cast_on)

/datum/action/cooldown/spell/jaunt/mirror_walk/enter_jaunt(mob/living/jaunter, turf/loc_override)
	var/atom/nearby_reflection = is_reflection_nearby(jaunter)
	if(!nearby_reflection)
		to_chat(jaunter, span_warning("Поблизости нет отражающих поверхностей, чтобы войти в мир зеркал!"))
		return

	jaunter.Beam(nearby_reflection, icon_state = "light_beam", time = phase_out_time)
	nearby_reflection.visible_message(span_warning("[nearby_reflection] начинают мерцать и слегка дрожать!"))
	if(!do_after(jaunter, phase_out_time, nearby_reflection, IGNORE_USER_LOC_CHANGE|IGNORE_INCAPACITATED))
		return

	playsound(jaunter, 'sound/magic/ethereal_enter.ogg', 50, TRUE, -1)
	jaunter.visible_message(
		span_boldwarning("[jaunter] исчезает из реальности, растворяясь на ваших глазах!"),
		span_notice("Вы прыгаете в отражение, исходящее от [nearby_reflection], и попадаете в мир зеркал."),
	)

	// Pass the turf of the nearby reflection to the parent call
	// as that's the location we're actually jaunting into
	var/obj/effect/dummy/phased_mob/jaunt = ..(jaunter, get_turf(nearby_reflection))
	if (!jaunt)
		return FALSE
	RegisterSignal(jaunt, COMSIG_MOVABLE_MOVED, PROC_REF(update_status_on_signal))
	return jaunt

/datum/action/cooldown/spell/jaunt/mirror_walk/exit_jaunt(mob/living/unjaunter, turf/loc_override)
	var/turf/phase_turf = get_turf(unjaunter)
	var/atom/nearby_reflection = is_reflection_nearby(phase_turf)
	if(!nearby_reflection)
		to_chat(unjaunter, span_warning("Поблизости нет отражающих поверхностей для выхода из мира зеркал!"))
		return FALSE

	// It would likely be a bad idea to teleport into an ai monitored area (ai sat)
	var/area/phase_area = get_area(phase_turf)
	if(istype(phase_area, /area/station/ai_monitored))
		to_chat(unjaunter, span_warning("Выходить из зеркального царства здесь, вероятно, не очень разумно."))
		return FALSE

	nearby_reflection.Beam(phase_turf, icon_state = "light_beam", time = phase_in_time)
	nearby_reflection.visible_message(span_warning("[nearby_reflection] начинают мерцать и слегка дрожать!"))
	if(!do_after(unjaunter, phase_in_time, nearby_reflection))
		return FALSE

	// We can move around while phasing in, but we'll always end up where we started it.
	// Pass the jaunter's turf at the start of the proc back to the parent call.
	return ..(unjaunter, phase_turf)

// Play a spooky noise, provide textual feedback, and make the turf colder.
/datum/action/cooldown/spell/jaunt/mirror_walk/on_jaunt_exited(obj/effect/dummy/phased_mob/jaunt, mob/living/unjaunter)
	. = ..()
	UnregisterSignal(jaunt, COMSIG_MOVABLE_MOVED)
	playsound(unjaunter, 'sound/magic/ethereal_exit.ogg', 50, TRUE, -1)
	var/turf/phase_turf = get_turf(unjaunter)

	// Chilly!
	if (isopenturf(phase_turf))
		phase_turf.TakeTemperature(-20)

	var/atom/nearby_reflection = is_reflection_nearby(phase_turf)
	if (!nearby_reflection) // Should only be true if you're forced out somehow, like by having the spell removed
		return
	unjaunter.visible_message(
		span_boldwarning("[unjaunter] появляется в реальности на ваших глазах!"),
		span_notice("Вы выпрыгиваете из отражения, исходящего от [nearby_reflection], выходя из мира зеркал."),
	)

/**
 * Goes through all nearby atoms in sight of the
 * passed caster and determines if they are "reflective"
 * for the purpose of us being able to utilize it to enter or exit.
 *
 * Returns an object reference to a "reflective" object in view if one was found,
 * or null if no object was found that was determined to be "reflective".
 */
/datum/action/cooldown/spell/jaunt/mirror_walk/proc/is_reflection_nearby(atom/caster)
	for(var/atom/thing as anything in view(2, caster))
		if(isitem(thing))
			var/obj/item/item_thing = thing
			if(item_thing.IsReflect())
				return thing

		if(ishuman(thing))
			var/mob/living/carbon/human/human_thing = thing
			if(human_thing.check_reflect())
				return thing

		if(isturf(thing))
			var/turf/turf_thing = thing
			if(turf_thing.turf_flags & NOJAUNT)
				continue
			if(turf_thing.flags_ricochet & RICOCHET_SHINY)
				return thing

		if(is_type_in_typecache(thing, special_reflective_surfaces))
			return thing

	return null

/obj/effect/dummy/phased_mob/mirror_walk
	name = "reflection"
