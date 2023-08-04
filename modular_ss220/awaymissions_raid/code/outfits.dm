/datum/outfit/autorole
	name = "Autorole Base"

	//Для изменения icon_state. И всё.
	var/is_badget = TRUE
	var/card_icon = 'modular_ss220/awaymissions_raid/icons/card_badge.dmi'
	var/card_icon_state = "retro_id"

/datum/outfit/autorole/debug
	name = "Дебаггер (сообщите разработчику)"
	card_icon_state = "retro_ERT_leader"

	uniform = /obj/item/clothing/under/rank/centcom/officer
	ears = /obj/item/radio/headset/headset_cent/alt
	gloves = /obj/item/clothing/gloves/combat
	mask = /obj/item/clothing/mask/gas/sechailer


// ==========================
// CO. Передовое Управление Пространственных Сил
// ==========================
/datum/outfit/autorole/cp
	mask = /obj/item/clothing/mask/gas/alt
	//uniform = /obj/item/clothing/under/rank/cp/command
	shoes = /obj/item/clothing/shoes/combat/swat
	//l_hand = /obj/item/storage/box/expeditionary_survival


// Командование
/datum/outfit/autorole/cp/com
	uniform = /obj/item/clothing/under/rank/cp/command

/datum/outfit/autorole/cp/com/commandant //Капитан
	name = "Коммандант"
	card_icon_state = "retro_deathsquad"

/datum/outfit/autorole/cp/com/commass //ГП
	name = "Заместитель Комманданта"
	card_icon_state = "retro_ERT_leader"

/datum/outfit/autorole/cp/com/inspector //НТР
	name = "Инспектор"
	card_icon_state = "retro_centcom"

/datum/outfit/autorole/cp/com/commandor	// ГСБ
	name = "Коммандор Оперативной Группы"
	card_icon_state = "retro_ERT_security"

/datum/outfit/autorole/cp/com/sci	//РД
	name = "Старший Научный Исследователь"
	card_icon_state = "retro_ERT_janitorial"

/datum/outfit/autorole/cp/com/med	//СМО
	name = "Старший Биологический Исследователь"
	card_icon_state = "retro_ERT_medical"

/datum/outfit/autorole/cp/com/tech //СЕ
	name = "Старший Техник"
	card_icon_state = "retro_ERT_engineering"

/datum/outfit/autorole/cp/com/qm	//КМ
	name = "Начальник Снабжения"
	card_icon_state = "retro_silver"

//Оперативники
/datum/outfit/autorole/cp/operative	//СБ
	name = "Полевой Оперативник"
	card_icon_state = "retro_security"
	uniform = /obj/item/clothing/under/rank/cp/operative
	mask = /obj/item/clothing/mask/gas/full

/datum/outfit/autorole/cp/operative/brigade	//Варден
	name = "Полевой Бригадир"
	card_icon_state = "retro_ERT_security"

/datum/outfit/autorole/cp/operative/scout	//Детектив
	name = "Офицер Разведки"
	card_icon_state = "retro_HOS"

/datum/outfit/autorole/cp/operative/interrogator	//Надзиратель
	name = "Дознаватель"
	card_icon_state = "retro_HOS"

/datum/outfit/autorole/cp/operative/heavy	//Шахтер
	name = "Полевой Тяжелый Оперативник"
	card_icon_state = "retro_security"

	head = /obj/item/clothing/head/helmet/nri_heavy
	suit = /obj/item/clothing/suit/armor/heavy/nri
	glasses = /obj/item/clothing/glasses/hud/security/night
	mask = /obj/item/clothing/mask/gas/hecu2
	belt = /obj/item/storage/belt/military/nri/heavy
	suit_store = null
	back = /obj/item/storage/backpack/duffelbag/syndie/nri
	backpack_contents = list(/obj/item/storage/box/nri_survival_pack,
							/obj/item/storage/medkit/emergency,
							/obj/item/advanced_choice_beacon/nri/heavy,
							/obj/item/beamout_tool,
							/obj/item/crucifix)
	l_pocket = /obj/item/wrench/combat

	l_hand = /obj/item/gun/ballistic/automatic/pistol/aps


