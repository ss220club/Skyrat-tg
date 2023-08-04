/obj/machinery/autorole
	name = "Автороль - ДЕБАГ (НЕ ДЛЯ ИГРОКОВ)"
	desc = "Машина для преобразования снаряжения под заданный стиль авторолера."
	icon = 'modular_ss220/awaymissions_raid/icons/autodoc.dmi'
	icon_state = "powered_on"
	base_icon_state = "powered_off"
	var/icon_active = "active"

	occupant_typecache = list(/mob/living/carbon/human)
	use_power = NO_POWER_USE
	is_operational = FALSE
	max_integrity = 2000
	density = FALSE
	state_open = TRUE
	processing_flags = NONE

	var/breakout_time = 5 SECONDS
	/// Список всех работ для замены, ключи = типы, значения = outfit
	var/list/datum/outfit/autorole/type_occupations = list()

/obj/machinery/autorole/Initialize(mapload)
	. = ..()
	SetupOccupations()

/obj/machinery/autorole/proc/SetupOccupations()
	//type_occupations[job_type] = /datum/outfit/autorole/...
	type_occupations = list()
	type_occupations[JOB_CAPTAIN] = /datum/outfit/autorole/debug


/obj/machinery/autorole/examine(mob/user)
	. = ..()
	if(occupant)
		. += span_notice("В машине автоматической замены снаряжения находится: [occupant].")

/obj/machinery/autorole/update_icon_state()
	//no power or maintenance
	if((use_power != NO_POWER_USE) && (NOPOWER|BROKEN))
		icon_state = base_icon_state
		return ..()

	//running and someone in there
	if(occupant)
		icon_state = icon_active
		return ..()

	//running
	icon_state = initial(icon_state)
	return ..()

/obj/machinery/autorole/interact(mob/user)
	if(!occupant)
		return
	if(occupant == user || do_after(user,(breakout_time), target = src))
		open_machine()

/obj/machinery/autorole/container_resist_act(mob/living/user)
	open_machine()

/obj/machinery/autorole/MouseDrop_T(mob/target, mob/user)
	if(user.stat != CONSCIOUS || HAS_TRAIT(user, TRAIT_UI_BLOCKED) || !Adjacent(user) || !user.Adjacent(target) || !ishuman(target) || !ISADVANCEDTOOLUSER(user))
		return
	close_machine(target)

/obj/machinery/autorole/close_machine(mob/living/carbon/human/H, density_to_set = TRUE)
	if(!state_open)
		return FALSE

	..(H)

	if(!setup_outfit(H))
		open_machine()
		playsound(src, 'sound/machines/buzz-sigh.ogg', 50, FALSE)
		return FALSE

	return TRUE

/obj/machinery/autorole/proc/setup_outfit(mob/living/carbon/human/H)
	var/obj/item/card/id/card = H.get_idcard()

	if(!card)
		to_chat(H, "<span class='danger'>Отсутствует идентификационная карта!</span>")
		return FALSE
	var/datum/job/job = card.trim.assignment // H.job
	var/outfit_type = type_occupations[job]  //BYOND won't directly read if this is just put in the line below, and will instead runtime because it thinks you're trying to make a new list?
	if(!outfit_type)
		to_chat(H, "<span class='danger'>Не найдена замена для этой роли!</span>")
		return FALSE

	var/datum/outfit/autorole/new_outfit = new outfit_type

	if(card.assignment == new_outfit.name)
		to_chat(H, "<span class='danger'>На вас уже зарегистрирована должность!</span>")
		return FALSE

	playsound(loc, 'sound/machines/click.ogg', 15, TRUE, -3)
	if(new_outfit.uniform && !storage_current_items(H, card))
		to_chat(H, "<span class='danger'>Прервана процедура смены снаряжения!</span>")
		return FALSE

	to_chat(H, "<span class='notice'>Начинаем процесс регистрации должности\"[new_outfit.name]\"!</span>")
	playsound(loc, 'sound/effects/spray3.ogg', 50, TRUE, -6)
	if(!(occupant && do_after(H,(breakout_time), target = src)))
		to_chat(H, "<span class='danger'>Внимание! Прерван процесс регистрации должности \"[new_outfit.name]\"!</span>")
		return FALSE

	if(isplasmaman(H))	//IM BUUURN!!!
		H.equipOutfit(job.plasmaman_outfit)
		H.open_internals(H.get_item_for_held_index(2))

	H.equipOutfit(new_outfit)
	H.equip_to_slot(card, ITEM_SLOT_ID)

	// === CARD ===
	card.registered_name = H.real_name
	card.assignment = new_outfit.name
	card.update_label()

	if(new_outfit.is_badget)
		// меняем иконку
		card.icon = new_outfit.card_icon
		card.icon_state = new_outfit.card_icon_state

		// Убираем значок
		card.trim.trim_state = null
		card.trim.department_color = "#008000"
		card.trim.subdepartment_color = "#008000"

	card.update_icon()
	H.regenerate_icons()

	open_machine()
	to_chat(H, "<span class='notice'>Вами зарегистрирована должности \"[card.assignment]\"!</span>")
	playsound(src, 'sound/machines/eject.ogg', 50, FALSE)
	return TRUE

