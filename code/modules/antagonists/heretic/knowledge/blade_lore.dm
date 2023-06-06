/**
 * # The path of Blades. Stab stab.
 *
 * Goes as follows:
 *
 * The Cutting Edge
 * Grasp of the Blade
 * Dance of the Brand
 * > Sidepaths:
 *   Shattered Risen
 *   Armorer's Ritual
 *
 * Mark of the Blade
 * Ritual of Knowledge
 * Realignment
 * Stance of the Scarred Duelist
 * > Sidepaths:
 *   Carving Knife
 *   Mawed Crucible
 *
 * Swift Blades
 * Furious Steel
 * > Sidepaths:
 *   Maid in the Mirror
 *   Lionhunter Rifle
 *
 * Maelstrom of Silver
 */
/datum/heretic_knowledge/limited_amount/starting/base_blade
	name = "The Cutting Edge"
	desc = "Открывает для вас Путь клинков. \
		Позволяет трансмутировать нож с двумя слитками серебра для создания Закаленного клинка. \
		Одновременно можно имет не более пяти."
	gain_text = "Наши великие предки ковали мечи и практиковали спарринги накануне великих сражений."
	next_knowledge = list(/datum/heretic_knowledge/blade_grasp)
	required_atoms = list(
		/obj/item/knife = 1,
		/obj/item/stack/sheet/mineral/silver = 2,
	)
	result_atoms = list(/obj/item/melee/sickly_blade/dark)
	limit = 5 // It's the blade path, it's a given
	route = PATH_BLADE

/datum/heretic_knowledge/blade_grasp
	name = "Grasp of the Blade"
	desc = "Ваша Хватка Мансуса вызывает короткое оглушение при использовании на лежачей или стоящей спиной к вам цели."
	gain_text = "История пехотинца рассказывается с древности. Это история крови и доблести, \
		за которую выступают меч, сталь и серебро."
	next_knowledge = list(/datum/heretic_knowledge/blade_dance)
	cost = 1
	route = PATH_BLADE

/datum/heretic_knowledge/blade_grasp/on_gain(mob/user, datum/antagonist/heretic/our_heretic)
	RegisterSignal(user, COMSIG_HERETIC_MANSUS_GRASP_ATTACK, PROC_REF(on_mansus_grasp))

/datum/heretic_knowledge/blade_grasp/on_lose(mob/user, datum/antagonist/heretic/our_heretic)
	UnregisterSignal(user, COMSIG_HERETIC_MANSUS_GRASP_ATTACK)

/datum/heretic_knowledge/blade_grasp/proc/on_mansus_grasp(mob/living/source, mob/living/target)
	SIGNAL_HANDLER

	// Let's see if source is behind target
	// "Behind" is defined as 3 tiles directly to the back of the target
	// x . .
	// x > .
	// x . .

	var/are_we_behind = FALSE
	// No tactical spinning allowed
	if(target.flags_1 & IS_SPINNING_1)
		are_we_behind = TRUE

	// We'll take "same tile" as "behind" for ease
	if(target.loc == source.loc)
		are_we_behind = TRUE

	// We'll also assume lying down is behind, as mob directions when lying are unclear
	if(target.body_position == LYING_DOWN)
		are_we_behind = TRUE

	// Exceptions aside, let's actually check if they're, yknow, behind
	var/dir_target_to_source = get_dir(target, source)
	if(target.dir & REVERSE_DIR(dir_target_to_source))
		are_we_behind = TRUE

	if(!are_we_behind)
		return

	// We're officially behind them, apply effects
	target.AdjustParalyzed(1.5 SECONDS)
	target.apply_damage(10, BRUTE, wound_bonus = CANT_WOUND)
	target.balloon_alert(source, "удар в спину!")
	playsound(get_turf(target), 'sound/weapons/guillotine.ogg', 100, TRUE)

/// The cooldown duration between trigers of blade dance
#define BLADE_DANCE_COOLDOWN (20 SECONDS)

