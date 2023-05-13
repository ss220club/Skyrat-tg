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
	desc = "Высококлассная ключ-карта для аутентификации в защитной сети GoldenEye компании Nanotrasen. Она кажется неразрушимой."

/obj/item/goldeneye_key/Initialize(mapload)
	. = ..()
	name = "\improper Ключ-карта для аутентификации GoldenEye: [goldeneye_tag]"

/obj/machinery/goldeneye_upload_terminal
	desc = "Зловещий терминал с несколькими портами и клавиатурами, на экране прокручивается неразборчивая бессмыслица. На стороне у него странная маркировка - красное кольцо с золотым кругом внутри."

/obj/item/pinpointer/nuke/goldeneye
	desc = "Портативное устройство слежения, которое фиксирует определенные сигналы. Это устройство настроено на обнаружение любых ключ-карт GoldenEye."

/datum/objective/goldeneye
	objective_name = "Взломайте систему GoldenEye"
	explanation_text = "Извлеките все необходимые ключи аутентификации GoldenEye у глав станции и активируйте протокол GoldenEye."

/atom/movable/screen/alert/status_effect/goldeneye_pinpointer
	desc = "Еще более скрытный, чем обычный имплант, он указывает на выбранную ключ-карту GoldenEye."

/datum/status_effect/goldeneye_pinpointer/set_target(obj/item/new_target) // OVerriden
	target = new_target
	to_chat(owner, span_redtext("Интегрированный пинпоинтер указывает на: [target.name]"))
