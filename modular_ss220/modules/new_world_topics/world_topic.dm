/datum/world_topic/status/Run(list/input)
	. = ..()
	admins = list()
	for(var/client/C in GLOB.clients)
		if(C.holder)
			if(C.holder.fakekey)
				continue	//so stealthmins aren't revealed by the hub
			admins += list(list(C.key, C.holder.rank))
	if(key_valid)
		for(var/i in 1 to admins.len)
			var/list/A = admins[i]
			.["admin[i - 1]"] = A[1]
			.["adminrank[i - 1]"] = A[2]

/datum/world_topic/fixtts
	topic_key = "fixtts"
	requires_commskey = TRUE


/datum/world_topic_handler/fixtts/Run(list/input, key_valid)
	var/datum/tts_provider/silero = SStts.tts_providers["Silero"]
	log_debug("SStts.tts_providers\[Silero].is_enabled = [silero.is_enabled]")

	if(!silero.is_enabled)
		silero.is_enabled = TRUE
		silero.failed_requests_limit += initial(silero.failed_requests_limit)
		to_chat(world, "<span class='announce'>SERVER: провайдер Silero в подсистеме SStts принудительно включен!</span>")
		return json_encode(list("success" = "SStts\[Silero] was force enabled"))
	return json_encode(list("error" = "SStts\[Silero] is already enabled"))
