/*
*	SS220: Miscellaniuous overrides: Decals, Vendings, PDA's, etc.
*/

/*
* VENDING
*/
/obj/machinery/vending/wardrobe/sec_wardrobe
	name = "\improper SecDrobe"
	desc = "A vending machine for security and security-related clothing!"
	product_ads = "Beat perps in style!;It's red so you can't see the blood!;You have the right to be fashionable!;Now you can be the fashion police you always wanted to be!"
	vend_reply = "Thank you for using the SecDrobe!"
	icon = 'icons/obj/machines/vending.dmi'
	icon_state = "secdrobe"
	products = list(/obj/item/clothing/suit/hooded/wintercoat/security = 3,
					/obj/item/clothing/suit/toggle/jacket/sec = 3,
					/obj/item/clothing/neck/security_cape = 3,
					/obj/item/clothing/neck/security_cape/armplate = 3,
					/obj/item/storage/backpack/security = 5,
					/obj/item/storage/backpack/satchel/sec = 5,
					/obj/item/storage/backpack/duffelbag/sec = 5,
					/obj/item/clothing/under/rank/security/officer = 10,
					/obj/item/clothing/under/rank/security/officer/skirt = 10,
					/obj/item/clothing/under/rank/security/skyrat/utility = 5,
					/obj/item/clothing/shoes/jackboots/sec = 10,
					/obj/item/clothing/head/security_garrison = 10,
					/obj/item/clothing/head/soft/sec = 3,
					/obj/item/clothing/head/beret/sec = 3,
					/obj/item/clothing/mask/bandana/striped/security = 3,
					/obj/item/clothing/gloves/color/black/security = 10,
					)
	premium = list(	/obj/item/clothing/under/rank/security/officer/formal = 3,
					/obj/item/clothing/suit/jacket/officer/blue = 3,
					/obj/item/clothing/head/beret/sec/navyofficer = 3)
	refill_canister = /obj/item/vending_refill/wardrobe/sec_wardrobe
	payment_department = ACCOUNT_SEC
	light_color = COLOR_MOSTLY_PURE_RED

/obj/machinery/vending/security
	name = "\improper SecTech"
	desc = "A security equipment vendor."
	product_ads = "Crack communist skulls!;Beat some heads in!;Don't forget - harm is good!;Your weapons are right here.;Handcuffs!;Freeze, scumbag!;Don't tase me bro!;Tase them, bro.;Why not have a donut?"
	icon_state = "sec"
	icon_deny = "sec-deny"
	panel_type = "panel6"
	light_mask = "sec-light-mask"
	req_access = list(ACCESS_SECURITY)
	products = list(
		/obj/item/restraints/handcuffs = 8,
		/obj/item/restraints/handcuffs/cable/zipties = 12,
		/obj/item/grenade/flashbang = 6,
		/obj/item/assembly/flash/handheld = 8,
		/obj/item/food/donut/plain = 12,
		/obj/item/storage/box/evidence = 6,
		/obj/item/flashlight/seclite = 6,
		/obj/item/restraints/legcuffs/bola/energy = 10,
	)
	contraband = list(
		/obj/item/clothing/glasses/sunglasses = 2,
		/obj/item/storage/fancy/donut_box = 2,
	)
	premium = list(
		/obj/item/storage/belt/security/webbing = 4,
		/obj/item/coin/antagtoken = 1,
		/obj/item/clothing/head/helmet/blueshirt = 1,
		/obj/item/clothing/suit/armor/vest/blueshirt = 1,
		/obj/item/clothing/gloves/tackler = 5,
		/obj/item/grenade/stingbang = 5,
		/obj/item/watertank/pepperspray = 2,
	)
	refill_canister = /obj/item/vending_refill/security