/obj/machinery/autorole/proc/storage_current_items(mob/living/carbon/human/H, obj/item/card/id/card)
	var/answer_drop = "Выбросить на землю"
	var/answer_cancel = "Отменить"
	//var/answer_delete = "Удалить"
	var/choose = tgui_alert(usr,"Что делать с снаряжением надетым на вас?", "Снаряжение", list(answer_drop, /*answer_delete,*/ answer_cancel))

	if(choose == answer_cancel)
		return FALSE

	//H.drop_all_held_items()
	var/list/items = H.get_equipped_items(TRUE)
	items.Remove(card)	// не самое умное решение. Но это для одного лишь ивента =/

	if(choose == answer_drop)
		for(var/obj/item/item in items)
			H.dropItemToGround(item, TRUE)
		// if(choose == answer_delete)
		// 	//H.delete_equipment()
		// 	for(var/obj/item/item in items)
		// 		qdel(item)
	H.update_mob_action_buttons()
	return TRUE
	// if("Выбросить содержимое карманов")
	// 	H.dropItemToGround(H.s_store, TRUE)
	// 	H.dropItemToGround(H.r_store, TRUE)
	// 	H.dropItemToGround(H.l_store, TRUE)
	// 	H.dropItemToGround(H.belt)



// ========================
// 		OCCUPATIONS
// ========================

/obj/machinery/autorole/cp
	name = "Автороль - CO. Передовое Управление Пространственных Сил"

