/datum/job/corrections_officer/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	to_chat(player_client, span_boldwarning("Вы, будучи коррекционным офицером, не являетесь офицером службы безопасности. \
		Коррекционный офицер - это не лицензия на избиение заключенных и превращение их жизни в ад, и не обязанность выступать в роли тюремного дворецкого. \
		Также, если вы не находитесь в чрезвычайных обстоятельствах, например, низкая численность СБ или ситуация \"свистать всех наверх\", вы не должны заниматься арестами."))
