GLOBAL_LIST_EMPTY(goldeneye_pinpointers)

#define ICARUS_IGNITION_TIME (20 SECONDS)
#define PINPOINTER_PING_TIME (4 SECONDS)

/**
 * GoldenEye defence network
 *
 * Contains: Subsystem, Keycard, Terminal and Objective
 */

SUBSYSTEM_DEF(goldeneye)
	name = "GoldenEye"
	flags = SS_NO_FIRE | SS_NO_INIT
	/// A tracked list of all our keys.
	var/list/goldeneye_keys = list()
	/// A list of minds that have been extracted and thus cannot be extracted again.
	var/list/goldeneye_extracted_minds = list()
	/// How many keys have been uploaded to GoldenEye.
	var/uploaded_keys = 0
	/// How many keys do we need to activate GoldenEye? Can be overriden by Dynamic if there aren't enough heads of staff.
	var/required_keys = GOLDENEYE_REQUIRED_KEYS_MAXIMUM
	/// Have we been activated?
	var/goldeneye_activated = FALSE
	/// How long until ICARUS fires?
	var/ignition_time = ICARUS_IGNITION_TIME

/// A safe proc for adding a targets mind to the tracked extracted minds.
/datum/controller/subsystem/goldeneye/proc/extract_mind(datum/mind/target_mind)
	goldeneye_extracted_minds += target_mind

/// A safe proc for registering a new key to the goldeneye system.
/datum/controller/subsystem/goldeneye/proc/upload_key()
	uploaded_keys++
	check_condition()

/// Checks our activation condition after an upload has occured.
/datum/controller/subsystem/goldeneye/proc/check_condition()
	if(uploaded_keys >= required_keys)
		activate()
		return
	priority_announce("ОБНАРУЖЕНА НЕСАНКЦИОНИРОВАННАЯ ЗАГРУЗКА КЛЮЧ-КАРТЫ. ЗАГРУЖЕНО КЛЮЧ-КАРТ: [uploaded_keys]/[required_keys].", "Защитная сеть GoldenEye")

/// Activates goldeneye.
/datum/controller/subsystem/goldeneye/proc/activate()
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


/datum/controller/subsystem/goldeneye/proc/fire_icarus()
	var/datum/round_event_control/icarus_sunbeam/event_to_start = new()
	event_to_start.run_event()

/// Checks if a mind(target_mind) is a head and if they aren't in the goldeneye_extracted_minds list.
/datum/controller/subsystem/goldeneye/proc/check_goldeneye_target(datum/mind/target_mind)
	var/list/heads_list = SSjob.get_all_heads()
	for(var/datum/mind/iterating_mind as anything in heads_list)
		if(target_mind == iterating_mind) // We have a match, let's check if they've already been extracted.
			if(target_mind in goldeneye_extracted_minds) // They've already been extracted, no double extracts!
				return FALSE
			return TRUE
	return FALSE

// Goldeneye key
/obj/item/goldeneye_key
	name = "\improper Ключ-карта для аутентификации GoldenEye"
	desc = "Высококлассная ключ-карта для аутентификации в защитной сети GoldenEye компании Nanotrasen. Она кажется неразрушимой."
	icon = 'modular_skyrat/modules/assault_operatives/icons/goldeneye.dmi'
	icon_state = "goldeneye_key"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	max_integrity = INFINITY
	/// A unique tag that is used to identify this key.
	var/goldeneye_tag = "G00000"
	/// Flavour text for who's mind is in the key.
	var/extract_name = "NO DATA"

/obj/item/goldeneye_key/Initialize(mapload)
	. = ..()
	SSgoldeneye.goldeneye_keys += src
	goldeneye_tag = "G[rand(10000, 99999)]"
	name = "\improper Ключ-карта для аутентификации GoldenEye: [goldeneye_tag]"
	AddComponent(/datum/component/gps, goldeneye_tag)
	SSpoints_of_interest.make_point_of_interest(src)

/obj/item/goldeneye_key/examine(mob/user)
	. = ..()
	. += "Информация из ДНК принадлежит: [extract_name]"

/obj/item/goldeneye_key/Destroy(force)
	SSgoldeneye.goldeneye_keys -= src
	return ..()

// Upload terminal
/obj/machinery/goldeneye_upload_terminal
	name = "\improper GoldenEye Defnet Upload Terminal"
	desc = "Зловещий терминал с несколькими портами и клавиатурами, на экране прокручивается неразборчивая бессмыслица. На стороне у него странная маркировка - красное кольцо с золотым кругом внутри."
	icon = 'modular_skyrat/modules/assault_operatives/icons/goldeneye.dmi'
	icon_state = "goldeneye_terminal"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	density = TRUE
	/// Is the system currently in use? Used to prevent spam and abuse.
	var/uploading = FALSE