/obj/machinery/autorole/cp/SetupOccupations()
	. = ..()

	//No department
	type_occupations[JOB_ASSISTANT] = /datum/outfit/autorole/cp/field
	type_occupations[JOB_PRISONER] = /datum/outfit/autorole/cp/prisoner

	//Command
	type_occupations[JOB_CAPTAIN] = /datum/outfit/autorole/cp/com/commandant
	type_occupations[JOB_HEAD_OF_PERSONNEL] = /datum/outfit/autorole/cp/com/commass
	type_occupations[JOB_HEAD_OF_SECURITY] = /datum/outfit/autorole/cp/com/commandor
	type_occupations[JOB_RESEARCH_DIRECTOR] = /datum/outfit/autorole/cp/com/sci
	type_occupations[JOB_CHIEF_ENGINEER] = /datum/outfit/autorole/cp/com/tech
	type_occupations[JOB_CHIEF_MEDICAL_OFFICER] = /datum/outfit/autorole/cp/com/med

	type_occupations[JOB_BLUESHIELD] = /datum/outfit/autorole/cp/operative/solarshield
	type_occupations[JOB_NT_REP] = /datum/outfit/autorole/cp/com/inspector

	//Security
	type_occupations[JOB_WARDEN] = /datum/outfit/autorole/cp/operative/brigade
	type_occupations[JOB_DETECTIVE] = /datum/outfit/autorole/cp/operative/scout
	type_occupations[JOB_SECURITY_OFFICER] = /datum/outfit/autorole/cp/operative
	type_occupations[JOB_SECURITY_OFFICER_MEDICAL] = /datum/outfit/autorole/cp/operative
	type_occupations[JOB_SECURITY_OFFICER_ENGINEERING] = /datum/outfit/autorole/cp/operative
	type_occupations[JOB_SECURITY_OFFICER_SCIENCE] = /datum/outfit/autorole/cp/operative
	type_occupations[JOB_SECURITY_OFFICER_SUPPLY] = /datum/outfit/autorole/cp/operative
	type_occupations[JOB_CORRECTIONS_OFFICER] = /datum/outfit/autorole/cp/operative/interrogator

	//Engineering
	type_occupations[JOB_STATION_ENGINEER] = /datum/outfit/autorole/cp/tech
	type_occupations[JOB_ATMOSPHERIC_TECHNICIAN] = /datum/outfit/autorole/cp/tech/atmos
	type_occupations[JOB_ENGINEERING_GUARD] = /datum/outfit/autorole/cp/operative/guard/supply

	//Medical
	type_occupations[JOB_CORONER] = /datum/outfit/autorole/cp/sci/bio/collector
	type_occupations[JOB_MEDICAL_DOCTOR] = /datum/outfit/autorole/cp/sci/med
	type_occupations[JOB_PARAMEDIC] = /datum/outfit/autorole/cp/sci/med/field
	type_occupations[JOB_CHEMIST] = /datum/outfit/autorole/cp/sci
	type_occupations[JOB_VIROLOGIST] = /datum/outfit/autorole/cp/sci/bio
	type_occupations[JOB_ORDERLY] = /datum/outfit/autorole/cp/operative/guard/science

	//Science
	type_occupations[JOB_SCIENTIST] = /datum/outfit/autorole/cp/sci
	type_occupations[JOB_ROBOTICIST] = /datum/outfit/autorole/cp/sci/tech
	type_occupations[JOB_GENETICIST] = /datum/outfit/autorole/cp/sci/bio
	type_occupations[JOB_SCIENCE_GUARD] = /datum/outfit/autorole/cp/operative/guard/science

	//Supply
	type_occupations[JOB_QUARTERMASTER] = /datum/outfit/autorole/cp/com/qm
	type_occupations[JOB_CARGO_TECHNICIAN] = /datum/outfit/autorole/cp/tech/cargo
	type_occupations[JOB_SHAFT_MINER] = /datum/outfit/autorole/cp/operative/heavy
	type_occupations[JOB_CUSTOMS_AGENT] = /datum/outfit/autorole/cp/tech/cargo/inspector

	//Service
	type_occupations[JOB_BARTENDER] = /datum/outfit/autorole/cp/field
	type_occupations[JOB_BOTANIST] = /datum/outfit/autorole/cp/field
	type_occupations[JOB_COOK] = /datum/outfit/autorole/cp/field/cook
	type_occupations[JOB_JANITOR] = /datum/outfit/autorole/cp/sci/bio/collector
	type_occupations[JOB_CLOWN] = /datum/outfit/autorole/cp/field/clown
	type_occupations[JOB_MIME] = /datum/outfit/autorole/cp/field/mime
	type_occupations[JOB_CURATOR] = /datum/outfit/autorole/cp/field/reporter
	type_occupations[JOB_LAWYER] = /datum/outfit/autorole/cp/field/adviser
	type_occupations[JOB_CHAPLAIN] = /datum/outfit/autorole/cp/field/priest
	type_occupations[JOB_PSYCHOLOGIST] = /datum/outfit/autorole/cp/field/psych
	type_occupations[JOB_BARBER] = /datum/outfit/autorole/cp/field/barber
	type_occupations[JOB_BOUNCER] = /datum/outfit/autorole/cp/operative/guard/supply	// Service Guard