/obj/machinery/vending/wardrobe/sec_wardrobe/bluesec
	name = "\improper Peacekeeper Outfitting Station"
	desc = "A vending machine stocked with Lopland's \"Peacekeeper\" security package, including standardized uniforms and general equipment."
	icon = 'modular_skyrat/modules/sec_haul/icons/vending/vending.dmi'
	light_mask = "sec-light-mask"
	icon_state = "peace"
	product_ads = "Beat perps in style!;The stains wash right out!;You have the right to be fashionable!;Now you can be the fashion police you always wanted to be!"
	vend_reply = "Good luck, Peacekeeper!"
	products = list(/obj/item/clothing/suit/hooded/wintercoat/security/bluesec = 5,
					/obj/item/clothing/suit/toggle/jacket/sec/bluesec = 5,
					/obj/item/clothing/suit/armor/vest/peacekeeper/brit = 5,
					/obj/item/clothing/neck/security_cape/bluesec = 5,
					/obj/item/clothing/neck/security_cape/bluesec/armplate = 5,
					/obj/item/storage/backpack/security/bluesec = 5,
					/obj/item/storage/backpack/satchel/sec/bluesec = 5,
					/obj/item/storage/backpack/duffelbag/sec/bluesec = 5,
					/obj/item/clothing/under/rank/security/officer/bluesec = 10,
					/obj/item/clothing/under/rank/security/peacekeeper/tactical = 4,
					/obj/item/clothing/under/rank/security/peacekeeper/sol/cadet = 3,
					/obj/item/clothing/under/rank/security/peacekeeper/sol = 3,
					/obj/item/clothing/under/rank/security/skyrat/utility/bluesec = 3,
					/obj/item/clothing/shoes/jackboots/sec/bluesec = 10,
					/obj/item/clothing/head/security_garrison/bluesec = 10,
					/obj/item/clothing/head/security_cap/bluesec = 10,
					/obj/item/clothing/head/beret/sec/peacekeeper = 5,
					/obj/item/clothing/head/costume/ushanka/sec = 10,
					/obj/item/clothing/head/hats/sec/peacekeeper/sol = 5,
					/obj/item/clothing/head/hats/sec/peacekeeper/sol/traffic = 5,
					/obj/item/clothing/gloves/color/black/security = 10,
					)
	premium = list( /obj/item/clothing/under/rank/security/officer/formal = 3,
					/obj/item/clothing/suit/jacket/officer/blue = 3,
					/obj/item/clothing/head/beret/sec/navyofficer = 3)
	refill_canister = /obj/item/vending_refill/wardrobe/peacekeeper_wardrobe
	payment_department = ACCOUNT_SEC
	light_color = COLOR_MODERATE_BLUE

/obj/machinery/vending/security/bluesec
	name = "\improper Armadyne Peacekeeper Equipment Vendor"
	desc = "An Armadyne peacekeeper equipment vendor."
	product_ads = "Crack capitalist skulls!;Beat some heads in!;Don't forget - harm is good!;Your weapons are right here.;Handcuffs!;Freeze, scumbag!;Don't tase me bro!;Tase them, bro.;Why not have a donut?"
	icon = 'modular_skyrat/modules/sec_haul/icons/vending/vending.dmi'
	icon_state = "sec"
	icon_deny = "sec-deny"
	light_mask = "sec-light-mask"
	req_access = list(ACCESS_SECURITY)
	products = list(
		/obj/item/restraints/handcuffs = 8,
		/obj/item/restraints/handcuffs/cable/zipties = 12,
		/obj/item/grenade/flashbang = 6,
		/obj/item/assembly/flash/handheld = 8,
		/obj/item/food/donut/plain = 12,
		/obj/item/storage/box/evidence = 6,
		/obj/item/flashlight/seclite = 6,
		/obj/item/restraints/legcuffs/bola/energy = 10,
	)
	contraband = list(
		/obj/item/clothing/glasses/sunglasses = 2,
		/obj/item/storage/fancy/donut_box = 2,
	)
	premium = list(
		/obj/item/storage/belt/security/webbing = 4,
		/obj/item/storage/belt/security/webbing/peacekeeper = 4,
		/obj/item/coin/antagtoken = 1,
		/obj/item/clothing/head/helmet/blueshirt = 3,
		/obj/item/clothing/suit/armor/vest/blueshirt = 3,
		/obj/item/clothing/gloves/tackler/security = 5,
		/obj/item/grenade/stingbang = 5,
		/obj/item/watertank/pepperspray = 2
	)
	refill_canister = /obj/item/vending_refill/security_peacekeeper

/*
* PDA
*/
/obj/item/modular_computer/pda/security
	greyscale_colors = "#EA3232#0000cc"

/obj/item/modular_computer/pda/detective
	greyscale_colors = "#805A2F#990202"

/obj/item/modular_computer/pda/warden
	greyscale_colors = "#EA3232#0000CC#363636"

