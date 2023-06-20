/datum/job/blueshield
	veteran_only = FALSE

/datum/job/blueshield/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	to_chat(player_client, span_boldwarning("Вы, будучи Синим щитом, не являетесь полноценным членом службы безопасности. \
		Ваша задача - защита глав станции. Поиск и отлов антагонистов, которые не несут прямую угрозы для глав, не входят в ваши обязанности."))
