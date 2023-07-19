/datum/component/crawl_speed/Initialize(...)
	. = ..()
	if(!iscarbon(parent))
		return COMPONENT_INCOMPATIBLE

/datum/component/crawl_speed/RegisterWithParent()
	. = ..()
	RegisterSignal(parent, COMSIG_LIVING_SET_BODY_POSITION, PROC_REF(on_position_change))

/datum/component/crawl_speed/UnregisterFromParent()
	. = ..()
	UnregisterSignal(parent, COMSIG_LIVING_SET_BODY_POSITION)

/datum/component/crawl_speed/proc/on_position_change(mob/living/carbon/source, new_value)
	if(new_value == LYING_DOWN)
		ADD_TRAIT(source, TRAIT_FORCE_WALK_SPEED, CRAWL_SPEED_TRAIT)
	else
		REMOVE_TRAIT(source, TRAIT_FORCE_WALK_SPEED, CRAWL_SPEED_TRAIT)
	source.update_move_intent_slowdown()
