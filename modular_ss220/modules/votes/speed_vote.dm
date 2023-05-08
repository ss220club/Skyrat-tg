#define SPEED_PARADISE "Paradise (slow)"
#define SPEED_SKYRAT "Skyrat (fast)"

/datum/vote/speed_vote
	name = "Mob Speed"
	message = "Vote for the mob's speed!"
	count_method = VOTE_COUNT_METHOD_SINGLE
	default_choices = list(SPEED_PARADISE, SPEED_SKYRAT)

/datum/vote/speed_vote/is_config_enabled()
	return FALSE

/datum/vote/speed_vote/finalize_vote(winning_option)
	switch(winning_option)
		if(SPEED_PARADISE)
			set_paradise_speed()
		if(SPEED_SKYRAT)
			set_skyrat_speed()

/datum/vote/speed_vote/proc/set_paradise_speed()
	CONFIG_SET(number/movedelay/run_delay, 2.5)
	CONFIG_SET(number/movedelay/walk_delay, 5)
	CONFIG_SET(flag/additional_crawl_slowdown, TRUE)

/datum/vote/speed_vote/proc/set_skyrat_speed()
	CONFIG_SET(number/movedelay/run_delay, 1.8)
	CONFIG_SET(number/movedelay/walk_delay, 2.5)
	CONFIG_SET(flag/additional_crawl_slowdown, FALSE)

#undef SPEED_PARADISE
#undef SPEED_SKYRAT