/datum/heretic_knowledge/blade_dance
	name = "Dance of the Brand"
	desc = "Если вас атакуют, когда вы держите клинок еретика в любой руке, вы выполните рипост \
		в сторону нападающего. Этот эффект может сработать только один раз в 20 секунд."
	gain_text = "Пехотинец был известен как грозный дуэлянт. \
		Его генерал быстро назначил своим личным чемпионом."
	next_knowledge = list(
		/datum/heretic_knowledge/limited_amount/risen_corpse,
		/datum/heretic_knowledge/mark/blade_mark,
		/datum/heretic_knowledge/codex_cicatrix,
		/datum/heretic_knowledge/armor,
	)
	cost = 1
	route = PATH_BLADE
	/// Whether the counter-attack is ready or not.
	/// Used instead of cooldowns, so we can give feedback when it's ready again
	var/riposte_ready = TRUE

/datum/heretic_knowledge/blade_dance/on_gain(mob/user, datum/antagonist/heretic/our_heretic)
	RegisterSignal(user, COMSIG_HUMAN_CHECK_SHIELDS, PROC_REF(on_shield_reaction))

/datum/heretic_knowledge/blade_dance/on_lose(mob/user, datum/antagonist/heretic/our_heretic)
	UnregisterSignal(user, COMSIG_HUMAN_CHECK_SHIELDS)

/datum/heretic_knowledge/blade_dance/proc/on_shield_reaction(
	mob/living/carbon/human/source,
	atom/movable/hitby,
	damage = 0,
	attack_text = "the attack",
	attack_type = MELEE_ATTACK,
	armour_penetration = 0,
	damage_type = BRUTE,
)

	SIGNAL_HANDLER

	if(attack_type != MELEE_ATTACK)
		return

	if(!riposte_ready)
		return

	if(source.incapacitated(IGNORE_GRAB))
		return

	var/mob/living/attacker = hitby.loc
	if(!istype(attacker))
		return

	if(!source.Adjacent(attacker))
		return

	// Let's check their held items to see if we can do a riposte
	var/obj/item/main_hand = source.get_active_held_item()
	var/obj/item/off_hand = source.get_inactive_held_item()
	// This is the item that ends up doing the "blocking" (flavor)
	var/obj/item/striking_with

	// First we'll check if the offhand is valid
	if(!QDELETED(off_hand) && istype(off_hand, /obj/item/melee/sickly_blade))
		striking_with = off_hand

	// Then we'll check the mainhand
	// We do mainhand second, because we want to prioritize it over the offhand
	if(!QDELETED(main_hand) && istype(main_hand, /obj/item/melee/sickly_blade))
		striking_with = main_hand

	// No valid item in either slot? No riposte
	if(!striking_with)
		return

	// If we made it here, deliver the strike
	INVOKE_ASYNC(src, PROC_REF(counter_attack), source, attacker, striking_with, attack_text)

	// And reset after a bit
	riposte_ready = FALSE
	addtimer(CALLBACK(src, PROC_REF(reset_riposte), source), BLADE_DANCE_COOLDOWN)

/datum/heretic_knowledge/blade_dance/proc/counter_attack(mob/living/carbon/human/source, mob/living/target, obj/item/melee/sickly_blade/weapon, attack_text)
	playsound(get_turf(source), 'sound/weapons/parry.ogg', 100, TRUE)
	source.balloon_alert(source, "рипост использован")
	source.visible_message(
		span_warning("[source] наклоняется к [attack_text] и наносит внезапный рипост [target]!"),
		span_warning("Вы наклоняетесь к [attack_text] и наносите внезапный рипост [target]!"),
		span_hear("Вы слышите лязг, за которым следует удар."),
	)
	weapon.melee_attack_chain(source, target)

/datum/heretic_knowledge/blade_dance/proc/reset_riposte(mob/living/carbon/human/source)
	riposte_ready = TRUE
	source.balloon_alert(source, "рипост готов")

#undef BLADE_DANCE_COOLDOWN

/datum/heretic_knowledge/mark/blade_mark
	name = "Mark of the Blade"
	desc = "Ваша Хватка Мансуса теперь применяет Метку клинка. Во время действия Метки \
		жертва не сможет покинуть текущую комнату, пока не истечет срок ее действия или пока она не сработает. \
		Срабатывание Метки вызовет нож, который в течение короткого времени будет вращаться вокруг вас. \
		Нож блокирует любую направленную на вас атаку, но расходуется при использовании."
	gain_text = "Его генерал хотел закончить войну, но чемпион знал, что без смерти не может быть жизни. \
		Он сам убьет труса и всех, кто попытается бежать."
	next_knowledge = list(/datum/heretic_knowledge/knowledge_ritual/blade)
	route = PATH_BLADE
	mark_type = /datum/status_effect/eldritch/blade

