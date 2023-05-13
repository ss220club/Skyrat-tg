/datum/controller/subsystem/goldeneye/check_condition() // Overriden
	if(uploaded_keys >= required_keys)
		activate()
		return
	priority_announce("ОБНАРУЖЕНА НЕСАНКЦИОНИРОВАННАЯ ЗАГРУЗКА КЛЮЧ-КАРТЫ. ЗАГРУЖЕНО КЛЮЧ-КАРТ: [uploaded_keys]/[required_keys].", "Защитная сеть GoldenEye")

/datum/controller/subsystem/goldeneye/activate() // Overriden
	var/message = "/// ЗАЩИТНАЯ СЕТЬ GOLDENEYE ВЗЛОМАНА /// \n \
	Обнаружен несанкционированный доступ к защитной сети GoldenEye. \n \
	ИКАРУС онлайн. \n \
	Обнаружен обход системы нацеливания... \n \
	Новая цель: /НТКС13/ \n \
	Огневые протоколы ИКАРУС активированы. \n \
	Время до выстрела: [ignition_time / (1 SECONDS)] seconds."

	priority_announce(message, "Защитная сеть GoldenEye", ANNOUNCER_ICARUS)
	goldeneye_activated = TRUE

	addtimer(CALLBACK(src, PROC_REF(fire_icarus)), ignition_time)

/obj/item/goldeneye_key
	desc = "Высококлассная ключ-карта для аутентификации в защитной сети GoldenEye компании Nanotrasen. Она кажется неразрушимой."

/obj/item/goldeneye_key/Initialize(mapload)
	. = ..()
	name = "\improper Ключ-карта для аутентификации GoldenEye: [goldeneye_tag]"

/obj/item/goldeneye_key/examine(mob/user)
	. = ..()
	. -= "The DNA data link belongs to: [extract_name]"
	. += "Информация из ДНК принадлежит: [extract_name]"

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
