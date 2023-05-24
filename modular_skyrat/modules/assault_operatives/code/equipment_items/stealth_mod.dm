/datum/mod_theme/covert
	name = "covert"
	desc = "Редко встречающийся дизайн МОДа неизвестного происхождения, покрытый гладкой броней и с угрожающе массивным лицевым щитком."
	extended_desc = "Не так уж много известно об этом типе костюма, который большинство тех, кто с ним сталкивается, называют \"Скрытным\". \
		Конструкция представляет собой обтекаемый слой, состоящий из формованного пласттитана и композитной керамики, \
		а нижняя часть костюма покрыта легким кевларом и гибридным плетением дюратред, обеспечивающим достаточную защиту пользователя в тех местах, где нет покрытия. \
		Имеет незаконный встроенный модуль абляционного щита с электрическим питанием для защиты от обычного энергетического оружия. Кроме того, \
		он имеет встроенную систему хамелеон, позволяющую маскировать костюм в неразвернутом состоянии. Также, \
		на костюме нет никаких опознавательных знаков или бирок, и даже цветовая гамма не подходит к ни одному производителю МОДов."
	default_skin = "stealth"
	armor_type = /datum/armor/mod_theme_covert
	resistance_flags = FIRE_PROOF | ACID_PROOF
	atom_flags = PREVENT_CONTENTS_EXPLOSION_1
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	siemens_coefficient = 0
	complexity_max = DEFAULT_MAX_COMPLEXITY + 5
	slowdown_inactive = 0
	slowdown_active = 0
	ui_theme = "hackerman"
	slot_flags = ITEM_SLOT_BELT
	inbuilt_modules = list(
		/obj/item/mod/module/storage/belt,
		/obj/item/mod/module/chameleon/contractor,
		/obj/item/mod/module/welding/camera_vision,
		/obj/item/mod/module/stealth,
	)
	allowed_suit_storage = list(
		/obj/item/flashlight,
		/obj/item/tank/internals,
		/obj/item/ammo_box,
		/obj/item/ammo_casing,
		/obj/item/restraints/handcuffs,
		/obj/item/assembly/flash,
		/obj/item/melee/baton,
		/obj/item/melee/energy/sword,
		/obj/item/shield/energy,
	)
	skins = list(
		"stealth" = list(
			MOD_ICON_OVERRIDE = 'modular_skyrat/modules/assault_operatives/icons/modsuits/mod.dmi',
			MOD_WORN_ICON_OVERRIDE = 'modular_skyrat/modules/assault_operatives/icons/modsuits/wornmod.dmi',
			HELMET_LAYER = NECK_LAYER,
			HELMET_FLAGS = list(
				UNSEALED_CLOTHING = SNUG_FIT,
				SEALED_CLOTHING = THICKMATERIAL|STOPSPRESSUREDAMAGE,
				UNSEALED_INVISIBILITY = HIDEFACIALHAIR,
				SEALED_INVISIBILITY = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDESNOUT,
				SEALED_COVER = HEADCOVERSMOUTH|HEADCOVERSEYES|PEPPERPROOF,
			),
			CHESTPLATE_FLAGS = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
			),
			GAUNTLETS_FLAGS = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
			),
			BOOTS_FLAGS = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
			),
		),
	)

/datum/armor/mod_theme_covert
	melee = 30
	bullet = 50
	laser = 40
	energy = 30
	bomb = 30
	bio = 30
	fire = 100
	acid = 100
	wound = 25

/obj/item/mod/control/pre_equipped/stealth_operative
	worn_icon = 'modular_skyrat/modules/assault_operatives/icons/modsuits/wornmod.dmi'
	icon = 'modular_skyrat/modules/assault_operatives/icons/modsuits/mod.dmi'
	icon_state = "stealth-control"
	theme = /datum/mod_theme/covert
	applied_cell = /obj/item/stock_parts/cell/hyper
	applied_modules = list(
		/obj/item/mod/module/dna_lock,
		/obj/item/mod/module/emp_shield,
		/obj/item/mod/module/visor/night,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/tether,
		/obj/item/mod/module/holster,
		/obj/item/mod/module/status_readout/generic,
	)

/obj/machinery/suit_storage_unit/industrial/assault_operative
	mod_type = /obj/item/mod/control/pre_equipped/stealth_operative
	storage_type = /obj/item/tank/internals/emergency_oxygen/double
