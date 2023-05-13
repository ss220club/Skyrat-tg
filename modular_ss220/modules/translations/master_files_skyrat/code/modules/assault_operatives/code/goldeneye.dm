/datum/controller/subsystem/goldeneye/check_condition() // Overriden
	if(uploaded_keys >= required_keys)
		activate()
		return
	priority_announce("UNAUTHORISED KEYCARD UPLOAD DETECTED. [uploaded_keys]/[required_keys] KEYCARDS UPLOADED.", "GoldenEye Defence Network")

/datum/controller/subsystem/goldeneye/activate() // Overriden
	var/message = "/// GOLDENEYE DEFENCE NETWORK BREACHED /// \n \
	Unauthorised GoldenEye Defence Network access detected. \n \
	ICARUS online. \n \
	Targeting system override detected... \n \
	New target: /NTSS13/ \n \
	ICARUS firing protocols activated. \n \
	ETA to fire: [ignition_time / 10] seconds."

	priority_announce(message, "GoldenEye Defence Network", ANNOUNCER_ICARUS)
	goldeneye_activated = TRUE

	addtimer(CALLBACK(src, PROC_REF(fire_icarus)), ignition_time)

/obj/item/goldeneye_key
	desc = "A high profile authentication keycard to Nanotrasen's GoldenEye defence network. It seems indestructible."

/obj/item/goldeneye_key/Initialize(mapload)
	. = ..()
	name = "\improper GoldenEye authentication keycard: [goldeneye_tag]"

/obj/machinery/goldeneye_upload_terminal
	desc = "An ominous terminal with some ports and keypads, the screen is scrolling with illegible nonsense. It has a strange marking on the side, a red ring with a gold circle within."

/obj/item/pinpointer/nuke/goldeneye
	desc = "A handheld tracking device that locks onto certain signals. This one is configured to locate any GoldenEye keycards."

/datum/objective/goldeneye
	objective_name = "Subvert GoldenEye"
	explanation_text = "Extract all of the required GoldenEye authentication keys from the heads of staff and activate GoldenEye."

/atom/movable/screen/alert/status_effect/goldeneye_pinpointer
	desc = "Even stealthier than a normal implant, it points to a selected GoldenEye keycard."

/datum/status_effect/goldeneye_pinpointer/set_target(obj/item/new_target) // OVerriden
	target = new_target
	to_chat(owner, span_redtext("Integrated pinpointer set to: [target.name]"))
