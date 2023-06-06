/// The max amount of health a ghoul has.
#define GHOUL_MAX_HEALTH 25
/// The max amount of health a voiceless dead has.
#define MUTE_MAX_HEALTH 50

/**
 * # The path of Flesh.
 *
 * Goes as follows:
 *
 * Principle of Hunger
 * Grasp of Flesh
 * Imperfect Ritual
 * > Sidepaths:
 *   Void Cloak
 *   Ashen Eyes
 *
 * Mark of Flesh
 * Ritual of Knowledge
 * Flesh Surgery
 * Raw Ritual
 * > Sidepaths:
 *   Blood Siphon
 *   Curse of Paralysis
 *
 * Bleeding Steel
 * Lonely Ritual
 * > Sidepaths:
 *   Ashen Ritual
 *   Cleave
 *
 * Priest's Final Hymn
 */
/datum/heretic_knowledge/limited_amount/starting/base_flesh
	name = "Principle of Hunger"
	desc = "Открывает перед вами Путь плоти. \
		Позволяет трансмутировать нож и лужу крови в Кровавый клинок. \
		Одновременно можно иметь только двадцать." //SKYRAT EDIT three to twenty
	gain_text = "Сотни наших умирали от голода, но не я... Я нашел силу в своей жадности."
	next_knowledge = list(/datum/heretic_knowledge/limited_amount/flesh_grasp)
	required_atoms = list(
		/obj/item/knife = 1,
		/obj/effect/decal/cleanable/blood = 1,
	)
	result_atoms = list(/obj/item/melee/sickly_blade/flesh)
	limit = 3 // Bumped up so they can arm up their ghouls too.
	route = PATH_FLESH

/datum/heretic_knowledge/limited_amount/starting/base_flesh/on_research(mob/user, datum/antagonist/heretic/our_heretic)
	. = ..()
	var/datum/objective/heretic_summon/summon_objective = new()
	summon_objective.owner = our_heretic.owner
	our_heretic.objectives += summon_objective

	to_chat(user, span_hierophant("Пройдя Путь плоти, вы получаете еще одну цель."))
	our_heretic.owner.announce_objectives()

/datum/heretic_knowledge/limited_amount/flesh_grasp
	name = "Grasp of Flesh"
	desc = "Ваша хватка Мансуса получает способность создавать гуля из трупа с душой. \
		Гули имеют всего 25 здоровья и выглядят как хаски в глазах язычников, но могут эффективно использовать Кровавые клинки. \
		Используя этот способ, можно иметь только одного."
	gain_text = "Мои новообретенные желания заставляли меня достигать все больших и больших высот."
	next_knowledge = list(/datum/heretic_knowledge/limited_amount/flesh_ghoul)
	limit = 1
	cost = 1
	route = PATH_FLESH

/datum/heretic_knowledge/limited_amount/flesh_grasp/on_gain(mob/user, datum/antagonist/heretic/our_heretic)
	RegisterSignal(user, COMSIG_HERETIC_MANSUS_GRASP_ATTACK, PROC_REF(on_mansus_grasp))

/datum/heretic_knowledge/limited_amount/flesh_grasp/on_lose(mob/user, datum/antagonist/heretic/our_heretic)
	UnregisterSignal(user, COMSIG_HERETIC_MANSUS_GRASP_ATTACK)

/datum/heretic_knowledge/limited_amount/flesh_grasp/proc/on_mansus_grasp(mob/living/source, mob/living/target)
	SIGNAL_HANDLER

	if(target.stat != DEAD)
		return

	if(LAZYLEN(created_items) >= limit)
		target.balloon_alert(source, "лимит гулей!")
		return COMPONENT_BLOCK_HAND_USE

	if(HAS_TRAIT(target, TRAIT_HUSK))
		target.balloon_alert(source, "это хаск!")
		return COMPONENT_BLOCK_HAND_USE

	if(!IS_VALID_GHOUL_MOB(target))
		target.balloon_alert(source, "неподходящее тело!")
		return COMPONENT_BLOCK_HAND_USE

	target.grab_ghost()

	// The grab failed, so they're mindless or playerless. We can't continue
	if(!target.mind || !target.client)
		target.balloon_alert(source, "нет души!")
		return COMPONENT_BLOCK_HAND_USE

	make_ghoul(source, target)

