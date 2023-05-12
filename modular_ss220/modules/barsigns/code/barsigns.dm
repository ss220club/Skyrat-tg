/obj/machinery/barsign // All Signs are 64 by 32 pixels, they take two tiles
	name = "bar sign"
	desc = "Барная вывеска, которая каким-то образом не была инициализирована. Жалуйся кодеру!"
	icon = 'modular_ss220/modules/barsigns/icons/barsigns.dmi'
	icon_state = "empty"
	req_access = list(ACCESS_BAR)
	max_integrity = 500
	integrity_failure = 0.5
	armor_type = /datum/armor/sign_barsign
	active_power_usage = BASE_MACHINE_ACTIVE_CONSUMPTION * 0.15
	/// Selected barsign being used
	var/datum/barsign/chosen_sign

/datum/armor/sign_barsign
	melee = 20
	bullet = 20
	laser = 20
	energy = 100
	fire = 50
	acid = 50

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/barsign, 32)

/obj/machinery/barsign/Initialize(mapload)
	. = ..()
	set_sign(new /datum/barsign/hiddensigns/signoff)

/obj/machinery/barsign/proc/set_sign(datum/barsign/sign)
	if(!istype(sign))
		return

	if(sign.rename_area)
		rename_area(src, sign.name)

	chosen_sign = sign
	update_appearance()

/obj/machinery/barsign/update_icon_state()
	if(!(machine_stat & (NOPOWER|BROKEN)) && chosen_sign && chosen_sign.icon)
		icon_state = chosen_sign.icon
	else
		icon_state = "empty"

	return ..()

/obj/machinery/barsign/update_desc()
	. = ..()

	if(chosen_sign && chosen_sign.desc)
		desc = chosen_sign.desc

/obj/machinery/barsign/update_name()
	. = ..()
	if(chosen_sign && chosen_sign.rename_area)
		name = "[initial(name)] ([chosen_sign.name])"
	else
		name = "[initial(name)]"

/obj/machinery/barsign/update_overlays()
	. = ..()

	if(machine_stat & (NOPOWER|BROKEN))
		return

	if(chosen_sign && chosen_sign.light_mask)
		. += emissive_appearance(icon, "[chosen_sign.icon]-light-mask", src)

/obj/machinery/barsign/update_appearance(updates=ALL)
	. = ..()
	if(machine_stat & (NOPOWER|BROKEN))
		set_light(0)
		return
	if(chosen_sign && chosen_sign.neon_color)
		set_light(MINIMUM_USEFUL_LIGHT_RANGE, 0.7, chosen_sign.neon_color)

/obj/machinery/barsign/proc/set_sign_by_name(sign_name)
	for(var/datum/barsign/sign as anything in subtypesof(/datum/barsign))
		if(initial(sign.name) == sign_name)
			var/new_sign = new sign
			set_sign(new_sign)

/obj/machinery/barsign/atom_break(damage_flag)
	. = ..()
	if((machine_stat & BROKEN) && !(flags_1 & NODECONSTRUCT_1))
		set_sign(new /datum/barsign/hiddensigns/signoff)

/obj/machinery/barsign/deconstruct(disassembled = TRUE)
	new /obj/item/stack/sheet/iron(drop_location(), 2)
	new /obj/item/stack/cable_coil(drop_location(), 2)
	qdel(src)

/obj/machinery/barsign/play_attack_sound(damage_amount, damage_type = BRUTE, damage_flag = 0)
	switch(damage_type)
		if(BRUTE)
			playsound(src.loc, 'sound/effects/glasshit.ogg', 75, TRUE)
		if(BURN)
			playsound(src.loc, 'sound/items/welder.ogg', 100, TRUE)

/obj/machinery/barsign/attack_ai(mob/user)
	return attack_hand(user)

/obj/machinery/barsign/attack_hand(mob/user, list/modifiers)
	. = ..()
	if(.)
		return
	if(!allowed(user))
		balloon_alert(user, "доступ запрещён!")
		return
	if(machine_stat & (NOPOWER|BROKEN|EMPED))
		balloon_alert(user, "управление не работает!")
		return
	pick_sign(user)

/obj/machinery/barsign/screwdriver_act(mob/living/user, obj/item/tool)
	tool.play_tool_sound(src)
	panel_open = !panel_open
	if(panel_open)
		balloon_alert(user, "панель открыта")
		set_sign(new /datum/barsign/hiddensigns/signoff)
		return TOOL_ACT_TOOLTYPE_SUCCESS

	balloon_alert(user, "панель закрыта")

	if(machine_stat & (NOPOWER|BROKEN) || !chosen_sign)
		set_sign(new /datum/barsign/hiddensigns/signoff)
	else
		set_sign(chosen_sign)

	return TOOL_ACT_TOOLTYPE_SUCCESS

