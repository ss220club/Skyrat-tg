/obj/machinery/interrogator
	desc = "Морально ужасный механизм, используемый для извлечения человеческого разума в ключ аутентификации GoldenEye. Считается, что этот процесс является одним из самых болезненных, которые только можно пережить. Нажмите Alt+Click для запуска процесса."

/obj/machinery/interrogator/examine(mob/user)
	. = ..()
	. -= "It requies a direct link to a Nanotrasen defence network, stay near a Nanotrasen comms sat!"
	. += "Машине необходима прямая связь с защитной сетью Nanotrasen, находитесь близко к их сети телекоммуникаций!"

/obj/machinery/interrogator/attempt_extract(mob/user) // Overriden
	if(!occupant)
		balloon_alert_to_viewers("внутри пусто!")
		return
	if(state_open)
		balloon_alert_to_viewers("дверь открыта!")
		return
	if(!is_station_level(z))
		balloon_alert_to_viewers("нет связи!")
		return
	if(!ishuman(occupant))
		balloon_alert_to_viewers("не подходящее ДНК!")
		return
	human_occupant = occupant
	if(human_occupant.stat == DEAD && !HAS_TRAIT(human_occupant, TRAIT_DNR))
		balloon_alert_to_viewers("пользователь мертв!")
		return
	if(!SSgoldeneye.check_goldeneye_target(human_occupant.mind)) // Preventing abuse by method of duplication.
		balloon_alert_to_viewers("нет информации о GoldenEye!")
		playsound(src, 'sound/machines/scanbuzz.ogg', 100)
		return

	start_extract()

/obj/machinery/interrogator/start_extract() // Overriden
	to_chat(human_occupant, span_userdanger("Вы чувствуете, как вас охватывает ужас, когда слышите, как дверь на [src] закрывается!"))
	locked = TRUE
	processing = TRUE
	say("Начата процедура извлечения данных из ДНК!")
	timer_id = addtimer(CALLBACK(src, PROC_REF(stage_one)), rand(STAGE_PROCESS_TIME_LOWER, STAGE_PROCESS_TIME_UPPER), TIMER_STOPPABLE|TIMER_UNIQUE) //Random times so crew can't anticipate exactly when it will drop.
	update_appearance()

/obj/machinery/interrogator/stage_one() // Overriden
	if(!check_requirements())
		say("Критическая ошибка! Прерывание операции.")
		playsound(src, 'sound/machines/scanbuzz.ogg', 100)
		return
	to_chat(human_occupant, span_danger("Когда [src] приходит в действие, вы чувствуете, как вокруг вас разворачиваются холодные металлические ограничители, вы не можете двигаться!"))
	playsound(loc, 'sound/items/rped.ogg', 60)
	say("Стадия первая: завершена!")
	minor_announce("ОБНАРУЖЕНА БРЕШЬ В СИСТЕМЕ БЕЗОПАСНОСТИ, СЕТЬ ВЗЛОМАНА! МЕСТОПОЛОЖЕНИЕ НЕВОЗМОЖНО ОТСЛЕДИТЬ.", "Защитная сеть GoldenEye")
	timer_id = addtimer(CALLBACK(src, PROC_REF(stage_two)), rand(STAGE_PROCESS_TIME_LOWER, STAGE_PROCESS_TIME_UPPER), TIMER_STOPPABLE|TIMER_UNIQUE)

/obj/machinery/interrogator/stage_two() // Overriden
	if(!check_requirements())
		say("Критическая ошибка! Прерывание операции.")
		playsound(src, 'sound/machines/scanbuzz.ogg', 100)
		return
	to_chat(human_occupant, span_userdanger("Вы чувствуете резкую боль, когда сверло проникает в ваш череп, это невыносимо!"))
	human_occupant.emote("scream")
	human_occupant.apply_damage(30, BRUTE, BODY_ZONE_HEAD)
	playsound(src, 'sound/effects/wounds/blood1.ogg', 100)
	playsound(src, 'sound/items/drill_use.ogg', 100)
	say("Стадия два: завершена!")
	timer_id = addtimer(CALLBACK(src, PROC_REF(stage_three)), rand(STAGE_PROCESS_TIME_LOWER, STAGE_PROCESS_TIME_UPPER), TIMER_STOPPABLE|TIMER_UNIQUE)

/obj/machinery/interrogator/stage_three() // Overriden
	if(!check_requirements())
		say("Критическая ошибка! Прерывание операции.")
		playsound(src, 'sound/machines/scanbuzz.ogg', 100)
		return
	to_chat(human_occupant, span_userdanger("Вы чувствуете, как что-то проникает в ваш мозг, такое ощущение, что ваши детские воспоминания исчезают! Пожалуйста, прекратите это! После минутного молчания вы понимаете, что не можете вспомнить, что с вами произошло!"))
	human_occupant.emote("scream")
	human_occupant.apply_damage(20, BRUTE, BODY_ZONE_HEAD)
	human_occupant.set_jitter_if_lower(3 MINUTES)
	human_occupant.Unconscious(1 MINUTES)
	playsound(src, 'sound/effects/dismember.ogg', 100)
	playsound(src, 'sound/machines/ping.ogg', 100)
	say("Процесс завершен! Ключ отправлен на станцию! Экипаж вскоре обнаружит его!")
	send_keycard()
	processing = FALSE
	locked = FALSE
	update_appearance()
	addtimer(CALLBACK(src, PROC_REF(announce_creation)), ALERT_CREW_TIME)

/obj/machinery/interrogator/announce_creation() // Overriden
	priority_announce("ОБНАРУЖЕНА КРИТИЧЕСКАЯ БРЕШЬ В СИСТЕМЕ БЕЗОПАСНОСТИ! Ключ-карта аутентификации GoldenEye была незаконно извлечена и передана куда-то на станцию!", "Защитная сеть GoldenEye")
	for(var/obj/item/pinpointer/nuke/disk_pinpointers in GLOB.pinpointer_list)
		disk_pinpointers.switch_mode_to(TRACK_GOLDENEYE) //Pinpointer will track the newly created goldeneye key.