/datum/heretic_knowledge/mark/blade_mark/create_mark(mob/living/source, mob/living/target)
	var/datum/status_effect/eldritch/blade/blade_mark = ..()
	if(istype(blade_mark))
		var/area/to_lock_to = get_area(target)
		blade_mark.locked_to = to_lock_to
		to_chat(target, span_hypnophrase("Потусторонняя сила заставляет вас оставаться в [get_area_name(to_lock_to)]!"))
	return blade_mark

/datum/heretic_knowledge/mark/blade_mark/trigger_mark(mob/living/source, mob/living/target)
	. = ..()
	if(!.)
		return
	source.apply_status_effect(/datum/status_effect/protective_blades, 60 SECONDS, 1, 20, 0 SECONDS)

/datum/heretic_knowledge/knowledge_ritual/blade
	next_knowledge = list(/datum/heretic_knowledge/spell/realignment)
	route = PATH_BLADE

/datum/heretic_knowledge/spell/realignment
	name = "Realignment"
	desc = "Дает вам Realignment, заклинание, которое быстро и на короткое время выправит ваше тело. \
		Во время этого процесса вы будете быстро восстанавливать стамину и быстро восстанавливаться после оглушения, однако вы не сможете атаковать. \
		Это заклинание можно применять подряд, но при этом увеличивается время его перезарядки."
	gain_text = "В шквале смертей он обрел мир внутри себя. Несмотря на неодолимые шансы, он ступал вперед."
	next_knowledge = list(/datum/heretic_knowledge/duel_stance)
	spell_to_add = /datum/action/cooldown/spell/realignment
	cost = 1
	route = PATH_BLADE

/// The amount of blood flow reduced per level of severity of gained bleeding wounds for Stance of the Torn Champion.
#define BLOOD_FLOW_PER_SEVEIRTY -1

/datum/heretic_knowledge/duel_stance
	name = "Stance of the Torn Champion"
	desc = "Дает устойчивость к потере крови при ранениях и иммунитет к расчленению конечностей. \
		Кроме того, при повреждении ниже 50% от максимального здоровья, \
		вы получаете повышенную устойчивость к получению ран и устойчивость к батонам."
	gain_text = "Со временем именно он оказался среди тел своих бывших товарищей, залитых кровью, но не его собственной. \
		Он был без конкурентов, равных и без цели."
	next_knowledge = list(
		/datum/heretic_knowledge/blade_upgrade/blade,
		/datum/heretic_knowledge/reroll_targets,
		/datum/heretic_knowledge/rune_carver,
		/datum/heretic_knowledge/crucible,
	)
	cost = 1
	route = PATH_BLADE
	/// Whether we're currently in duelist stance, gaining certain buffs (low health)
	var/in_duelist_stance = FALSE

/datum/heretic_knowledge/duel_stance/on_gain(mob/user, datum/antagonist/heretic/our_heretic)
	ADD_TRAIT(user, TRAIT_NODISMEMBER, type)
	RegisterSignal(user, COMSIG_PARENT_EXAMINE, PROC_REF(on_examine))
	RegisterSignal(user, COMSIG_CARBON_GAIN_WOUND, PROC_REF(on_wound_gain))
	RegisterSignal(user, COMSIG_LIVING_HEALTH_UPDATE, PROC_REF(on_health_update))

	on_health_update(user) // Run this once, so if the knowledge is learned while hurt it activates properly

/datum/heretic_knowledge/duel_stance/on_lose(mob/user, datum/antagonist/heretic/our_heretic)
	REMOVE_TRAIT(user, TRAIT_NODISMEMBER, type)
	if(in_duelist_stance)
		user.remove_traits(list(TRAIT_HARDLY_WOUNDED, TRAIT_BATON_RESISTANCE), type)

	UnregisterSignal(user, list(COMSIG_PARENT_EXAMINE, COMSIG_CARBON_GAIN_WOUND, COMSIG_LIVING_HEALTH_UPDATE))

/datum/heretic_knowledge/duel_stance/proc/on_examine(mob/living/source, mob/user, list/examine_list)
	SIGNAL_HANDLER

	var/obj/item/held_item = source.get_active_held_item()
	if(in_duelist_stance)
		examine_list += span_warning("[source] выглядят неестественно стойко[held_item?.force >= 15 ? " и готовы к выпаду":""].")