/obj/item/modular_computer/pda/heads/hos
	greyscale_colors = "#EA3232#0000CC"

//Bluesec variants
/obj/item/modular_computer/pda/security/bluesec
	greyscale_colors = "#2B356D#1E1E1E"

/obj/item/modular_computer/pda/detective/bluesec
	greyscale_colors = "#90714F#1E1E1E"

/obj/item/modular_computer/pda/warden/bluesec
	greyscale_colors = "#2F416E#1E1E1E#ACACAC"

/obj/item/modular_computer/pda/heads/hos/bluesec
	greyscale_colors = "#2B356D#1E1E1E"

/*
* FLOOR TILES
*/
/obj/effect/turf_decal/trimline/red
	color = "#DE3A3A"

/obj/effect/turf_decal/tile/red
	name = "red corner"
	color = "#DE3A3A"

/*
* AIRLOCKS
*/
/obj/machinery/door/airlock/security
	icon = 'modular_skyrat/modules/aesthetics/airlock/icons/airlocks/station/security2.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_sec/old

/obj/machinery/door/airlock/security/glass
	icon = 'modular_skyrat/modules/aesthetics/airlock/icons/airlocks/station/security2.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_sec/old
	opacity = FALSE
	glass = TRUE
	normal_integrity = 400

//Bluesec airlock variants
/obj/machinery/door/airlock/security/bluesec
	icon = 'modular_skyrat/modules/aesthetics/airlock/icons/airlocks/station/security.dmi'
	overlays_file = 'modular_skyrat/modules/aesthetics/airlock/icons/airlocks/station/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_sec

/obj/machinery/door/airlock/security/bluesec/glass
	icon = 'modular_skyrat/modules/aesthetics/airlock/icons/airlocks/station/security.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_sec
	opacity = FALSE
	glass = TRUE
	normal_integrity = 400

/*
* LOCKERS
*/

/obj/structure/closet/secure_closet/security
	icon = 'icons/obj/storage/closet.dmi'

/obj/structure/closet/secure_closet/security/Initialize(mapload)
	. = ..()
	var/obj/item/to_delete = locate(/obj/item/clothing/head/security_cap) in loc
	if(to_delete)
		qdel(to_delete)

/obj/structure/closet/secure_closet/hos
	icon = 'icons/obj/storage/closet.dmi'

/obj/structure/closet/secure_closet/warden
	icon = 'icons/obj/storage/closet.dmi'

/obj/structure/closet/secure_closet/armory1
	icon = 'icons/obj/storage/closet.dmi'

/obj/structure/closet/secure_closet/armory2
	icon = 'icons/obj/storage/closet.dmi'

/obj/structure/closet/secure_closet/armory3
	icon = 'icons/obj/storage/closet.dmi'

//Bluesec closet variants
/obj/structure/closet/secure_closet/security/bluesec
	icon = 'modular_skyrat/modules/sec_haul/icons/lockers/closet.dmi'

/obj/structure/closet/secure_closet/hos/bluesec
	icon = 'modular_skyrat/modules/sec_haul/icons/lockers/closet.dmi'

/obj/structure/closet/secure_closet/warden/bluesec
	icon = 'modular_skyrat/modules/sec_haul/icons/lockers/closet.dmi'

/obj/structure/closet/secure_closet/armory1/bluesec
	icon = 'modular_skyrat/modules/sec_haul/icons/lockers/closet.dmi'

/obj/structure/closet/secure_closet/armory2/bluesec
	icon = 'modular_skyrat/modules/sec_haul/icons/lockers/closet.dmi'

/obj/structure/closet/secure_closet/armory3/bluesec
	icon = 'modular_skyrat/modules/sec_haul/icons/lockers/closet.dmi'

