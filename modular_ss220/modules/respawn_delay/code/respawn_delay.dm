// Respawn delay in minutes
/datum/config_entry/number/respawn_delay
	default = 0

/mob/dead/observer
	var/timeofdeath = 0

/mob/dead/observer/Login()
	. = ..()
	if(. && client)
		timeofdeath = world.time

/mob/proc/check_respawn_delay()
	var/deathtime = 0
	if(mind?.current)
		deathtime = world.time - mind.current.timeofdeath
	if(!deathtime && isobserver(src))
		var/mob/dead/observer/user = src
		deathtime = world.time - user.timeofdeath
	if(deathtime && deathtime < CONFIG_GET(number/respawn_delay) MINUTES)
		if(!check_rights_for(usr.client, R_ADMIN))
			to_chat(usr, "You have been dead for [round(deathtime / (1 SECONDS), 1)] seconds.")
			to_chat(usr, span_warning("You must wait [CONFIG_GET(number/respawn_delay)] minutes to respawn!"))
			return FALSE
		if(tgui_alert(usr, "You have been dead for [round(deathtime / (1 SECONDS), 1)] seconds out of required [CONFIG_GET(number/respawn_delay)] minutes. Do you want to use your permissions to circumvent it?", "Respawn", list("Yes", "No")) != "Yes")
			return FALSE
	return TRUE
