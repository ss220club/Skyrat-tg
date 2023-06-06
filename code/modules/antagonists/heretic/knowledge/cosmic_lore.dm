/**
 * # The path of Cosmos.
 *
 * Goes as follows:
 *
 * Eternal Gate
 * Grasp of Cosmos
 * Cosmic Runes
 * > Sidepaths:
 *   Priest's Ritual
 *   Scorching Shark
 *
 * Mark of Cosmos
 * Ritual of Knowledge
 * Star Touch
 * Star Blast
 * > Sidepaths:
 *   Curse of Corrosion
 *   Space Phase
 *
 * Cosmic Blade
 * Cosmic Expansion
 * > Sidepaths:
 *   Eldritch Coin
 *   Rusted Ritual
 *
 * Creators's Gift
 */
/datum/heretic_knowledge/limited_amount/starting/base_cosmic
	name = "Eternal Gate"
	desc = "Открывает перед вами Путь космоса. \
		Позволяет трансмутировать лист плазмы и нож в Космический клинок. \
		Одновременно можно иметь только два."
	gain_text = "Он смотрел на звезды, чтобы направлять себя."
	next_knowledge = list(/datum/heretic_knowledge/cosmic_grasp)
	required_atoms = list(
		/obj/item/knife = 1,
		/obj/item/stack/sheet/mineral/plasma = 1,
	)
	result_atoms = list(/obj/item/melee/sickly_blade/cosmic)
	route = PATH_COSMIC

/datum/heretic_knowledge/cosmic_grasp
	name = "Grasp of Cosmos"
	desc = "Ваша Хватка Мансуса даст людям Метку звезды (космическое кольцо) и создаст космическое поле там, где вы стоите."
	gain_text = "Чем больше он смотрел, тем больше все приобретало смысл. \
		Звезды прочертили путь домой."
	next_knowledge = list(/datum/heretic_knowledge/spell/cosmic_runes)
	cost = 1
	route = PATH_COSMIC

/datum/heretic_knowledge/cosmic_grasp/on_gain(mob/user, datum/antagonist/heretic/our_heretic)
	RegisterSignal(user, COMSIG_HERETIC_MANSUS_GRASP_ATTACK, PROC_REF(on_mansus_grasp))

/datum/heretic_knowledge/cosmic_grasp/on_lose(mob/user, datum/antagonist/heretic/our_heretic)
	UnregisterSignal(user, COMSIG_HERETIC_MANSUS_GRASP_ATTACK)

/// Aplies the effect of the mansus grasp when it hits a target.
/datum/heretic_knowledge/cosmic_grasp/proc/on_mansus_grasp(mob/living/source, mob/living/target)
	SIGNAL_HANDLER

	to_chat(target, span_danger("Над вашей головой появилось космическое кольцо!"))
	target.apply_status_effect(/datum/status_effect/star_mark, source)
	new /obj/effect/forcefield/cosmic_field(get_turf(source))

/datum/heretic_knowledge/spell/cosmic_runes
	name = "Cosmic Runes"
	desc = "Дает вам Cosmic Runes, заклинание, которое создает две руны, связанные друг с другом для легкой телепортации. \
		Перемещаться будет только тот, кто активирует руну, а использовать ее может любой человек без Метки звезды. \
		Однако люди с Меткой звезды будут переноситься вместе с тем, кто использует руну."
	gain_text = "Когда наступил день, Спящий потерялся. \
		Солнце затмило звезды, и он потерял своего проводника."
	next_knowledge = list(
		/datum/heretic_knowledge/mark/cosmic_mark,
		/datum/heretic_knowledge/codex_cicatrix,
		/datum/heretic_knowledge/essence,
		/datum/heretic_knowledge/summon/fire_shark,
	)
	spell_to_add = /datum/action/cooldown/spell/cosmic_rune
	cost = 1
	route = PATH_COSMIC

/datum/heretic_knowledge/mark/cosmic_mark
	name = "Mark of Cosmos"
	desc = "Ваша Хватка Мансуса теперь накладывает Метку космоса. Метка срабатывает при атаке вашим Космическим клинком. \
		При срабатывании жертва возвращается в то место, где на нее первоначально была нанесена Метка. \
		Затем они будут парализованы на 2 секунды.."
	gain_text = "Потеряв проводника, он нашел нового. Энергия возрастала вместе со взглядом, который он бросал. \
		Он не знал, но, сосредоточившись, энергия Спящих начала течь."
	next_knowledge = list(/datum/heretic_knowledge/knowledge_ritual/cosmic)
	route = PATH_COSMIC
	mark_type = /datum/status_effect/eldritch/cosmic

/datum/heretic_knowledge/knowledge_ritual/cosmic
	next_knowledge = list(/datum/heretic_knowledge/spell/star_touch)
	route = PATH_COSMIC

