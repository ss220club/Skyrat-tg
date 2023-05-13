/obj/machinery/interrogator
	desc = "A morraly corrupt piece of machinery used to extract the human mind into a GoldenEye authentication key. The process is said to be one of the most painful experiences someone can endure. Alt+click to start the process."

/obj/machinery/interrogator/attempt_extract(mob/user) // Overriden
	if(!occupant)
		balloon_alert_to_viewers("no occupant!")
		return
	if(state_open)
		balloon_alert_to_viewers("door open!")
		return
	if(!is_station_level(z))
		balloon_alert_to_viewers("no comms link!")
		return
	if(!ishuman(occupant))
		balloon_alert_to_viewers("invalid target DNA!")
		return
	human_occupant = occupant
	if(human_occupant.stat == DEAD && !HAS_TRAIT(human_occupant, TRAIT_DNR))
		balloon_alert_to_viewers("occupant is dead!")
		return
	if(!SSgoldeneye.check_goldeneye_target(human_occupant.mind)) // Preventing abuse by method of duplication.
		balloon_alert_to_viewers("no GoldenEye data!")
		playsound(src, 'sound/machines/scanbuzz.ogg', 100)
		return

	start_extract()

/obj/machinery/interrogator/start_extract() // Overriden
	to_chat(human_occupant, span_userdanger("You feel dread wash over you as you hear the door on [src] lock!"))
	locked = TRUE
	processing = TRUE
	say("Starting DNA data extraction!")
	timer_id = addtimer(CALLBACK(src, PROC_REF(stage_one)), rand(STAGE_PROCESS_TIME_LOWER, STAGE_PROCESS_TIME_UPPER), TIMER_STOPPABLE|TIMER_UNIQUE) //Random times so crew can't anticipate exactly when it will drop.
	update_appearance()

/obj/machinery/interrogator/stage_one() // Overriden
	if(!check_requirements())
		say("Critical error! Aborting.")
		playsound(src, 'sound/machines/scanbuzz.ogg', 100)
		return
	to_chat(human_occupant, span_danger("As [src] whirrs to life you feel some cold metal restraints deploy around you, you can't move!"))
	playsound(loc, 'sound/items/rped.ogg', 60)
	say("Stage one complete!")
	minor_announce("SECURITY BREACH DETECTED, NETWORK COMPROMISED! LOCATION UNTRACEABLE.", "GoldenEye Defence Network")
	timer_id = addtimer(CALLBACK(src, PROC_REF(stage_two)), rand(STAGE_PROCESS_TIME_LOWER, STAGE_PROCESS_TIME_UPPER), TIMER_STOPPABLE|TIMER_UNIQUE)

/obj/machinery/interrogator/stage_two() // Overriden
	if(!check_requirements())
		say("Critical error! Aborting.")
		playsound(src, 'sound/machines/scanbuzz.ogg', 100)
		return
	to_chat(human_occupant, span_userdanger("You feel a sharp pain as a drill penetrates your skull, it's unbearable!"))
	human_occupant.emote("scream")
	human_occupant.apply_damage(30, BRUTE, BODY_ZONE_HEAD)
	playsound(src, 'sound/effects/wounds/blood1.ogg', 100)
	playsound(src, 'sound/items/drill_use.ogg', 100)
	say("Stage two complete!")
	timer_id = addtimer(CALLBACK(src, PROC_REF(stage_three)), rand(STAGE_PROCESS_TIME_LOWER, STAGE_PROCESS_TIME_UPPER), TIMER_STOPPABLE|TIMER_UNIQUE)

/obj/machinery/interrogator/stage_three() // Overriden
	if(!check_requirements())
		say("Critical error! Aborting.")
		playsound(src, 'sound/machines/scanbuzz.ogg', 100)
		return
	to_chat(human_occupant, span_userdanger("You feel something penetrating your brain, it feels as though your childhood memories are fading! Please, make it stop! After a moment of silence, you realize you can't remember what happened to you!"))
	human_occupant.emote("scream")
	human_occupant.apply_damage(20, BRUTE, BODY_ZONE_HEAD)
	human_occupant.set_jitter_if_lower(3 MINUTES)
	human_occupant.Unconscious(1 MINUTES)
	playsound(src, 'sound/effects/dismember.ogg', 100)
	playsound(src, 'sound/machines/ping.ogg', 100)
	say("Process complete! A key is being sent aboard! Crew will shortly detect the keycard!")
	send_keycard()
	processing = FALSE
	locked = FALSE
	update_appearance()
	addtimer(CALLBACK(src, PROC_REF(announce_creation)), ALERT_CREW_TIME)

/obj/machinery/interrogator/announce_creation() // Overriden
	priority_announce("CRITICAL SECURITY BREACH DETECTED! A GoldenEye authentication keycard has been illegally extracted and is being sent in somewhere on the station!", "GoldenEye Defence Network")
	for(var/obj/item/pinpointer/nuke/disk_pinpointers in GLOB.pinpointer_list)
		disk_pinpointers.switch_mode_to(TRACK_GOLDENEYE) //Pinpointer will track the newly created goldeneye key.
