#define ADDITIONAL_SLOWDOWN 3.5

/datum/config_entry/flag/additional_crawl_slowdown
	default = FALSE

/datum/movespeed_modifier/carbon_crawling_additional
	multiplicative_slowdown = ADDITIONAL_SLOWDOWN
	flags = IGNORE_NOSLOW

/mob/living/carbon/set_body_position(new_value)
	. = ..()
	if(isnull(.) || !CONFIG_GET(flag/additional_crawl_slowdown))
		return
	if(new_value == LYING_DOWN)
		add_movespeed_modifier(/datum/movespeed_modifier/carbon_crawling_additional)
	else
		remove_movespeed_modifier(/datum/movespeed_modifier/carbon_crawling_additional)

#undef ADDITIONAL_SLOWDOWN