/datum/heretic_knowledge/spell/star_touch
	name = "Star Touch"
	desc = "Дает вам Star Touch, заклинание, которое помещает Метку звезды на вашу цель \
		и создает космическое поле у ваших ног и на тайлах рядом с вами. Цели, которые уже имеют Метку звезды \
		будут вынуждены заснуть на 4 секунды. Когда жертва получает удар, она также создает луч, \
		который наносит небольшой урон огнем и повреждает клетки. \
		Луч действует в течение минуты, пока луч не будет прегражден или пока не будет найдена новая цель."
	gain_text = "Он мечтал узнать, как материя путешествует от звезды к звезде. \
		Он потерял интерес к желанию узнать это."
	next_knowledge = list(/datum/heretic_knowledge/spell/star_blast)
	spell_to_add = /datum/action/cooldown/spell/touch/star_touch
	cost = 1
	route = PATH_COSMIC

/datum/heretic_knowledge/spell/star_blast
	name = "Star Blast"
	desc = "Выпускает снаряд, который движется очень медленно и создает космические поля при столкновении. \
		Каждый, в кого попадет снаряд, получит урон от ожога, будет сбит с ног и нанесет людям в радиусе трех тайлов Метку звезды."
	gain_text = "Он не пытался, но почувствовал зов ночного Творца."
	next_knowledge = list(
		/datum/heretic_knowledge/blade_upgrade/cosmic,
		/datum/heretic_knowledge/reroll_targets,
		/datum/heretic_knowledge/curse/corrosion,
		/datum/heretic_knowledge/spell/space_phase,
	)
	spell_to_add = /datum/action/cooldown/spell/pointed/projectile/star_blast
	cost = 1
	route = PATH_COSMIC

/datum/heretic_knowledge/blade_upgrade/cosmic
	name = "Cosmic Blade"
	desc = "Теперь ваш клинок наносит клеточный урон с помощью космического излучения. \
		Ваши атаки наносят бонусный урон максимум двум предыдущим жертвам. \
		Комбо сбрасывается после двух секунд без атаки, \
		или если вы атакуете кого-то уже отмеченного. При комбинировании более четырех атак вы получите \
		космический след и увеличите таймер вашего комбо до 10 секунд."
	gain_text = "Когда он вознесся до статуса наблюдателя, ему нужно было накапливать знания. \
		Он начал рисовать их у себя дома."
	next_knowledge = list(/datum/heretic_knowledge/spell/cosmic_expansion)
	route = PATH_COSMIC
	/// Storage for the second target.
	var/datum/weakref/second_target
	/// Storage for the third target.
	var/datum/weakref/third_target
	/// When this timer completes we reset our combo.
	var/combo_timer
	/// The active duration of the combo.
	var/combo_duration = 3 SECONDS
	/// The duration of a combo when it starts.
	var/combo_duration_amount = 3 SECONDS
	/// The maximum duration of the combo.
	var/max_combo_duration = 10 SECONDS
	/// The amount the combo duration increases.
	var/increase_amount = 0.5 SECONDS
	/// The hits we have on a mob with a mind.
	var/combo_counter = 0

/datum/heretic_knowledge/blade_upgrade/cosmic/do_melee_effects(mob/living/source, mob/living/target, obj/item/melee/sickly_blade/blade)
	if(source == target)
		return
	if(combo_timer)
		deltimer(combo_timer)
	combo_timer = addtimer(CALLBACK(src, PROC_REF(reset_combo), source), combo_duration, TIMER_STOPPABLE)
	var/mob/living/second_target_resolved = second_target?.resolve()
	var/mob/living/third_target_resolved = third_target?.resolve()
	target.adjustFireLoss(4)
	target.adjustCloneLoss(2)
	if(target == second_target_resolved || target == third_target_resolved)
		reset_combo(source)
		return
	if(target.mind && target.stat != DEAD)
		combo_counter += 1
	if(second_target_resolved)
		new /obj/effect/temp_visual/cosmic_explosion(get_turf(second_target_resolved))
		playsound(get_turf(second_target_resolved), 'sound/magic/cosmic_energy.ogg', 25, FALSE)
		second_target_resolved.adjustFireLoss(10)
		second_target_resolved.adjustCloneLoss(6)
		if(third_target_resolved)
			new /obj/effect/temp_visual/cosmic_domain(get_turf(third_target_resolved))
			playsound(get_turf(third_target_resolved), 'sound/magic/cosmic_energy.ogg', 50, FALSE)
			third_target_resolved.adjustFireLoss(20)
			third_target_resolved.adjustCloneLoss(12)
			if(combo_counter > 3)
				target.apply_status_effect(/datum/status_effect/star_mark, source)
				if(target.mind && target.stat != DEAD)
					increase_combo_duration()
					if(combo_counter == 4)
						source.AddElement(/datum/element/effect_trail/cosmic_trail)
		third_target = second_target
	second_target = WEAKREF(target)

/// Resets the combo.
/datum/heretic_knowledge/blade_upgrade/cosmic/proc/reset_combo(mob/living/source)
	second_target = null
	third_target = null
	if(combo_counter > 3)
		source.RemoveElement(/datum/element/effect_trail/cosmic_trail)
	combo_duration = combo_duration_amount
	combo_counter = 0
	new /obj/effect/temp_visual/cosmic_cloud(get_turf(source))
	if(combo_timer)
		deltimer(combo_timer)

