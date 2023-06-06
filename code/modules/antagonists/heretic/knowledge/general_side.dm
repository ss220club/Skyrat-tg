// Some general sidepath options.

/datum/heretic_knowledge/reroll_targets
	name = "The Relentless Heartbeat"
	desc = "Позволяет трансмутировать колокольчик, книгу и джампсъют, стоя над руной, \
		чтобы изменить цели жертвоприношения."
	gain_text = "Сердце - это принцип, который пребывает и оберегает."
	required_atoms = list(
		/obj/item/food/grown/harebell = 1,
		/obj/item/book = 1,
		/obj/item/clothing/under = 1,
	)
	cost = 1
	route = PATH_SIDE

/datum/heretic_knowledge/reroll_targets/recipe_snowflake_check(mob/living/user, list/atoms, list/selected_atoms, turf/loc)

	var/datum/antagonist/heretic/heretic_datum = IS_HERETIC(user)
	// Check first if they have a Living Heart. If it's missing, we should
	// throw a fail to show the heretic that there's no point in rerolling
	// if you don't have a heart to track the targets in the first place.
	if(heretic_datum.has_living_heart() != HERETIC_HAS_LIVING_HEART)
		loc.balloon_alert(user, "ритуал провален, нет живого сердца!")
		return FALSE

	return TRUE

/datum/heretic_knowledge/reroll_targets/on_finished_recipe(mob/living/user, list/selected_atoms, turf/loc)
	var/datum/antagonist/heretic/heretic_datum = IS_HERETIC(user)
	for(var/mob/living/carbon/human/target as anything in heretic_datum.sac_targets)
		heretic_datum.remove_sacrifice_target(target)

	var/datum/heretic_knowledge/hunt_and_sacrifice/target_finder = heretic_datum.get_knowledge(/datum/heretic_knowledge/hunt_and_sacrifice)
	if(!target_finder)
		CRASH("Heretic datum didn't have a hunt_and_sacrifice knowledge learned, what?")

	if(!target_finder.obtain_targets(user, heretic_datum = heretic_datum))
		loc.balloon_alert(user, "ритуал провален, не удалось найти цели!")
		return FALSE

	return TRUE

/datum/heretic_knowledge/codex_cicatrix
	name = "Codex Cicatrix"
	desc = "Позволяет трансмутировать библию, авторучку и шкуру животного (или человека), чтобы создать Codex Cicatrix. \
		Codex Cicatrix можно использовать при истощении влияний для получения дополнительных знаний, но при этом возрастает риск быть замеченным. \
		Его также можно использовать для того, чтобы легче рисовать и удалять руны трансмутации."
	gain_text = "Оккультизм оставляет фрагменты знаний и силы везде и всюду. Codex Cicatrix - один из таких примеров. \
		В кожаном переплете и на старых страницах открывается путь к Мансусу."
	required_atoms = list(
		/obj/item/book/bible = 1,
		/obj/item/pen/fountain = 1,
		/obj/item/stack/sheet/animalhide = 1,
	)
	result_atoms = list(/obj/item/codex_cicatrix)
	cost = 1
	route = PATH_SIDE
