/datum/job/prisoner/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	to_chat(player_client, span_boldwarning("Вы, будучи заключенным с начала раунда, не являетесь антагонистом. \
		Если вы хотите совершить побег без достаточной эскалации конфликта со службой безопасности, то напишите AdminHelp или заполните OpFor"))
