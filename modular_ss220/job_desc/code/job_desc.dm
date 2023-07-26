/datum/job/prisoner/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	to_chat(player_client, span_boldwarning("Вы, будучи заключенным с начала раунда, не являетесь антагонистом. \
		Если вы хотите совершить побег без достаточной эскалации конфликта со службой безопасности, то напишите AdminHelp или заполните OpFor"))

/datum/job/blueshield/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	to_chat(player_client, span_boldwarning("Вы, будучи Синим щитом, не являетесь полноценным членом службы безопасности. \
		Ваша задача - защита глав станции. Поиск и отлов антагонистов, которые не несут прямую угрозы для глав, не входят в ваши обязанности."))

/datum/job/science_guard/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	to_chat(player_client, span_boldwarning("Вы, будучи охранником отдела, не являетесь полноценным членом службы безопасности. \
		Ваша рабочая территория - ваш отдел. Поиск и отлов антагонистов вне вашего отдела не входят в ваши обязанности."))

/datum/job/orderly/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	to_chat(player_client, span_boldwarning("Вы, будучи охранником отдела, не являетесь полноценным членом службы безопасности. \
		Ваша рабочая территория - ваш отдел. Поиск и отлов антагонистов вне вашего отдела не входят в ваши обязанности."))

/datum/job/engineering_guard/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	to_chat(player_client, span_boldwarning("Вы, будучи охранником отдела, не являетесь полноценным членом службы безопасности. \
		Ваша рабочая территория - ваш отдел. Поиск и отлов антагонистов вне вашего отдела не входят в ваши обязанности."))

/datum/job/customs_agent/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	to_chat(player_client, span_boldwarning("Вы, будучи охранником отдела, не являетесь полноценным членом службы безопасности. \
		Ваша рабочая территория - ваш отдел. Поиск и отлов антагонистов вне вашего отдела не входят в ваши обязанности."))

/datum/job/bouncer/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	to_chat(player_client, span_boldwarning("Вы, будучи охранником отдела, не являетесь полноценным членом службы безопасности. \
		Ваша рабочая территория - ваш отдел. Поиск и отлов антагонистов вне вашего отдела не входят в ваши обязанности."))

/datum/job/corrections_officer/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	to_chat(player_client, span_boldwarning("Вы, будучи коррекционным офицером, не являетесь офицером службы безопасности. \
		Коррекционный офицер - это не лицензия на избиение заключенных и превращение их жизни в ад, и не обязанность выступать в роли тюремного дворецкого. \
		Также, если вы не находитесь в чрезвычайных обстоятельствах, например, низкая численность СБ или ситуация \"свистать всех наверх\", вы не должны заниматься арестами."))