/datum/heretic_knowledge/duel_stance/proc/on_wound_gain(mob/living/source, datum/wound/gained_wound, obj/item/bodypart/limb)
	SIGNAL_HANDLER

	if(gained_wound.blood_flow <= 0)
		return

	gained_wound.adjust_blood_flow(gained_wound.severity * BLOOD_FLOW_PER_SEVEIRTY)

/datum/heretic_knowledge/duel_stance/proc/on_health_update(mob/living/source)
	SIGNAL_HANDLER

	if(in_duelist_stance && source.health > source.maxHealth * 0.5)
		source.balloon_alert(source, "выход из стойки дуэлиста")
		in_duelist_stance = FALSE
		source.remove_traits(list(TRAIT_HARDLY_WOUNDED, TRAIT_BATON_RESISTANCE), type)
		return

	if(!in_duelist_stance && source.health <= source.maxHealth * 0.5)
		source.balloon_alert(source, "вход в стойку дуэлиста")
		in_duelist_stance = TRUE
		source.add_traits(list(TRAIT_HARDLY_WOUNDED, TRAIT_BATON_RESISTANCE), type)
		return

#undef BLOOD_FLOW_PER_SEVEIRTY

/datum/heretic_knowledge/blade_upgrade/blade
	name = "Swift Blades"
	desc = "Атакуя кого-либо с Закаленным клинком в обеих руках, \
	теперь вы будете наносить удар обоими клинками сразу, нанося две атаки в быстрой последовательности. \
	Второй удар будет немного слабее."
	gain_text = "Я нашел его рассеченным на две части, половинки сцепились в дуэли без конца; \
		шквал клинков, но ни один из них не попал в цель, ибо чемпион был неукротим."
	next_knowledge = list(/datum/heretic_knowledge/spell/furious_steel)
	route = PATH_BLADE
	/// How much force do we apply to the offhand?
	var/offand_force_decrement = 0
	/// How much force was the last weapon we offhanded with? If it's different, we need to re-calculate the decrement
	var/last_weapon_force = -1

/datum/heretic_knowledge/blade_upgrade/blade/do_melee_effects(mob/living/source, mob/living/target, obj/item/melee/sickly_blade/blade)
	if(target == source)
		return

	var/obj/item/off_hand = source.get_inactive_held_item()
	if(QDELETED(off_hand) || !istype(off_hand, /obj/item/melee/sickly_blade))
		return
	// If our off-hand is the blade that's attacking,
	// quit out now to avoid an infinite stab combo
	if(off_hand == blade)
		return

	// Give it a short delay (for style, also lets people dodge it I guess)
	addtimer(CALLBACK(src, PROC_REF(follow_up_attack), source, target, off_hand), 0.25 SECONDS)

/datum/heretic_knowledge/blade_upgrade/blade/proc/follow_up_attack(mob/living/source, mob/living/target, obj/item/melee/sickly_blade/blade)
	if(QDELETED(source) || QDELETED(target) || QDELETED(blade))
		return
	// Sanity to ensure that the blade we're delivering an offhand attack with is ACTUALLY our offhand
	if(blade != source.get_inactive_held_item())
		return
	// And we easily could've moved away
	if(!source.Adjacent(target))
		return

	// Check if we need to recaclulate our offhand force
	// This is just so we don't run this block every attack, that's wasteful
	if(last_weapon_force != blade.force)
		offand_force_decrement = 0
		// We want to make sure that the offhand blade increases their hits to crit by one, just about
		// So, let's do some quick math. Yes this'll be inaccurate if their mainhand blade is modified (whetstone), no I don't care
		// Find how much force we need to detract from the second blade
		var/hits_to_crit_on_average = ROUND_UP(100 / (blade.force * 2))
		while(hits_to_crit_on_average <= 3) // 3 hits and beyond is a bit too absurd
			if(offand_force_decrement + 2 > blade.force * 0.5) // But also cutting the force beyond half is absurd
				break

			offand_force_decrement += 2
			hits_to_crit_on_average = ROUND_UP(100 / (blade.force * 2 - offand_force_decrement))

	// Save the force as our last weapon force
	last_weapon_force = blade.force
	// Subtract the decrement
	blade.force -= offand_force_decrement
	// Perform the offhand attack
	blade.melee_attack_chain(source, target)
	// Restore the force.
	blade.force = last_weapon_force

