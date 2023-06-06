// Sidepaths for knowledge between Rust and Cosmos.

/datum/heretic_knowledge/essence
	name = "Priest's Ritual"
	desc = "Позволяет трансмутировать емкость с водой и осколок стекла в Колбу с мистической эссенцией. \
		Мистическую воду можно употреблять для мощного исцеления или давать язычникам для смертельного отравления."
	gain_text = "Это старый рецепт. Сова шепнула мне его. \
		Созданная Жрецом - Жидкость, которая есть, и которой нет."
	next_knowledge = list(
		/datum/heretic_knowledge/rust_regen,
		/datum/heretic_knowledge/spell/cosmic_runes,
		)
	required_atoms = list(
		/obj/structure/reagent_dispensers/watertank = 1,
		/obj/item/shard = 1,
	)
	result_atoms = list(/obj/item/reagent_containers/cup/beaker/eldritch)
	cost = 1
	route = PATH_SIDE

/datum/heretic_knowledge/curse/corrosion
	name = "Curse of Corrosion"
	desc = "Позволяет трансмутировать кусачки, лужу рвоты и сердце, чтобы наложить проклятие болезни на члена экипажа. \
		При проклятии жертву будет постоянно рвать, а ее органы будут получать постоянный урон. Вы можете дополнительно снабдить предмет \
		к которому прикоснулась жертва или который покрыт кровью жертвы, чтобы придать силу проклятию."
	gain_text = "Тело человечества временно. Их слабости невозможно остановить, как железо, поддающееся ржавчине. Покажите им."
	next_knowledge = list(
		/datum/heretic_knowledge/spell/area_conversion,
		/datum/heretic_knowledge/spell/star_blast,
	)
	required_atoms = list(
		/obj/item/wirecutters = 1,
		/obj/effect/decal/cleanable/vomit = 1,
		/obj/item/organ/internal/heart = 1,
	)
	duration = 0.5 MINUTES
	duration_modifier = 4
	curse_color = "#c1ffc9"
	cost = 1
	route = PATH_SIDE

/datum/heretic_knowledge/curse/corrosion/curse(mob/living/carbon/human/chosen_mob, boosted = FALSE)
	to_chat(chosen_mob, span_danger("Вы чувствуете себя очень плохо..."))
	chosen_mob.apply_status_effect(/datum/status_effect/corrosion_curse)
	return ..()

/datum/heretic_knowledge/curse/corrosion/uncurse(mob/living/carbon/human/chosen_mob, boosted = FALSE)
	if(QDELETED(chosen_mob))
		return

	chosen_mob.remove_status_effect(/datum/status_effect/corrosion_curse)
	to_chat(chosen_mob, span_green("Вы начинаете чувствовать себя лучше."))
	return ..()

/datum/heretic_knowledge/summon/rusty
	name = "Rusted Ritual"
	desc = "Позволяет трансмутировать лужу рвоты, книгу и голову в Ржавого ходока. \
		Ржавые ходоки превосходно распространяют ржавчину и умеренно сильны в бою."
	gain_text = "Я объединил свои знания о созидании с жаждой коррозии. Маршал знал мое имя, и Ржавые Холмы отозвались эхом."
	next_knowledge = list(
		/datum/heretic_knowledge/spell/entropic_plume,
		/datum/heretic_knowledge/spell/cosmic_expansion,
	)
	required_atoms = list(
		/obj/effect/decal/cleanable/vomit = 1,
		/obj/item/book = 1,
		/obj/item/bodypart/head = 1,
	)
	mob_to_summon = /mob/living/simple_animal/hostile/heretic_summon/rust_spirit
	cost = 1
	route = PATH_SIDE

/datum/heretic_knowledge/summon/rusty/cleanup_atoms(list/selected_atoms)
	var/obj/item/bodypart/head/ritual_head = locate() in selected_atoms
	if(!ritual_head)
		CRASH("[type] required a head bodypart, yet did not have one in selected_atoms when it reached cleanup_atoms.")

	// Spill out any brains or stuff before we delete it.
	ritual_head.drop_organs()
	return ..()