/obj/machinery/barsign/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/stack/cable_coil) && panel_open)
		var/obj/item/stack/cable_coil/wire = I

		if(atom_integrity >= max_integrity)
			balloon_alert(user, "ремонт не нужен!")
			return TRUE

		if(!wire.use(2))
			balloon_alert(user, "нужно два кабеля!")
			return TRUE

		balloon_alert(user, "отремонтировано")
		atom_integrity = max_integrity
		set_machine_stat(machine_stat & ~BROKEN)
		update_appearance()
		return TRUE

	// if barsigns ever become a craftable or techweb wall mount then remove this
	if(machine_stat & BROKEN)
		return TRUE

	return ..()

/obj/machinery/barsign/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return

	set_machine_stat(machine_stat | EMPED)
	addtimer(CALLBACK(src, PROC_REF(fix_emp), chosen_sign), 60 SECONDS)
	set_sign(new /datum/barsign/hiddensigns/empbarsign)

/// Callback to un-emp the sign some time.
/obj/machinery/barsign/proc/fix_emp(datum/barsign/sign)
	set_machine_stat(machine_stat & ~EMPED)
	if(!istype(sign))
		return

	set_sign(sign)

/obj/machinery/barsign/emag_act(mob/user)
	if(machine_stat & (NOPOWER|BROKEN|EMPED))
		balloon_alert(user, "управление не работает")
		return

	balloon_alert(user, "нелегальная вывеска загружена.")
	sleep(10 SECONDS)
	set_sign(new /datum/barsign/hiddensigns/syndibarsign)


/obj/machinery/barsign/proc/pick_sign(mob/user)
	var/picked_name = tgui_input_list(user, "Доступные вывески", "Барная вывеска", sort_list(get_bar_names()))
	if(isnull(picked_name))
		return
	set_sign_by_name(picked_name)
	SSblackbox.record_feedback("tally", "barsign_picked", 1, chosen_sign.type)

/proc/get_bar_names()
	var/list/names = list()
	for(var/d in subtypesof(/datum/barsign))
		var/datum/barsign/D = d
		if(!initial(D.hidden))
			names += initial(D.name)
	. = names

/datum/barsign
	/// User-visible name of the sign.
	var/name
	/// Icon state associated with this sign
	var/icon
	/// Description shown in the sign's examine text.
	var/desc
	/// Hidden from list of selectable options.
	var/hidden = FALSE
	/// Rename the area when this sign is selected.
	var/rename_area = TRUE
	/// If a barsign has a light mask for emission effects
	var/light_mask = TRUE
	/// The emission color of the neon light
	var/neon_color

/datum/barsign/New()
	if(!desc)
		desc = "It displays \"[name]\"."

// Specific bar signs.

/datum/barsign/maltesefalcon
	name = "Maltese Falcon"
	icon = "maltesefalcon"
	desc = "Мальтийский сокол, Космический Бар и Гриль."
	neon_color = "#5E8EAC"

/datum/barsign/thebark
	name = "The Bark"
	icon = "thebark"
	desc = "Бар выбранный Ианом."
	neon_color = "#f7a604"

/datum/barsign/harmbaton
	name = "The Harmbaton"
	icon = "theharmbaton"
	desc = "Отличное место как для сотрудников службы безопасности, так и для ассистентов."
	neon_color = "#ff7a4d"

/datum/barsign/thesingulo
	name = "The Singulo"
	icon = "thesingulo"
	desc = "Сюда идут люди, которые предпочли бы, чтобы их не называли по имени."
	neon_color = "#E600DB"

/datum/barsign/thedrunkcarp
	name = "The Drunk Carp"
	icon = "thedrunkcarp"
	desc = "Не пей, и не плавай."
	neon_color = "#a82196"

/datum/barsign/officerbeersky
	name = "Officer Beersky's"
	icon = "officerbeersky"
	desc = "Отлети в отключку быстрее чем от бибски."
	neon_color = "#16C76B"

/datum/barsign/slipperyshots
	name = "Slippery Shots"
	icon = "slipperyshots"
	desc = "Скользкая дорожка к пьянству с нашими шотами!"
	neon_color = "#70DF00"

/datum/barsign/thegreytide
	name = "The Grey Tide"
	icon = "thegreytide"
	desc = "Откажись от тулбоксинга и наслаждайся пивом!"
	neon_color = "#00F4D6"

/datum/barsign/honkednloaded
	name = "Honked 'n' Loaded"
	icon = "honkednloaded"
	desc = "Хонк."
	neon_color = "#FF998A"

