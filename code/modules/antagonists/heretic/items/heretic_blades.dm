
/obj/item/melee/sickly_blade
	name = "\improper sickly blade"
	desc = "Болезненно-зеленый полумесячный клинок, украшенный декоративным глазом. Вы чувствуете, что за вами наблюдают..."
	icon = 'icons/obj/eldritch.dmi'
	icon_state = "eldritch_blade"
	inhand_icon_state = "eldritch_blade"
	lefthand_file = 'icons/mob/inhands/64x64_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/64x64_righthand.dmi'
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	flags_1 = CONDUCT_1
	sharpness = SHARP_EDGED
	w_class = WEIGHT_CLASS_NORMAL
	force = 20
	throwforce = 10
	toolspeed = 0.375
	demolition_mod = 0.8
	hitsound = 'sound/weapons/bladeslice.ogg'
	armour_penetration = 35
	attack_verb_continuous = list("attacks", "slashes", "stabs", "slices", "tears", "lacerates", "rips", "dices", "rends")
	attack_verb_simple = list("attack", "slash", "stab", "slice", "tear", "lacerate", "rip", "dice", "rend")
	var/after_use_message = ""

/obj/item/melee/sickly_blade/attack(mob/living/M, mob/living/user)
	if(!IS_HERETIC_OR_MONSTER(user))
		to_chat(user, span_danger("Вы чувствуете, как импульс чужого интеллекта бьет по вашему разуму!"))
		var/mob/living/carbon/human/human_user = user
		human_user.AdjustParalyzed(5 SECONDS)
		return TRUE

	return ..()

/obj/item/melee/sickly_blade/attack_self(mob/user)
	var/turf/safe_turf = find_safe_turf(zlevels = z, extended_safety_checks = TRUE)
	if(IS_HERETIC_OR_MONSTER(user))
		if(do_teleport(user, safe_turf, channel = TELEPORT_CHANNEL_MAGIC))
			to_chat(user, span_warning("Когда вы разбиваете [src], вы чувствуете, как порыв энергии проходит через ваше тело. [after_use_message]"))
		else
			to_chat(user, span_warning("Вы разбиваете [src], но ваша мольба остается без ответа."))
	else
		to_chat(user,span_warning("Вы разбиваете [src]."))
	playsound(src, SFX_SHATTER, 70, TRUE) //copied from the code for smashing a glass sheet onto the ground to turn it into a shard
	qdel(src)

/obj/item/melee/sickly_blade/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(!isliving(target))
		return

	if(proximity_flag)
		SEND_SIGNAL(user, COMSIG_HERETIC_BLADE_ATTACK, target, src)
	else
		SEND_SIGNAL(user, COMSIG_HERETIC_RANGED_BLADE_ATTACK, target, src)

/obj/item/melee/sickly_blade/examine(mob/user)
	. = ..()
	if(!IS_HERETIC_OR_MONSTER(user))
		return

	. += span_notice("Вы можете разбить клинок, чтобы телепортироваться в случайное (в основном) безопасное место, <b>активировав его в руке</b>.")

// Path of Rust's blade
/obj/item/melee/sickly_blade/rust
	name = "\improper rusted blade"
	desc = "Этот полумесячный клинок обветшал и заржавел. \
		И все же он кусается, разрывая плоть и кости зазубренными гнилыми зубами."
	icon_state = "rust_blade"
	inhand_icon_state = "rust_blade"
	after_use_message = "Ржавые Холмы слышат ваш зов..."

// Path of Ash's blade
/obj/item/melee/sickly_blade/ash
	name = "\improper ashen blade"
	desc = "Расплавленный и необработанный кусок металла, искореженный в труху и шлак. \
		Несделанный, он стремится быть большим, чем он является, и срезает тупым краем раны, заполняя их сажей."
	icon_state = "ash_blade"
	inhand_icon_state = "ash_blade"
	after_use_message = "Ночной дозорный слышит ваш зов..."
	resistance_flags = FIRE_PROOF

// Path of Flesh's blade
/obj/item/melee/sickly_blade/flesh
	name = "\improper bloody blade"
	desc = "Полумесячный клинок, рожденный из искореженного существа. \
		Он стремится передать другим те страдания, которые он пережил от своего ужасного происхождения."
	icon_state = "flesh_blade"
	inhand_icon_state = "flesh_blade"
	after_use_message = "Маршал слышит ваш зов..."

// Path of Void's blade
/obj/item/melee/sickly_blade/void
	name = "\improper void blade"
	desc = "Лишенный всякой субстанции, этот клинок отражает небытие. \
		Это настоящее отображение чистоты, и хаоса, который наступает после его применения."
	icon_state = "void_blade"
	inhand_icon_state = "void_blade"
	after_use_message = "Аристократ слышит ваш зов..."

// Path of the Blade's... blade.
// Opting for /dark instead of /blade to avoid "sickly_blade/blade".
/obj/item/melee/sickly_blade/dark
	name = "\improper sundered blade"
	desc = "Галантный клинок, раздробленный и разорванный. \
		Клинок режет яростно. Серебряные шрамы навечно связывают его с темной целью."
	icon_state = "dark_blade"
	inhand_icon_state = "dark_blade"
	after_use_message = "Разорванный чемпион слышит ваш зов..."

// Path of Cosmos's blade
/obj/item/melee/sickly_blade/cosmic
	name = "\improper cosmic blade"
	desc = "Соринка небесного резонанса, сформированная в клинок, сотканный из звезд. \
		Радужный изгнанник, прокладывающий лучистые тропы, отчаянно стремящихся к объединению."
	icon_state = "cosmic_blade"
	inhand_icon_state = "cosmic_blade"
	after_use_message = "Звездочет слышит ваш зов..."