/// Increases the combo duration.
/datum/heretic_knowledge/blade_upgrade/cosmic/proc/increase_combo_duration()
	if(combo_duration < max_combo_duration)
		combo_duration += increase_amount

/datum/heretic_knowledge/spell/cosmic_expansion
	name = "Cosmic Expansion"
	desc = "Дает вам Cosmic Expansion, заклинание, создающее вокруг вас область космических полей размером 3x3. \
		Близлежащие существа также будут отмечены Меткой звезды."
	gain_text = "Он был хорошо известен, поэтому ему пришлось много рисовать, чтобы собрать как можно больше забытых им вещей."
	next_knowledge = list(
		/datum/heretic_knowledge/ultimate/cosmic_final,
		/datum/heretic_knowledge/eldritch_coin,
		/datum/heretic_knowledge/summon/rusty,
	)
	spell_to_add = /datum/action/cooldown/spell/conjure/cosmic_expansion
	cost = 1
	route = PATH_COSMIC

/datum/heretic_knowledge/ultimate/cosmic_final
	name = "Creators's Gift"
	desc = "Ритуал вознесения Пути космоса. \
		Для завершения ритуала принесите 3 трупа с блуспейс пылью в теле к руне трансмутации. \
		После завершения вы станете обладателем Звездочета. \
		Вы сможете управлять Звездочетом с помощью Альт-Клика. \
		Вы также можете отдавать ему команды с помощью речи. \
		Звездочет - сильный союзник, который может даже разрушить укрепленные стены. \
		Звездочет обладает аурой, которая исцеляет вас и наносит урон противникам. \
		Star Touch теперь может телепортировать вас к Звездочету, когда активируется в вашей руке."
	gain_text = "Прошлое ушло, Звездочет стал сосудом для наблюдения за вселенной. \
		Творец создал этот путь для него и забыл об его предназначении. \
		ВРЕМЯ ПРИШЛО, УЗРИТЕ МОЕ ВОЗНЕСЕНИЕ, ЗВЕЗДОЧЕТ СНОВА ОБРЕЛ ЦЕЛЬ!"
	route = PATH_COSMIC
	/// A static list of command we can use with our mob.
	var/static/list/star_gazer_commands = list(
		/datum/pet_command/idle,
		/datum/pet_command/free,
		/datum/pet_command/follow,
		/datum/pet_command/point_targetting/attack/star_gazer
	)

/datum/heretic_knowledge/ultimate/cosmic_final/is_valid_sacrifice(mob/living/carbon/human/sacrifice)
	. = ..()
	if(!.)
		return FALSE

	return sacrifice.has_reagent(/datum/reagent/bluespace)

/datum/heretic_knowledge/ultimate/cosmic_final/on_finished_recipe(mob/living/user, list/selected_atoms, turf/loc)
	. = ..()
	priority_announce("[generate_heretic_text()] Звездочет прибыл на станцию, [user.real_name] возвысился! Эта станция - владения космоса! [generate_heretic_text()]","[generate_heretic_text()]", ANNOUNCER_SPANOMALIES)
	var/mob/living/basic/star_gazer/star_gazer_mob = new /mob/living/basic/star_gazer(loc)
	star_gazer_mob.maxHealth = INFINITY
	star_gazer_mob.health = INFINITY
	user.AddElement(/datum/element/death_linked, star_gazer_mob)
	star_gazer_mob.AddComponent(/datum/component/obeys_commands, star_gazer_commands)
	star_gazer_mob.AddComponent(/datum/component/damage_aura, range = 7, burn_damage = 0.5, simple_damage = 0.5, immune_factions = list(FACTION_HERETIC), current_owner = user)
	star_gazer_mob.befriend(user)
	var/datum/action/cooldown/open_mob_commands/commands_action = new /datum/action/cooldown/open_mob_commands()
	commands_action.Grant(user, star_gazer_mob)
	var/datum/action/cooldown/spell/touch/star_touch/star_touch_spell = locate() in user.actions
	if(star_touch_spell)
		star_touch_spell.set_star_gazer(star_gazer_mob)
		star_touch_spell.ascended = TRUE

	var/datum/antagonist/heretic/heretic_datum = user.mind.has_antag_datum(/datum/antagonist/heretic)
	var/datum/heretic_knowledge/blade_upgrade/cosmic/blade_upgrade = heretic_datum.get_knowledge(/datum/heretic_knowledge/blade_upgrade/cosmic)
	blade_upgrade.combo_duration = 10 SECONDS
	blade_upgrade.combo_duration_amount = 10 SECONDS
	blade_upgrade.max_combo_duration = 30 SECONDS
	blade_upgrade.increase_amount = 2 SECONDS

	var/datum/action/cooldown/spell/conjure/cosmic_expansion/cosmic_expansion_spell = locate() in user.actions
	cosmic_expansion_spell?.ascended = TRUE

	user.client?.give_award(/datum/award/achievement/misc/cosmic_ascension, user)