/datum/barsign/thenest
	name = "The Nest"
	icon = "thenest"
	desc = "Отличное место для отдыха с выпивкой после долгой ночной борьбы с преступностью."
	neon_color = "#4d6796"

/datum/barsign/thecoderbus
	name = "The Coderbus"
	icon = "thecoderbus"
	desc = "Очень противоречивый бар, известный своим широким выбором постоянно меняющихся напитков."
	neon_color = "#ffffff"

/datum/barsign/theadminbus
	name = "The Adminbus"
	icon = "theadminbus"
	desc = "Заведение, посещаемое в основном космическими судьями. Здесь гораздо реже происходят взрывы, чем на судебных слушаниях."
	neon_color = "#ffffff"

/datum/barsign/oldcockinn
	name = "The Old Cock Inn"
	icon = "oldcockinn"
	desc = "Этот знак вызывает в вас отчаяние."
	neon_color = "#a4352b"

/datum/barsign/thewretchedhive
	name = "The Wretched Hive"
	icon = "thewretchedhive"
	desc = "В соответиствии с юридическими обязательствами, рекомендуется проверить напитки на наличие кислоты перед их употреблением."
	neon_color = "#26b000"

/datum/barsign/robustacafe
	name = "The Robusta Cafe"
	icon = "robustacafe"
	desc = "Пятилетний чемпион в номинации 'Самые опасные драки в баре'."
	neon_color = "#c45f7a"

/datum/barsign/emergencyrumparty
	name = "The Emergency Rum Party"
	icon = "emergencyrumparty"
	desc = "Недавно получивший лицензию после длительного закрытия."
	neon_color = "#f90011"

/datum/barsign/combocafe
	name = "The Combo Cafe"
	icon = "combocafe"
	desc = "Renowned system-wide for their utterly uncreative drink combinations."
	neon_color = "#33ca40"

/datum/barsign/vladssaladbar
	name = "Vlad's Salad Bar"
	icon = "vladssaladbar"
	desc = "Известное во всей системе заведение своими абсолютно неоригинальными комбинациями напитков."
	neon_color = "#306900"

/datum/barsign/theshaken
	name = "The Shaken"
	icon = "theshaken"
	desc = "Тут не подают бурду."
	neon_color = "#dcd884"

/datum/barsign/thealenath
	name = "The Ale' Nath"
	icon = "thealenath"
	desc = "Хорошо, приятель, думаю ТЕБЕ ХВАТИТ, пора вызывать такси."
	neon_color = "#ed0000"

/datum/barsign/thealohasnackbar
	name = "The Aloha Snackbar"
	icon = "alohasnackbar"
	desc = "Бар с гавайскими нотками, АЛОХА!"
	neon_color = ""

/datum/barsign/thenet
	name = "The Net"
	icon = "thenet"
	desc = "Посетив этот бар, можешь случайно закосплеить программиста."
	neon_color = "#0e8a00"

/datum/barsign/maidcafe
	name = "Maid Cafe"
	icon = "maidcafe"
	desc = "С возвращением, хозяин!"
	neon_color = "#ff0051"

/datum/barsign/the_lightbulb
	name = "The Lightbulb"
	icon = "the_lightbulb"
	desc = "Кафе, популярное среди молей. Однажды оно было закрыто на неделю после того, как бармен использовал нафталин для защиты своих запасных форм."
	neon_color = "#faff82"

/datum/barsign/goose
	name = "The Loose Goose"
	icon = "goose"
	desc = "Пей до тошноты и/или нарушай законы реальности!"
	neon_color = "#00cc33"

// Hidden signs list below this point

/datum/barsign/hiddensigns
	hidden = TRUE

/datum/barsign/hiddensigns/empbarsign
	name = "EMP'd"
	icon = "empbarsign"
	desc = "Что-то явно не так."
	rename_area = FALSE

/datum/barsign/hiddensigns/syndibarsign
	name = "Syndi Cat"
	icon = "syndibarsign"
	desc = "Синдикат или смерть."
	neon_color = "#ff0000"

/datum/barsign/hiddensigns/signoff
	name = "Off"
	icon = "empty"
	desc = "Эта вывеска не выглядит включенной."
	rename_area = FALSE
	light_mask = FALSE

// For other locations that aren't in the main bar
/obj/machinery/barsign/all_access
	req_access = null

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/barsign/all_access, 32)

///////////////////////////////////////
///Skyrat signs list below this point//
///////////////////////////////////////

/datum/barsign/spaceballgrille
	name = "Spaceball Grille"
	icon = "spaceballgrille"
	desc = "Повышенный шанс отъехать не от выпивки, а от болельщиков"

/datum/barsign/limbo
	name = "The Limbo"
	icon = "limbo"
	desc = "Популярное место для заблудших душ. Освещение создаёт убийственную атмосферу!"

