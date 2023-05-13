/obj/effect/sunbeam
	desc = "Луч света, прямиком от солнца."

/datum/round_event/icarus_sunbeam/announce(fake) // Overriden
	priority_announce("/// АКТИВИРОВАНА СИСТЕМА ВООРУЖЕНИЯ ИКАРУСА \"СОЛНЕЧНЫЙ ЛУЧ\", СОБЛЮДАЙТЕ ПРЕДЕЛЬНУЮ ОСТОРОЖНОСТЬ! ///", "GoldenEye Defence Network", ANNOUNCER_KLAXON)
	alert_sound_to_playing('modular_skyrat/modules/assault_operatives/sound/sunbeam_fire.ogg')
