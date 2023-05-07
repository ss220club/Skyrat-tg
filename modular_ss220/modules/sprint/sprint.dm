
//NON-MODULAR FILES EDITED: keybinding.dm; keybinding/mob.dm; mob_movement.dm

/// SPRINT SYSTEM: CONFIG ///
/datum/config_entry/flag/enable_sprint
	default = FALSE

/datum/config_entry/number/sprint_cost
	default = 1
	min_val = 0

/datum/config_entry/number/lower_sprint_threshold
	default = 80
	min_val = 0

/datum/config_entry/number/upper_sprint_threshold
	default = 50
	min_val = 0

	//////////////////////////////////////////
	//SS220 ADDITION START: SPRINT SYSTEM///
	////////////////////////////////////////

/mob/proc/hadle_sprint(mob/user)
	var/mob/living/affected = user
	if((affected.m_intent == MOVE_INTENT_RUN) && (CONFIG_GET(flag/enable_sprint)))
		if(affected.getStaminaLoss() > CONFIG_GET(number/upper_sprint_threshold))
			if(prob(10) && iscarbon(affected))
				to_chat(affected, span_warning("You feel fatigued."))
				affected.emote("gasp")
				affected.adjustOxyLoss(1)

		if(affected.getStaminaLoss() > CONFIG_GET(number/lower_sprint_threshold))
			if(prob(25) && iscarbon(affected))
				to_chat(affected, span_warning("You're completely exhausted."))
				affected.emote("gasp")
				affected.adjustOxyLoss(1)

			affected.set_moving_slowly()

		affected.adjustStaminaLoss(affected.get_stamina_use_per_step(), TRUE)


/// STAMINA SYSTEM: PROCS ///

/mob/proc/set_moving_slowly(mob/user)
	if(m_intent == MOVE_INTENT_RUN)
		m_intent = MOVE_INTENT_WALK

	if(hud_used?.static_inventory)
		for(var/atom/movable/screen/mov_intent/selector in hud_used.static_inventory)
			selector.update_appearance()

/mob/proc/set_moving_quickly(mob/user)
	var/mob/living/mob = user
	if(mob.getStaminaLoss() > CONFIG_GET(number/lower_sprint_threshold))
		to_chat(src, span_warning("You are unable run because you're exhausted"))
		return FALSE

	if(m_intent == MOVE_INTENT_WALK)
		m_intent = MOVE_INTENT_RUN

	else
		if (HAS_TRAIT(src,TRAIT_NORUNNING))
			to_chat(src, "You find yourself unable to run.")
			return FALSE
		m_intent = MOVE_INTENT_RUN

	SET_PLANE_IMPLICIT(src, (m_intent == MOVE_INTENT_WALK && !HAS_TRAIT(src, TRAIT_OVERSIZED)) ? GAME_PLANE_FOV_HIDDEN : GAME_PLANE)

	if(hud_used?.static_inventory)
		for(var/atom/movable/screen/mov_intent/selector in hud_used.static_inventory)
			selector.update_appearance()


/mob/proc/get_stamina_use_per_step()
	return 1

/mob/living/carbon/human/get_stamina_use_per_step()
	var/cost = CONFIG_GET(number/sprint_cost)
	return cost

/// STAMINA SYSTEM: PROCS OVERRIDE ///

//cuz stamina hud updates only when applying damage or healing wounds, or maybe i'm dumb
/mob/living/Life(seconds_per_tick, times_fired)
	. = ..()
	update_stamina_hud()

	//////////////////////////////////////////
	//SS220 ADDITION END: STAMINA SYSTEM///
	////////////////////////////////////////


