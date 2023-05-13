/datum/antagonist/assault_operative
	spawn_text = "Ваша миссия - напасть на НТКС13 и забрать все ключи от GoldenEye, которые вы можете, у глав станции, которые там находятся. \
	Используйте свой пинпоинтер, чтобы найти их после того, как вы заберете ключ от GoldenEye у указанных глав. Ключ будет отправлен дропподом. \
	Затем вы должны загрузить его в терминал загрузки GoldenEye на этой станции GoldenEye. После того, как вы выполните свою миссию, \
	защитная сеть GoldenEye падёт, и мы получим доступ к военным системам Nanotrasen. Удачи, агент."

/datum/team/assault_operatives/roundend_report() // Overriden
	var/list/parts = list()
	parts += "<span class='header'>Assault Operatives:</span>"

	switch(get_result())
		if(ASSAULT_RESULT_WIN)
			parts += span_greentext("Assault Operatives Major Victory!")
			parts += "<B>The Assault Operatives have successfully subverted and activated GoldenEye, and they all survived!</B>"
		if(ASSAULT_RESULT_PARTIAL_WIN)
			parts += span_greentext("Assault Operatives Minor Victory!")
			parts += "<B>The Assault Operatives have successfully subverted and activated GoldenEye, but only some survived!</B>"
		if(ASSAULT_RESULT_HEARTY_WIN)
			parts += span_greentext("Assault Operatives Hearty Victory!")
			parts += "<B>The Assault Operatives have successfully subverted and activated GoldenEye, but they all died!</B>"
		if(ASSAULT_RESULT_LOSS)
			parts += span_redtext("Crew Victory!")
			parts += "<B>The Research Staff of [station_name()] have killed all of the assault operatives and stopped them activating GoldenEye!</B>"
		if(ASSAULT_RESULT_STALEMATE)
			parts += "<span class='neutraltext big'>Stalemate!</span>"
			parts += "<B>The assault operatives have failed to activate GoldenEye and are still alive!</B>"
		else
			parts += "<span class='neutraltext big'>Neutral Victory</span>"
			parts += "<B>Mission aborted!</B>"
	parts += span_redtext("GoldenEye keys uploaded: [SSgoldeneye.uploaded_keys]/[SSgoldeneye.required_keys]")

	var/text = "<br><span class='header'>The assault operatives were:</span>"
	text += printplayerlist(members)
	text += "<br>"

	parts += text

	return "<div class='panel redborder'>[parts.Join("<br>")]</div>"
