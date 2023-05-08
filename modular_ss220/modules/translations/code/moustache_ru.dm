/obj/item/clothing/mask/fakemoustache
	name = "накладные усы"
	desc = "Осторожно: усы накладные."

/obj/item/clothing/mask/fakemoustache/italian
	name = "итальянские усы"
	desc = "Изготовлен из настоящих итальянских волосков для усов. Дает владельцу непреодолимое желание дико жестикулировать."

/obj/item/clothing/mask/fakemoustache/italian/handle_speech(datum/source, list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	if(message[1] != "*")
		message = " [message]"
		var/list/italian_words = strings("italian_replacement_ru.json", "italian")

		for(var/key in italian_words)
			var/value = italian_words[key]
			if(islist(value))
				value = pick(value)

			message = replacetextEx(message, " [uppertext(key)]", " [uppertext(value)]")
			message = replacetextEx(message, " [capitalize(key)]", " [capitalize(value)]")
			message = replacetextEx(message, " [key]", " [value]")

		if(prob(3))
			message += pick(" Равиоли, равиоли, подскажи мне формуоли!"," Мамма-мия!"," Мамма-мия! Какая острая фрикаделька!", " Ла ла ла ла ла фуникули+ фуникуля+!")
	speech_args[SPEECH_MESSAGE] = trim(message)
