// A summon which floats around the station incorporeally, and can appear in any mirror
/mob/living/simple_animal/hostile/heretic_summon/maid_in_the_mirror
	name = "Maid in the Mirror"
	real_name = "Maid in the Mirror"
	desc = "Плывущий и струящийся поток холодного воздуха. При взгляде на него он слегка мерцает."
	icon = 'icons/mob/simple/mob.dmi'
	icon_state = "stand"
	icon_living = "stand" // Placeholder sprite
	speak_emote = list("whispers")
	movement_type = FLOATING
	status_flags = CANSTUN | CANPUSH
	attack_sound = SFX_SHATTER
	maxHealth = 80
	health = 80
	melee_damage_lower = 12
	melee_damage_upper = 16
	sight = SEE_MOBS | SEE_OBJS | SEE_TURFS
	death_message = "разбивается и исчезает, выпуская порыв холодного воздуха."
	loot = list(
		/obj/item/shard,
		/obj/effect/decal/cleanable/ash,
		/obj/item/clothing/suit/armor/vest,
		/obj/item/organ/internal/lungs,
	)
	actions_to_add = list(/datum/action/cooldown/spell/jaunt/mirror_walk)

	/// Whether we take damage when we're examined
	var/weak_on_examine = TRUE
	/// The cooldown after being examined that the same mob cannot trigger it again
	var/recent_examine_damage_cooldown = 10 SECONDS
	/// A list of REFs to people who recently examined us
	var/list/recent_examiner_refs = list()

/mob/living/simple_animal/hostile/heretic_summon/maid_in_the_mirror/death(gibbed)
	var/turf/death_turf = get_turf(src)
	death_turf.TakeTemperature(-40)
	return ..()

// Examining them will harm them, on a cooldown.
/mob/living/simple_animal/hostile/heretic_summon/maid_in_the_mirror/examine(mob/user)
	. = ..()
	if(!weak_on_examine)
		return

	if(!isliving(user) || user.stat == DEAD)
		return

	if(IS_HERETIC_OR_MONSTER(user) || user == src)
		return

	var/user_ref = REF(user)
	if(user_ref in recent_examiner_refs)
		return

	// If we have health, we take some damage
	if(health > (maxHealth * 0.125))
		visible_message(
				span_warning("[src], кажется, слегка мерцает, исчезая и появляясь."),
				span_userdanger("Взгляд [user] пронзает ваше тело!"),
		)

		recent_examiner_refs += user_ref
		apply_damage(maxHealth * 0.1) // We take 10% of our health as damage upon being examined
		playsound(src, 'sound/effects/ghost2.ogg', 40, TRUE)
		addtimer(CALLBACK(src, PROC_REF(clear_recent_examiner), user_ref), recent_examine_damage_cooldown)

	// If we're examined on low enough health we die straight up
	else
		visible_message(
				span_danger("[src] исчезает из бытия!"),
				span_userdanger("Взгляд [user] разрушает вашу форму, уничтожая вас!"),
		)

		death()

/mob/living/simple_animal/hostile/heretic_summon/maid_in_the_mirror/proc/clear_recent_examiner(mob_ref)
	if(!(mob_ref in recent_examiner_refs))
		return

	recent_examiner_refs -= mob_ref
	heal_overall_damage(5)