/obj/machinery/goldeneye_upload_terminal/attackby(obj/item/weapon, mob/user, params)
	. = ..()
	if(uploading)
		return
	if(!is_station_level(z))
		say("ОТСУТСТВУЕТ СВЯЗЬ С GOLDENEYE: Пожалуйста, вернитесь в зону действия телекоммуникаций.")
		playsound(src, 'sound/machines/nuke/angry_beep.ogg', 100)
		return
	if(!istype(weapon, /obj/item/goldeneye_key))
		say("ОШИБКА АУТЕНТИФИКАЦИИ: Пожалуйста, не вставляйте инородные объекты в терминал.")
		playsound(src, 'sound/machines/nuke/angry_beep.ogg', 100)
		return
	var/obj/item/goldeneye_key/inserting_key = weapon
	say("КЛЮЧ-КАРТА GOLDENEYE ПРИНЯТА: Пожалуйста, ожидайте, пока ключ-карта проходит проверку...")
	playsound(src, 'sound/machines/nuke/general_beep.ogg', 100)
	uploading = TRUE
	if(do_after(user, 10 SECONDS, src))
		say("КЛЮЧ-КАРТА GOLDENEYE: ПОДТВЕРЖДЕНА!")
		playsound(src, 'sound/machines/nuke/confirm_beep.ogg', 100)
		SSgoldeneye.upload_key()
		uploading = FALSE
		qdel(inserting_key)
	else
		say("КЛЮЧ-КАРТА GOLDENEYE: ПРОВЕРКА НЕ ПРОЙДЕНА. Пожалуйста, попробуйте снова.")
		playsound(src, 'sound/machines/nuke/angry_beep.ogg', 100)
		uploading = FALSE

// Pinpointer
/obj/item/pinpointer/nuke/goldeneye
	name = "\improper Пин-поинтер ключ-карт GoldenEye"
	desc = "Портативное устройство слежения, которое фиксирует определенные сигналы. Это устройство настроено на обнаружение любых ключ-карт GoldenEye."
	icon_state = "pinpointer_syndicate"
	worn_icon_state = "pinpointer_black"
	active = TRUE
	mode = TRACK_GOLDENEYE

/obj/item/pinpointer/nuke/goldeneye/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSfastprocess, src)

/obj/item/pinpointer/nuke/goldeneye/attack_self(mob/living/user)
	if(!LAZYLEN(SSgoldeneye.goldeneye_keys))
		to_chat(user, span_danger("ОШИБКА! Не обнаружены ключи GoldenEye!"))
		return
	target = tgui_input_list(user, "Выберите ключ-карту GoldenEye для трекинга", "Ключ-карта GoldenEye", SSgoldeneye.goldeneye_keys)
	if(target)
		to_chat(user, span_notice("Трекинг: [target.name]"))

/obj/item/pinpointer/nuke/goldeneye/scan_for_target()
	if(QDELETED(target))
		target = null

// Objective
/datum/objective/goldeneye
	name = "subvert goldeneye"
	objective_name = "Взломайте систему GoldenEye"
	explanation_text = "Извлеките все необходимые ключи аутентификации GoldenEye у глав станции и активируйте протокол GoldenEye."
	martyr_compatible = TRUE

/datum/objective/goldeneye/check_completion()
	if(SSgoldeneye.goldeneye_activated)
		return TRUE
	return FALSE

// Internal pinpointer


/atom/movable/screen/alert/status_effect/goldeneye_pinpointer
	name = "Интегрированный пинпоинтер"
	desc = "Еще более скрытный, чем обычный имплант, он указывает на выбранную ключ-карту GoldenEye."
	icon = 'icons/obj/device.dmi'
	icon_state = "pinon"

/datum/status_effect/goldeneye_pinpointer
	id = "goldeneye_pinpointer"
	duration = -1
	tick_interval = PINPOINTER_PING_TIME
	alert_type = /atom/movable/screen/alert/status_effect/goldeneye_pinpointer
	/// The range until you're considered 'close'
	var/range_mid = 8
	/// The range until you're considered 'too far away'
	var/range_far = 16
	/// The target we are pointing towards, refreshes every tick.
	var/obj/item/target
	/// Our linked antagonist datum, if any.
	var/datum/antagonist/assault_operative/linked_antagonist

/datum/status_effect/goldeneye_pinpointer/New(list/arguments)
	GLOB.goldeneye_pinpointers += src
	return ..()

/datum/status_effect/goldeneye_pinpointer/Destroy()
	GLOB.goldeneye_pinpointers -= src
	if(linked_antagonist)
		linked_antagonist.pinpointer = null
		linked_antagonist = null
	return ..()

/datum/status_effect/goldeneye_pinpointer/tick()
	if(!owner)
		qdel(src)
		return
	point_to_target()

///Show the distance and direction of a scanned target
/datum/status_effect/goldeneye_pinpointer/proc/point_to_target()
	if(QDELETED(target))
		linked_alert.icon_state = "pinonnull"
		target = null
		return
	if(!target)
		linked_alert.icon_state = "pinonnull"
		return

	var/turf/here = get_turf(owner)
	var/turf/there = get_turf(target)

	if(!here || !there)
		linked_alert.icon_state = "pinonnull"
		return
	if(here.z != there.z)
		linked_alert.icon_state = "pinonnull"
		return
	if(!get_dist_euclidian(here,there))
		linked_alert.icon_state = "pinondirect"
		return
	linked_alert.setDir(get_dir(here, there))

	var/dist = (get_dist(here, there))
	if(dist >= 1 && dist <= range_mid)
		linked_alert.icon_state = "pinonclose"
	else if(dist > range_mid && dist <= range_far)
		linked_alert.icon_state = "pinonmedium"
	else if(dist > range_far)
		linked_alert.icon_state = "pinonfar"


/datum/status_effect/goldeneye_pinpointer/proc/set_target(obj/item/new_target)
	target = new_target
	to_chat(owner, span_redtext("Интегрированный пинпоинтер указывает на: [target.name]"))

#undef ICARUS_IGNITION_TIME
#undef PINPOINTER_PING_TIME
