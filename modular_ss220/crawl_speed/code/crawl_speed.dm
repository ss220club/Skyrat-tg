/mob/living/carbon
	var/was_running = FALSE

/mob/living/carbon/set_body_position(new_value)
	. = ..()
	if(new_value == LYING_DOWN)
		was_running = FALSE
		if(m_intent == MOVE_INTENT_RUN)
			was_running = TRUE
			toggle_move_intent()
		ADD_TRAIT(src, TRAIT_NORUNNING, "crawl_speed")
		return
	REMOVE_TRAIT(src, TRAIT_NORUNNING, "crawl_speed")
	if(was_running)
		toggle_move_intent()