// специальные оперативники
/datum/outfit/autorole/cp/operative/solarshield //БЩ
	name = "Офицер \"SolarShield\""
	card_icon_state = "retro_nanotrasen"

/datum/outfit/autorole/cp/operative/guard
	card_icon_state = "retro_security"
	mask = /obj/item/clothing/mask/gas/hecu1

/datum/outfit/autorole/cp/operative/guard/science 	// охрана меда и ученых
	name = "Охранник Научной Группы"

/datum/outfit/autorole/cp/operative/guard/supply	// охрана сервиса и карго
	name = "Охранник Группы Снабжения"

/datum/outfit/autorole/cp/prisoner	//Заключенный
	name = "Отмычка"
	card_icon_state = "retro_prisoner"
	mask = /obj/item/clothing/mask/gas/soviet


// Оперативники Сервиса
/datum/outfit/autorole/cp/field
	name = "Полевой Ассистент" //Ассистент, сервисники
	card_icon_state = "retro_id"

/datum/outfit/autorole/cp/field/clown
	name = "Полевой Клоун"
	card_icon_state = "retro_clown"

/datum/outfit/autorole/cp/field/mime
	name = "Полевой Мим"
	card_icon_state = "retro_mime"

/datum/outfit/autorole/cp/field/priest
	name = "Полевой Священник"

/datum/outfit/autorole/cp/field/psych
	name = "Полевой Психолог"

/datum/outfit/autorole/cp/field/adviser		// АВД
	name = "Полевой Советник"

/datum/outfit/autorole/cp/field/reporter	// библиотекарь
	name = "Полевой Репортер"

/datum/outfit/autorole/cp/field/cook
	name = "Полевой Кухарь"

/datum/outfit/autorole/cp/field/barber	// просто потому что кто-то его решит взять.
	name = "Полевой Нарезчик"

// Технические оперативники
/datum/outfit/autorole/cp/tech	//Инженер
	name = "Полевой Техник"
	card_icon_state = "retro_engineering"
	uniform = /obj/item/clothing/under/rank/cp/tech

/datum/outfit/autorole/cp/tech/atmos	//Атмостех
	name = "Техник Обслуживания Систем Жизнеобеспечения"
	card_icon_state = "retro_CE"

/datum/outfit/autorole/cp/tech/mechanic	//Механик
	name = "Механик"
	card_icon_state = "retro_CE"


// Группа снабжения
/datum/outfit/autorole/cp/tech/cargo	//Каргонец
	name = "Грузовой Техник"
	card_icon_state = "retro_cargo"

/datum/outfit/autorole/cp/tech/cargo/inspector	// Таможенник CUSTOMS AGENT
	name = "Технический Инспектор"
	card_icon_state = "retro_cargo"


// Научная полевая группа
/datum/outfit/autorole/cp/sci	//Ученый, химик
	name = "Научный Исследователь"
	card_icon_state = "retro_research"
	uniform = /obj/item/clothing/under/rank/cp/science

/datum/outfit/autorole/cp/sci/bio	//Вирусолог, генетик
	name = "Биологический Исследователь"
	card_icon_state = "retro_RD"

/datum/outfit/autorole/cp/sci/bio/collector	//коронер, уборщик
	name = "Сборщик Биологических Образцов"
	card_icon_state = "retro_RD"

/datum/outfit/autorole/cp/sci/tech	//Робототехник
	name = "Технический Исследователь"
	card_icon_state = "retro_RD"

/datum/outfit/autorole/cp/sci/med	//Врач
	name = "Санитар"
	card_icon_state = "retro_medical"

/datum/outfit/autorole/cp/sci/med/field	//Бригмед, парамед
	name = "Полевой Санитар"
	card_icon_state = "retro_CMO"