/// Makes [victim] into a ghoul.
/datum/heretic_knowledge/limited_amount/flesh_grasp/proc/make_ghoul(mob/living/user, mob/living/carbon/human/victim)
	user.log_message("created a ghoul, controlled by [key_name(victim)].", LOG_GAME)
	message_admins("[ADMIN_LOOKUPFLW(user)] created a ghoul, [ADMIN_LOOKUPFLW(victim)].")

	victim.apply_status_effect(
		/datum/status_effect/ghoul,
		GHOUL_MAX_HEALTH,
		user.mind,
		CALLBACK(src, PROC_REF(apply_to_ghoul)),
		CALLBACK(src, PROC_REF(remove_from_ghoul)),
	)

/// Callback for the ghoul status effect - Tracking all of our ghouls
/datum/heretic_knowledge/limited_amount/flesh_grasp/proc/apply_to_ghoul(mob/living/ghoul)
	LAZYADD(created_items, WEAKREF(ghoul))

/// Callback for the ghoul status effect - Tracking all of our ghouls
/datum/heretic_knowledge/limited_amount/flesh_grasp/proc/remove_from_ghoul(mob/living/ghoul)
	LAZYREMOVE(created_items, WEAKREF(ghoul))

/datum/heretic_knowledge/limited_amount/flesh_ghoul
	name = "Imperfect Ritual"
	desc = "Позволяет трансмутировать труп и мак, чтобы создать Безголосого мертвеца. \
		Безголосые мертвецы - это немые гули, у них всего 50 здоровья, но они могут эффективно использовать Кровавые клинки. \
		Одновременно можно создать только два."
	gain_text = "Я нашел записи о темном ритуале, незаконченные... но все же я стремился вперед."
	next_knowledge = list(
		/datum/heretic_knowledge/mark/flesh_mark,
		/datum/heretic_knowledge/codex_cicatrix,
		/datum/heretic_knowledge/void_cloak,
		/datum/heretic_knowledge/medallion,
	)
	required_atoms = list(
		/mob/living/carbon/human = 1,
		/obj/item/food/grown/poppy = 1,
	)
	limit = 2
	cost = 1
	route = PATH_FLESH

/datum/heretic_knowledge/limited_amount/flesh_ghoul/recipe_snowflake_check(mob/living/user, list/atoms, list/selected_atoms, turf/loc)
	. = ..()
	if(!.)
		return FALSE

	for(var/mob/living/carbon/human/body in atoms)
		if(body.stat != DEAD)
			continue
		if(!IS_VALID_GHOUL_MOB(body) || HAS_TRAIT(body, TRAIT_HUSK))
			to_chat(user, span_hierophant_warning("[body] не в подходящем состоянии для превращения в гуля."))
			continue

		// We'll select any valid bodies here. If they're clientless, we'll give them a new one.
		selected_atoms += body
		return TRUE

	loc.balloon_alert(user, "ритуал провален, нет подходящего тела!")
	return FALSE

/datum/heretic_knowledge/limited_amount/flesh_ghoul/on_finished_recipe(mob/living/user, list/selected_atoms, turf/loc)
	var/mob/living/carbon/human/soon_to_be_ghoul = locate() in selected_atoms
	if(QDELETED(soon_to_be_ghoul)) // No body? No ritual
		stack_trace("[type] reached on_finished_recipe without a human in selected_atoms to make a ghoul out of.")
		loc.balloon_alert(user, "ритуал провален, нет подходящего тела!")
		return FALSE

	soon_to_be_ghoul.grab_ghost()

	if(!soon_to_be_ghoul.mind || !soon_to_be_ghoul.client)
		message_admins("[ADMIN_LOOKUPFLW(user)] is creating a voiceless dead of a body with no player.")
		var/list/mob/dead/observer/candidates = poll_candidates_for_mob("Вы хотите играть как [soon_to_be_ghoul.real_name], безголосый мертвец?", ROLE_HERETIC, ROLE_HERETIC, 5 SECONDS, soon_to_be_ghoul)
		if(!LAZYLEN(candidates))
			loc.balloon_alert(user, "ритуал провален, нет призраков!")
			return FALSE

		var/mob/dead/observer/chosen_candidate = pick(candidates)
		message_admins("[key_name_admin(chosen_candidate)] has taken control of ([key_name_admin(soon_to_be_ghoul)]) to replace an AFK player.")
		soon_to_be_ghoul.ghostize(FALSE)
		soon_to_be_ghoul.key = chosen_candidate.key

	selected_atoms -= soon_to_be_ghoul
	make_ghoul(user, soon_to_be_ghoul)
	return TRUE

