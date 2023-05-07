/*
*	SS220: Miscellaniuous overrides Bluesec to Redsec, for vendings, loadouts, etc...
*/

/*
* VENDING
*/
/obj/machinery/vending/wardrobe/sec_wardrobe
	name = "\improper SecDrobe"
	icon = 'icons/obj/vending.dmi'
	icon_state = "secdrobe"
	vend_reply = "Thank you for using the SecDrobe!"
	products = list(/obj/item/clothing/suit/hooded/wintercoat/security = 3,
					/obj/item/storage/backpack/security = 3,
					/obj/item/storage/backpack/satchel/sec = 3,
					/obj/item/storage/backpack/duffelbag/sec = 3,
					/obj/item/clothing/under/rank/security/officer = 3,
					/obj/item/clothing/shoes/jackboots/sec = 3,
					/obj/item/clothing/head/beret/sec = 3,
					/obj/item/clothing/head/soft/sec = 3,
					/obj/item/clothing/mask/bandana/striped/security = 3,
					/obj/item/clothing/gloves/color/black = 3,
					/obj/item/clothing/under/rank/security/officer/skirt = 3,
					/obj/item/clothing/under/rank/security/skyrat/utility = 3,
					)
	premium = list(	/obj/item/clothing/under/rank/security/officer/formal = 3,
					/obj/item/clothing/suit/jacket/officer/blue = 3,
					/obj/item/clothing/head/beret/sec/navyofficer = 3)
	refill_canister = /obj/item/vending_refill/wardrobe/sec_wardrobe
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
					/obj/item/clothing/neck/bluesec/security_cape = 5,
					/obj/item/clothing/neck/bluesec/security_cape/armplate = 5,
					/obj/item/storage/backpack/security/bluesec = 5,
					/obj/item/storage/backpack/satchel/sec/bluesec = 5,
					/obj/item/storage/backpack/duffelbag/sec/bluesec = 5,
					/obj/item/clothing/under/rank/security/bluesec/officer = 10,
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

/obj/machinery/vending/security
	name = "\improper SecTech"
	desc = "A security equipment vendor."
	product_ads = "Crack communist skulls!;Beat some heads in!;Don't forget - harm is good!;Your weapons are right here.;Handcuffs!;Freeze, scumbag!;Don't tase me bro!;Tase them, bro.;Why not have a donut?"
	icon = 'icons/obj/vending.dmi'
	icon_state = "sec"
	products = list(
		/obj/item/restraints/handcuffs = 8,
		/obj/item/restraints/handcuffs/cable/zipties = 10,
		/obj/item/grenade/flashbang = 4,
		/obj/item/assembly/flash/handheld = 5,
		/obj/item/food/donut/plain = 12,
		/obj/item/storage/box/evidence = 6,
		/obj/item/flashlight/seclite = 4,
		/obj/item/restraints/legcuffs/bola/energy = 7,
	)
	contraband = list(
		/obj/item/clothing/glasses/sunglasses = 2,
		/obj/item/storage/fancy/donut_box = 2,
	)
	premium = list(
		/obj/item/storage/belt/security/webbing = 5,
		/obj/item/coin/antagtoken = 1,
		/obj/item/clothing/head/helmet/blueshirt = 1,
		/obj/item/clothing/suit/armor/vest/blueshirt = 1,
		/obj/item/clothing/gloves/tackler = 5,
		/obj/item/grenade/stingbang = 1,
		/obj/item/watertank/pepperspray = 2,
	)
	refill_canister = /obj/item/vending_refill/security

/obj/machinery/vending/security/bluesec
	name = "\improper Armadyne Peacekeeper Equipment Vendor"
	desc = "An Armadyne peacekeeper equipment vendor."
	product_ads = "Crack capitalist skulls!;Beat some heads in!;Don't forget - harm is good!;Your weapons are right here.;Handcuffs!;Freeze, scumbag!;Don't tase me bro!;Tase them, bro.;Why not have a donut?"
	icon = 'modular_skyrat/modules/sec_haul/icons/vending/vending.dmi'
	icon_state = "sec"
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

/*
* MAPPING DECALS
*/
/obj/effect/turf_decal/trimline/red
	color = "#DE3A3A"

/obj/effect/turf_decal/tile/red
	name = "red corner"
	color = "#DE3A3A"