/datum/barsign/cindikate
	name = "Cindi Kate's"
	icon = "cindikate"

/datum/barsign/theclownshead
	name = "The Clown's Head"
	icon = "theclownshead"
	desc = "Дом Хедди, хонкающей головы клоуна!"

/datum/barsign/thedamnwall
	name = "The Damn Wall"
	icon = "thedamnwall"
	desc = "Когда вы прижаты к стене, лучше иметь рядом с собой верных друзей и крепкий алкоголь."

/datum/barsign/maltesefalconmk2
	name = "Maltese Falcon MK2"
	icon = "maltesefalconmk2"
	desc = "«Мальтийский сокол» второй версии, теперь вкрутую."

/datum/barsign/thecavernmk2
	name = "The Cavern MK2"
	icon = "thecavernmk2"
	desc = "Хорошие напитки под хорошую музыку."

/datum/barsign/lv426
	name = "LV-426"
	icon = "lv426"
	desc = "Пить в изысканной маске явно важнее, чем идти в мед."

/datum/barsign/ishimura
	name = "Ishimura"
	icon = "ishimura"
	desc = "Не путать с одноимённым судном."

/datum/barsign/tardis
	name = "Tardis"
	icon = "tardis"
	desc = "Это заведение прошло как минимум 5 343 итерации."

/datum/barsign/vault13
	name = "Vault 13"
	icon = "vault13"
	desc = "Воду не подают."

/datum/barsign/thehive
	name = "The Hive"
	icon = "thehive"

/datum/barsign/milliways42
	name = "Milliways 42"
	icon = "milliways42"
	desc = "Это не конец, это начало, смысл и ответ на все ваши потребности в напитках."

/datum/barsign/timeofeve
	name = "The Time of Eve"
	icon = "thetimeofeve"
	desc = "Ретро-напитки из 2453 года!"

/datum/barsign/spaceasshole
	name = "Space Asshole"
	icon = "spaceasshole"
	desc = "Открыт с 2125 года. С тех пор многое изменилось, однако шахтёры по-прежнему скорее разобъют вам лицо, нежели доставят руду."

/datum/barsign/birdcage
	name = "The Bird Cage"
	icon = "birdcage"
	desc = "Кар."

/datum/barsign/narsie
	name = "Narsie Bistro"
	icon = "narsiebistro"
	desc = "Последний паб перед Концом Света."

/datum/barsign/fallout
	name = "The Booze Bunker"
	icon = "boozebunker"
	desc = "Выпей перед ядерным взрывом!"

/datum/barsign/brokendreams
	name = "The Cafe of Broken Dreams"
	icon = "brokendreams"
	desc = "Попробуй наши новые бургеры с собачатиной!"

/datum/barsign/blueoyster
	name = "The Blue Oyster"
	icon = "blueoyster"
	desc = "Абсолютно точно бар в котором только гетеросексуальные мужчины, зайди и убедись в этом сам."

/datum/barsign/commie
	name = "Prole's Preferred"
	icon = "commie"
	desc = "Единственный бар, который вам понадобится, товарищ!"

/datum/barsign/brokenheros
	name = "The Bar of Broken Heros"
	icon = "brokenheros"
	desc = "Тебе нравится причинять боль людям?"

/datum/barsign/chemlab
	name = "The Chem Lab"
	icon = "chemlab"
	desc = "Откисай не только от спиртного!"

/datum/barsign/mime
	name = "Moonshine Mime"
	icon = "mime"
	desc = "Тише."

///////////////////////////////////////
///SS220 signs list below this point///
///////////////////////////////////////

/datum/barsign/evahumanspace
	name = "SS220 EVA Human in Space"
	icon = "evahumanspace"
	desc = "Безопасность - это привелегия."

/datum/barsign/warpsurf
	name = "SS220 Warp Surf"
	icon = "warpsurf"
	desc = "Welcome to the club, buddy!"

/datum/barsign/papacafe
	name = "SS220 Space Daddy's Cafe"
	icon = "papacafe"
	desc = "Уважай своего Космического Папу!"

/datum/barsign/wycctide
	name = "SS220 Wycctide"
	icon = "wycctide"
	desc = "О нет, он близится!"

/datum/barsign/shitcur
	name = "SS220 Shitcur"
	icon = "shitcur"
	desc = "Невиновность ничего не доказывает."

/datum/barsign/pourndot
	name = "SS220 Pour and that's it"
	icon = "pourndot"
	desc = "Нальют и Точка. Тяжёлые времена приближаются."

/datum/barsign/moonipub
	name = "SS220 Mooniverse pub"
	icon = "mooni"
	desc = "Совершенно новый паб."