/// Makes [victim] into a ghoul.
/datum/heretic_knowledge/limited_amount/flesh_ghoul/proc/make_ghoul(mob/living/user, mob/living/carbon/human/victim)
	user.log_message("created a voiceless dead, controlled by [key_name(victim)].", LOG_GAME)
	message_admins("[ADMIN_LOOKUPFLW(user)] created a voiceless dead, [ADMIN_LOOKUPFLW(victim)].")

	victim.apply_status_effect(
		/datum/status_effect/ghoul,
		MUTE_MAX_HEALTH,
		user.mind,
		CALLBACK(src, PROC_REF(apply_to_ghoul)),
		CALLBACK(src, PROC_REF(remove_from_ghoul)),
	)

/// Callback for the ghoul status effect - Tracks all of our ghouls and applies effects
/datum/heretic_knowledge/limited_amount/flesh_ghoul/proc/apply_to_ghoul(mob/living/ghoul)
	LAZYADD(created_items, WEAKREF(ghoul))
	ADD_TRAIT(ghoul, TRAIT_MUTE, MAGIC_TRAIT)

/// Callback for the ghoul status effect - Tracks all of our ghouls and applies effects
/datum/heretic_knowledge/limited_amount/flesh_ghoul/proc/remove_from_ghoul(mob/living/ghoul)
	LAZYREMOVE(created_items, WEAKREF(ghoul))
	REMOVE_TRAIT(ghoul, TRAIT_MUTE, MAGIC_TRAIT)

/datum/heretic_knowledge/mark/flesh_mark
	name = "Mark of Flesh"
	desc = "Ваша Хватка Мансуса теперь применяет Метку плоти. Метка срабатывает от атаки вашим Кровавым клинком. \
		При срабатывании у жертвы начинается обильное кровотечение."
	gain_text = "Тогда-то я и увидел их, отмеченных. Они были вне досягаемости. Они кричали и кричали."
	next_knowledge = list(/datum/heretic_knowledge/knowledge_ritual/flesh)
	route = PATH_FLESH
	mark_type = /datum/status_effect/eldritch/flesh

/datum/heretic_knowledge/knowledge_ritual/flesh
	next_knowledge = list(/datum/heretic_knowledge/spell/flesh_surgery)
	route = PATH_FLESH

/datum/heretic_knowledge/spell/flesh_surgery
	name = "Knitting of Flesh"
	desc = "Дарует вам заклинание Knit Flesh. Это заклинание позволяет извлекать органы из жертв \
		без необходимости длительной операции. Этот процесс занимает гораздо больше времени, если цель жива. \
		Это заклинание также позволяет вам исцелять ваших миньонов и призванных или восстанавливать отказавшие органы до приемлемого состояния."
	gain_text = "Но они недолго оставались вне моей досягаемости. С каждым шагом крики усиливались, пока, наконец, \
		я не понял, что их можно заглушить."
	next_knowledge = list(/datum/heretic_knowledge/summon/raw_prophet)
	spell_to_add = /datum/action/cooldown/spell/touch/flesh_surgery
	cost = 1
	route = PATH_FLESH

/datum/heretic_knowledge/summon/raw_prophet
	name = "Raw Ritual"
	desc = "Позволяет трансмутировать пару глаз, левую руку и лужу крови, чтобы создать Сырого gророка. \
		Сырые пророки обладают значительно увеличенной дальностью зрения и рентгеновским зрением, \
		а также джаунтом дальнего действия и способностью связывать разумы для легкого общения, но очень хрупки и слабы в бою."
	gain_text = "Я не мог продолжать в одиночку. Я смог призвать Жуткого человека, чтобы он помог мне увидеть больше. \
		Крики... когда-то постоянные, теперь заглушались их убогим видом. Ничто не было недосягаемо."
	next_knowledge = list(
		/datum/heretic_knowledge/blade_upgrade/flesh,
		/datum/heretic_knowledge/reroll_targets,
		/datum/heretic_knowledge/spell/blood_siphon,
		/datum/heretic_knowledge/curse/paralysis,
	)
	required_atoms = list(
		/obj/item/organ/internal/eyes = 1,
		/obj/effect/decal/cleanable/blood = 1,
		/obj/item/bodypart/arm/left = 1,
	)
	mob_to_summon = /mob/living/simple_animal/hostile/heretic_summon/raw_prophet
	cost = 1
	route = PATH_FLESH

/datum/heretic_knowledge/blade_upgrade/flesh
	name = "Bleeding Steel"
	desc = "Ваш Кровавый клинок теперь вызывает у врагов сильное кровотечение при атаке."
	gain_text = "Жудкий человек был не один. Он привел меня к Маршалу. \
		Наконец-то я начал понимать. А потом с небес хлынул кровавый дождь."
	next_knowledge = list(/datum/heretic_knowledge/summon/stalker)
	route = PATH_FLESH

