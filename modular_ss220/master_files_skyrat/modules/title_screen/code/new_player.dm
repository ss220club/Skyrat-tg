/mob/dead/new_player/Topic(href, href_list[])
	if(src != usr)
		return

	if(!client)
		return

	if(client.interviewee)
		return FALSE

	if(href_list["observe"] || href_list["toggle_ready"] || href_list["late_join"])
		if (!client.prefs.discord_id)
			to_chat(usr, "<span class='danger'>Вам необходимо привязать дискорд-профиль к аккаунту!</span>")
			to_chat(usr, "<span class='warning'>Нажмите 'Verify Discord Account' во вкладке 'OOC' для получения инструкций.</span>")
			return FALSE

	..()
