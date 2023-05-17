/mob/dead/new_player/Login()
	. = ..()
	if(GLOB.admin_notice)
		var/message = GLOB.admin_notice
		var/alert_time = world.time
		while(max(0, world.time - 20 SECONDS) < alert_time)
			tgui_alert(src, message, "Admin Notice", list(), max(0, alert_time + 20 SECONDS - world.time))