/datum/heretic_knowledge/spell/furious_steel
	name = "Furious Steel"
	desc = "Дает вам Furious Steel, заклинание с выбором цели. При его использовании вокруг вас появятся три \
	вращающихся клинка. Эти клинки защищают вас от всех атак, \
	но при использовании расходуются. Кроме того, вы можете использовать кнопку, чтобы выстрелить лезвиями \
	в цель, нанося урон и вызывая кровотечение."
	gain_text = "Не раздумывая, я взял нож павшего солдата и со всей силы метнул. Моя меткость оказалась верна! \
		Разорванный чемпион улыбнулся их первому вкусу агонии, и, кивнув, их клинки стали моими собственными."
	next_knowledge = list(
		/datum/heretic_knowledge/summon/maid_in_mirror,
		/datum/heretic_knowledge/ultimate/blade_final,
		/datum/heretic_knowledge/rifle,
	)
	spell_to_add = /datum/action/cooldown/spell/pointed/projectile/furious_steel
	cost = 1
	route = PATH_BLADE

/datum/heretic_knowledge/ultimate/blade_final
	name = "Maelstrom of Silver"
	desc = "Ритуал вознесения Пути Клинков. \
		Принесите 3 безголовых трупа к руне трансмутации, чтобы завершить ритуал. \
		После завершения вы будете окружены постоянно восстанавливающимися вращающимися клинками. \
		Эти клинки защищают вас от всех атак, но расходуются при использовании. \
		Ваше заклинание Furious Steel также будет иметь более короткое время перезарядки. \
		Кроме того, вы становитесь мастером боя, получая полный иммунитет к ранениям и оглушению. \
		Ваши клинки Закаленные клинки наносят бонусный урон и исцеляют вас при атаке на часть нанесенного урона."
	gain_text = "Разорванный чемпион освобожден! Я стану воссоединенным клинком, и с моими более великими амбициями, \
		МНЕ НЕТ РАВНЫХ! БУРЯ ИЗ СТАЛИ И СЕРЕБРА НАДВИГАЕТСЯ НА НАС! УЗРИТЕ МОЕ ВОССНЕСЕНИЕ!"
	route = PATH_BLADE

/datum/heretic_knowledge/ultimate/blade_final/is_valid_sacrifice(mob/living/carbon/human/sacrifice)
	. = ..()
	if(!.)
		return FALSE

	return !sacrifice.get_bodypart(BODY_ZONE_HEAD)

/datum/heretic_knowledge/ultimate/blade_final/on_finished_recipe(mob/living/user, list/selected_atoms, turf/loc)
	. = ..()
	priority_announce("[generate_heretic_text()] Мастер клинков, ученик Разорванного чемпиона, [user.real_name] возвысился! Их сталь - это сталь, которая разрежет реальность в вихре серебра! [generate_heretic_text()]","[generate_heretic_text()]", ANNOUNCER_SPANOMALIES)
	user.client?.give_award(/datum/award/achievement/misc/blade_ascension, user)
	user.add_traits(list(TRAIT_STUNIMMUNE, TRAIT_NEVER_WOUNDED), name)
	RegisterSignal(user, COMSIG_HERETIC_BLADE_ATTACK, PROC_REF(on_eldritch_blade))
	user.apply_status_effect(/datum/status_effect/protective_blades/recharging, null, 8, 30, 0.25 SECONDS, 1 MINUTES)

	var/datum/action/cooldown/spell/pointed/projectile/furious_steel/steel_spell = locate() in user.actions
	steel_spell?.cooldown_time /= 2

/datum/heretic_knowledge/ultimate/blade_final/proc/on_eldritch_blade(mob/living/source, mob/living/target, obj/item/melee/sickly_blade/blade)
	SIGNAL_HANDLER

	if(target == source)
		return

	// Turns your heretic blades into eswords, pretty much.
	var/bonus_damage = clamp(30 - blade.force, 0, 12)

	target.apply_damage(
		damage = bonus_damage,
		damagetype = BRUTE,
		spread_damage = TRUE,
		wound_bonus = 5,
		sharpness = SHARP_EDGED,
		attack_direction = get_dir(source, target),
	)

	if(target.stat != DEAD)
		// And! Get some free healing for a portion of the bonus damage dealt.
		source.heal_overall_damage(bonus_damage / 2, bonus_damage / 2)
