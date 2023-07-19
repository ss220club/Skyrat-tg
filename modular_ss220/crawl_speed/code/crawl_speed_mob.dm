/mob/living/update_move_intent_slowdown()
	if(HAS_TRAIT(src, TRAIT_FORCE_WALK_SPEED))
		add_movespeed_modifier(/datum/movespeed_modifier/config_walk_run/walk)
		return
	. = ..()

/mob/living/carbon/Login(mapload)
	. = ..()
	if(. && !GetComponent(/datum/component/crawl_speed))
		AddComponent(/datum/component/crawl_speed)
