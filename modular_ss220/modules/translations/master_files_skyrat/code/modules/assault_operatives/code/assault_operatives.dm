/datum/antagonist/assault_operative
	spawn_text = "Ваша миссия - напасть на НТКС13 и забрать все ключи от системы GoldenEye, которые вы можете, у находящихся на станции глав. \
	Используйте свой пинпоинтер, чтобы найти ключи от GoldenEye после того, как вы заберете их у указанных глав. Ключ будет отправлен дропподом. \
	Затем вы должны загрузить эти ключи в терминал загрузки GoldenEye на вашей станции. После того как вы выполните свою миссию, \
	защитная сеть GoldenEye падёт, и мы получим доступ к военным системам Nanotrasen. Удачи, агент."

/datum/team/assault_operatives/roundend_report() // Overriden
	var/list/parts = list()
	parts += "<span class='header'>Штурмовые оперативники:</span>"

	switch(get_result())
		if(ASSAULT_RESULT_WIN)
			parts += span_greentext("Штурмовые оперативники: Полная победа!")
			parts += "<B>Штурмовые оперативники успешно взломали и активировали GoldenEye, а также они все выжили!</B>"
		if(ASSAULT_RESULT_PARTIAL_WIN)
			parts += span_greentext("Штурмовые оперативники: Малая победа!")
			parts += "<B>Штурмовые оперативники успешно взломали и активировали GoldenEye, но не все выжили!</B>"
		if(ASSAULT_RESULT_HEARTY_WIN)
			parts += span_greentext("Штурмовые оперативники: Пиррова победа!")
			parts += "<B>Штурмовые оперативники успешно взломали и активировали GoldenEye, но они все погибли!</B>"
		if(ASSAULT_RESULT_LOSS)
			parts += span_redtext("Победа экипажа!")
			parts += "<B>Экипаж станции [station_name()] убили всех штурмовых оперативников и остановили активацию GoldenEye!</B>"
		if(ASSAULT_RESULT_STALEMATE)
			parts += "<span class='neutraltext big'>Ничья!</span>"
			parts += "<B>Штурмовые оперативники не смогли активировать GoldenEye, но все еще живы!</B>"
		else
			parts += "<span class='neutraltext big'>Нейтральная победа</span>"
			parts += "<B>Миссия отменена!</B>"
	parts += span_redtext("Ключей GoldenEye загружено: [SSgoldeneye.uploaded_keys]/[SSgoldeneye.required_keys]")

	var/text = "<br><span class='header'>Штурмовыми оперативниками были:</span>"
	text += printplayerlist(members)
	text += "<br>"

	parts += text

	return "<div class='panel redborder'>[parts.Join("<br>")]</div>"