/datum/heretic_knowledge/blade_upgrade/flesh/do_melee_effects(mob/living/source, mob/living/target, obj/item/melee/sickly_blade/blade)
	if(!iscarbon(target) || source == target)
		return

	var/mob/living/carbon/carbon_target = target
	var/obj/item/bodypart/bodypart = pick(carbon_target.bodyparts)
	var/datum/wound/slash/severe/crit_wound = new()
	crit_wound.apply_wound(bodypart, attack_direction = get_dir(source, target))

/datum/heretic_knowledge/summon/stalker
	name = "Lonely Ritual"
	desc = "Позволяет трансмутировать хвост любого вида, желудок, язык, перо и лист бумаги, чтобы создать Сталкера. \
		Сталкеры имеют джаунт, могут выпускать ЭМИ, превращаться в животных или автоматонов и сильны в бою."
	gain_text = "Я смог объединить свою жадность и желания, чтобы вызвать мистическое чудовище, которого я никогда раньше не видел. \
		Постоянно меняющая форму масса плоти, она хорошо знала мои цели. Маршал одобрил."
	next_knowledge = list(
		/datum/heretic_knowledge/ultimate/flesh_final,
		/datum/heretic_knowledge/summon/ashy,
		/datum/heretic_knowledge/spell/cleave,
	)
	required_atoms = list(
		/obj/item/organ/external/tail = 1,
		/obj/item/organ/internal/stomach = 1,
		/obj/item/organ/internal/tongue = 1,
		/obj/item/pen = 1,
		/obj/item/paper = 1,
	)
	mob_to_summon = /mob/living/simple_animal/hostile/heretic_summon/stalker
	cost = 1
	route = PATH_FLESH

/datum/heretic_knowledge/ultimate/flesh_final
	name = "Priest's Final Hymn"
	desc = "Ритуал вознесения Пути плоти. \
		Принесите 4 трупа к руне трансмутации, чтобы завершить ритуал. \
		После завершения вы обретаете способность сбросить человеческую форму \
		и стать Властелином ночи, сверхмощным существом. \
		Один только акт превращения вызывает у близлежащих язычников сильный страх и травму. \
		Находясь в форме Повелителя ночи, вы можете потреблять оружие для исцеления и восстановления сегментов. \
		Кроме того, вы можете вызывать в три раза больше упырей и безголосых мертвецов, \
		а также создавать неограниченное количество клинков, чтобы вооружить их всех." // оружие или руки? надо код чекнуть
	gain_text = "С ведома Маршала моя сила достигла пика. Трон был готов к завоеванию. \
		Люди этого мира, услышьте меня, ибо время пришло! Маршал ведет мою армию! \
		Реальность согнется перед ВЛАДЫКОЙ НОЧИ или будет разрушена! СТАНЬТЕ СВИДЕТЕЛЯМИ МОЕГО ВОЗНЕСЕНИЯ!"
	required_atoms = list(/mob/living/carbon/human = 4)
	route = PATH_FLESH

/datum/heretic_knowledge/ultimate/flesh_final/on_finished_recipe(mob/living/user, list/selected_atoms, turf/loc)
	. = ..()
	priority_announce("[generate_heretic_text()] Вечно закручивающийся вихрь. Реальность развернулась. С ВЫТЯНУТЫМИ РУКАМИ, ВЛАСТЕЛИН НОЧИ, [user.real_name] возвысился! Бойтесь вечно изгибающейся руки! [generate_heretic_text()]", "[generate_heretic_text()]", ANNOUNCER_SPANOMALIES)

	var/datum/action/cooldown/spell/shapeshift/shed_human_form/worm_spell = new(user.mind)
	worm_spell.Grant(user)

	user.client?.give_award(/datum/award/achievement/misc/flesh_ascension, user)

	var/datum/antagonist/heretic/heretic_datum = IS_HERETIC(user)
	var/datum/heretic_knowledge/limited_amount/flesh_grasp/grasp_ghoul = heretic_datum.get_knowledge(/datum/heretic_knowledge/limited_amount/flesh_grasp)
	grasp_ghoul.limit *= 3
	var/datum/heretic_knowledge/limited_amount/flesh_ghoul/ritual_ghoul = heretic_datum.get_knowledge(/datum/heretic_knowledge/limited_amount/flesh_ghoul)
	ritual_ghoul.limit *= 3
	var/datum/heretic_knowledge/limited_amount/starting/base_flesh/blade_ritual = heretic_datum.get_knowledge(/datum/heretic_knowledge/limited_amount/starting/base_flesh)
	blade_ritual.limit = 999

#undef GHOUL_MAX_HEALTH
#undef MUTE_MAX_HEALTH
