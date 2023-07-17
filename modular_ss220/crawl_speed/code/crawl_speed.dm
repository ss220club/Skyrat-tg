/mob/living/carbon/set_body_position(new_value)
	. = ..()
	if(new_value == LYING_DOWN)
		if(m_intent == MOVE_INTENT_RUN)
			toggle_move_intent()
		ADD_TRAIT(src, TRAIT_NORUNNING, "crawl_speed")
		return
	REMOVE_TRAIT(src, TRAIT_NORUNNING, "crawl_speed")