/*
* PATH FIXES (skin choose where it doesn't needed, icon paths, adjust)
*/
/obj/item/clothing/suit/armor/vest/warden/rax
	icon = 'modular_skyrat/master_files/icons/obj/clothing/suits/armor.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/suits/armor.dmi'
	icon_state = "vest_warden"
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON
	current_skin = null
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Basic Warden Armor" = list(
			RESKIN_ICON = 'icons/obj/clothing/suits/armor.dmi',
			RESKIN_ICON_STATE = "warden_alt",
			RESKIN_WORN_ICON = 'icons/mob/clothing/suits/armor.dmi',
			RESKIN_WORN_ICON_STATE = "warden_alt"
		),
		"Coat" = list(
			RESKIN_ICON = 'modular_skyrat/master_files/icons/obj/clothing/suits/armor.dmi',
			RESKIN_ICON_STATE = "warden_alt",
			RESKIN_WORN_ICON = 'modular_skyrat/master_files/icons/mob/clothing/suits/armor.dmi',
			RESKIN_WORN_ICON_STATE = "warden_alt"
		),
		"Standard" = list(
			RESKIN_ICON = 'modular_skyrat/master_files/icons/obj/clothing/suits/armor.dmi',
			RESKIN_ICON_STATE = "vest_warden",
			RESKIN_WORN_ICON = 'modular_skyrat/master_files/icons/mob/clothing/suits/armor.dmi',
			RESKIN_WORN_ICON_STATE = "vest_warden",
		),
		"Peacekeeper" = list(
			RESKIN_ICON = 'modular_skyrat/master_files/icons/obj/clothing/suits/armor.dmi',
			RESKIN_ICON_STATE = "peacekeeper_trench_warden",
			RESKIN_WORN_ICON = 'modular_skyrat/master_files/icons/mob/clothing/suits/armor.dmi',
			RESKIN_WORN_ICON_STATE = "peacekeeper_trench_warden",
			RESKIN_SUPPORTS_VARIATIONS_FLAGS = NONE
		)
	)

/obj/item/clothing/suit/armor/vest/warden/navyblue
	icon = 'icons/obj/clothing/suits/jacket.dmi'
	worn_icon = 'icons/mob/clothing/suits/jacket.dmi'
	icon_state = "wardenbluejacket"
	current_skin = "wardenbluejacket"
	uses_advanced_reskins = FALSE

/obj/item/clothing/suit/armor/vest/warden/syndicate
	icon = 'modular_skyrat/master_files/icons/obj/clothing/suits/armor.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/suits/armor.dmi'
	icon_state = "warden_syndie"
	current_skin = "warden_syndie"
	uses_advanced_reskins = FALSE

/obj/item/clothing/suit/armor/vest/warden/peacekeeper
	current_skin = "peacekeeper_trench_warden"
	uses_advanced_reskins = FALSE


/obj/item/clothing/suit/armor/hos/trenchcoat
	uses_advanced_reskins = FALSE

/obj/item/clothing/suit/armor/hos/trenchcoat/winter
	current_skin = "hoswinter"
	uses_advanced_reskins = FALSE

/obj/item/clothing/suit/armor/hos/trenchcoat/armadyne
	uses_advanced_reskins = FALSE

/obj/item/clothing/under/rank/security/head_of_security/skyrat/imperial
	can_adjust = FALSE

/*
* CUSTOM LOADOUTS DISABLE
* SS220: If we need to delete certain items from loadouts. This code doesn't work actually :pleading_face:
*/
// /datum/controller/configuration/Load(_directory)
// 	. = ..()
// 	GLOB.loadout_glasses -= /datum/loadout_item/glasses/aviator_security
// 	GLOB.loadout_glasses -= /datum/loadout_item/glasses/prescription_aviator_security
// 	GLOB.loadout_glasses -= /datum/loadout_item/glasses/retinal_projector_security
// 	GLOB.loadout_glasses -= /datum/loadout_item/head/ushanka/sec
// 	GLOB.loadout_glasses -= /datum/loadout_item/head/solofficercap
// 	GLOB.loadout_glasses -= /datum/loadout_item/head/soltrafficoff
// 	GLOB.loadout_glasses -= /datum/loadout_item/head/imperial_generic
// 	GLOB.loadout_glasses -= /datum/loadout_item/head/imperial_grey
// 	GLOB.loadout_glasses -= /datum/loadout_item/head/imperial_white
// 	GLOB.loadout_glasses -= /datum/loadout_item/suit/navybluejacketofficer
// 	GLOB.loadout_glasses -= /datum/loadout_item/suit/navybluejacketwarden
// 	GLOB.loadout_glasses -= /datum/loadout_item/suit/british_jacket
// 	GLOB.loadout_glasses -= /datum/loadout_item/under/jumpsuit/solwarden
// 	GLOB.loadout_glasses -= /datum/loadout_item/under/jumpsuit/security_trousers
// 	GLOB.loadout_glasses -= /datum/loadout_item/under/jumpsuit/solofficer
