/datum/world_topic/fixtts
	keyword = "fixtts"
	require_comms_key = TRUE

/datum/world_topic/fixtts/Run(list/input)
	var/datum/tts_provider/silero = SStts.tts_providers["Silero"]
	log_topic("SStts.tts_providers\[Silero].is_enabled = [silero.is_enabled]")
	if(!silero.is_enabled)
		silero.is_enabled = TRUE
		silero.failed_requests_limit += initial(silero.failed_requests_limit)
		to_chat(world, "<span class='announce'>SERVER: провайдер Silero в подсистеме SStts принудительно включен!</span>")
		return json_encode(list("success" = "SStts\[Silero] was force enabled"))
	return json_encode(list("error" = "SStts\[Silero] is already enabled"))

/datum/world_topic/playerlist
	keyword = "playerlist"

/datum/world_topic/playerlist/Run(list/input)
	var/list/keys = list()
	for(var/I in GLOB.clients)
		var/client/C = I
		keys += C.key

	return json_encode(keys)
