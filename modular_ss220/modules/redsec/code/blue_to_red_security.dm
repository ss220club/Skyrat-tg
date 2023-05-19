/*
*	SS220: Miscellaniuous overrides Bluesec to Redsec, for vendings, loadouts, etc...
*/

/*
* VENDING
*/
/obj/machinery/vending/wardrobe/sec_wardrobe
	name = "\improper SecDrobe"
	desc = "A vending machine for security and security-related clothing!"
	product_ads = "Beat perps in style!;It's red so you can't see the blood!;You have the right to be fashionable!;Now you can be the fashion police you always wanted to be!"
	vend_reply = "Thank you for using the SecDrobe!"
	icon = 'icons/obj/vending.dmi'
	icon_state = "secdrobe"
	products = list(/obj/item/clothing/suit/hooded/wintercoat/security = 3,
					/obj/item/storage/backpack/security = 3,
					/obj/item/storage/backpack/satchel/sec = 3,
					/obj/item/storage/backpack/duffelbag/sec = 3,
					/obj/item/clothing/under/rank/security/officer = 3,
					/obj/item/clothing/shoes/jackboots/sec = 3,
					/obj/item/clothing/head/beret/sec = 3,
					/obj/item/clothing/head/soft/sec = 3,
					/obj/item/clothing/head/security_garrison = 3,
					/obj/item/clothing/mask/bandana/striped/security = 3,
					/obj/item/clothing/gloves/color/black/security = 3,
					/obj/item/clothing/under/rank/security/officer/skirt = 3,
					/obj/item/clothing/under/rank/security/skyrat/utility = 3,
					)
	premium = list(	/obj/item/clothing/under/rank/security/officer/formal = 3,
					/obj/item/clothing/suit/jacket/officer/blue = 3,
					/obj/item/clothing/head/beret/sec/navyofficer = 3)
	refill_canister = /obj/item/vending_refill/wardrobe/sec_wardrobe
	payment_department = ACCOUNT_SEC
	light_color = COLOR_MOSTLY_PURE_RED

/obj/machinery/vending/wardrobe/sec_wardrobe/bluesec
	name = "\improper Peacekeeper Outfitting Station"
	desc = "A vending machine stocked with Lopland's \"Peacekeeper\" security package, including standardized uniforms and general equipment."
	icon = 'modular_skyrat/modules/sec_haul/icons/vending/vending.dmi'
	light_mask = "sec-light-mask"
	icon_state = "peace"
	product_ads = "Beat perps in style!;The stains wash right out!;You have the right to be fashionable!;Now you can be the fashion police you always wanted to be!"
	vend_reply = "Good luck, Peacekeeper!"
	products = list(/obj/item/clothing/suit/hooded/wintercoat/security/bluesec = 5,
					/obj/item/clothing/suit/toggle/jacket/sec = 5,
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
					/obj/item/clothing/under/rank/security/skyrat/utility = 3,
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

/*
* BRIG COLORS
*/
//Floor decals
/obj/effect/turf_decal/trimline/red
	color = "#DE3A3A"

/obj/effect/turf_decal/tile/red
	name = "red corner"
	color = "#DE3A3A"

//Doors
/obj/machinery/door/airlock/security
	icon = 'modular_skyrat/modules/aesthetics/airlock/icons/airlocks/station/security2.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_sec

/obj/machinery/door/airlock/security/glass
	icon = 'modular_skyrat/modules/aesthetics/airlock/icons/airlocks/station/security2.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_sec
	opacity = FALSE
	glass = TRUE
	normal_integrity = 400

//Lockers
/obj/structure/closet/secure_closet/security
	icon = 'icons/obj/storage/closet.dmi'

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

/*
* CUSTOM LOADOUTS DISABLE
* SS220: Not actually ERP items, but we exploit it because there's no other option to disable it from loadout, УВЫ
*/

/datum/controller/configuration/Load(_directory)
	. = ..()
	GLOB.loadout_glasses -= /datum/loadout_item/glasses/aviator_security
	GLOB.loadout_glasses -= /datum/loadout_item/glasses/prescription_aviator_security
	GLOB.loadout_glasses -= /datum/loadout_item/glasses/retinal_projector_security
	GLOB.loadout_glasses -= /datum/loadout_item/head/ushanka/sec
	GLOB.loadout_glasses -= /datum/loadout_item/head/solofficercap
	GLOB.loadout_glasses -= /datum/loadout_item/head/soltrafficoff
	GLOB.loadout_glasses -= /datum/loadout_item/head/imperial_generic
	GLOB.loadout_glasses -= /datum/loadout_item/head/imperial_grey
	GLOB.loadout_glasses -= /datum/loadout_item/head/imperial_white
	GLOB.loadout_glasses -= /datum/loadout_item/suit/navybluejacketofficer
	GLOB.loadout_glasses -= /datum/loadout_item/suit/navybluejacketwarden
	GLOB.loadout_glasses -= /datum/loadout_item/suit/british_jacket
	GLOB.loadout_glasses -= /datum/loadout_item/under/jumpsuit/solwarden
	GLOB.loadout_glasses -= /datum/loadout_item/under/jumpsuit/security_trousers
	GLOB.loadout_glasses -= /datum/loadout_item/under/jumpsuit/solofficer
