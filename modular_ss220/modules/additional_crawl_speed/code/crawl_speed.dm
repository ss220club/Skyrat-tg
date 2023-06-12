#define ADDITIONAL_SLOWDOWN 1.6

/datum/config_entry/flag/additional_crawl_slowdown
	default = FALSE

/datum/movespeed_modifier/carbon_crawling_additional
	multiplicative_slowdown = ADDITIONAL_SLOWDOWN
	flags = IGNORE_NOSLOW

#undef ADDITIONAL_SLOWDOWN
