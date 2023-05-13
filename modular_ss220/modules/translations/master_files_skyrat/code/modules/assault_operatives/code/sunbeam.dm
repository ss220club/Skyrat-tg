/obj/effect/sunbeam
	desc = "A beam of light from the sun."

/datum/round_event/icarus_sunbeam/announce(fake) // Overriden
	priority_announce("/// ICARUS SUNBEAM WEAPONS SYSTEM ACTIVATED, USE EXTREME CAUTION! ///", "GoldenEye Defence Network", ANNOUNCER_KLAXON)
	alert_sound_to_playing('modular_skyrat/modules/assault_operatives/sound/sunbeam_fire.ogg')
