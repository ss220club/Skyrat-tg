/datum/antagonist/assault_operative
	spawn_text = "Your mission is to assault NTSS13 and get all of the GoldenEye keys that you can from the heads of staff that reside there. \
	Use your pinpointer to locate these after you have extracted the GoldenEye key from the head of staff. It will be sent in by droppod. \
	You must then upload the key to the GoldenEye upload terminal on this GoldenEye station. After you have completed your mission, \
	The GoldenEye defence network will fall, and we will gain access to Nanotrasen's military systems. Good luck agent."

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
