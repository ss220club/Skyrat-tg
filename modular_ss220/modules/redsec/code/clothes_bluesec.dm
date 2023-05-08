/*
*	SS220: Overriding Bluesec repsrites to be Redsec again. We want Bluesec to still be in game for spawning.
*/

/*
*	PLASMAMEN
*	This goes first due to simultaneously being easy to do, and complex to organize
*/

/obj/item/clothing/under/plasmaman/security/bluesec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/under/plasmaman.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/under/plasmaman.dmi'
	icon_state = "security_envirosuit_new"

/obj/item/clothing/under/plasmaman/security/warden/bluesec
	icon_state = "warden_envirosuit_new"

/obj/item/clothing/under/plasmaman/security/head_of_security/bluesec
	icon_state = "hos_envirosuit_new"

/obj/item/clothing/head/helmet/space/plasmaman/security/bluesec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/head/plasmaman_hats.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/head/plasmaman_head.dmi'
	icon_state = "security_envirohelm_new"

/obj/item/clothing/head/helmet/space/plasmaman/security/warden/bluesec
	icon_state = "warden_envirohelm_new"

/obj/item/clothing/head/helmet/space/plasmaman/security/head_of_security/bluesec
	icon_state = "hos_envirohelm_new"

/*
* ACCESSORIES
*/
/obj/item/clothing/accessory/armband/deputy/bluesec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/accessories.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/accessories.dmi'
	icon_state = "armband_lopland"

/obj/item/clothing/accessory/armband/deputy/lopland/bluesec
	desc = "A Peacekeeper-blue armband, showing the wearer to be certified by Lopland as a top-of-their-class Security Officer."

/*
* BACKPACKS
*/
/obj/item/storage/backpack/security/bluesec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/backpacks.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/back.dmi'
	icon_state = "backpack_security_black"
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Black Variant" = list(
			RESKIN_ICON_STATE = "backpack_security_black",
			RESKIN_WORN_ICON_STATE = "backpack_security_black"
		),
		"White Variant" = list(
			RESKIN_ICON_STATE = "backpack_security_white",
			RESKIN_WORN_ICON_STATE = "backpack_security_white"
		),
	)

/obj/item/storage/backpack/satchel/sec/bluesec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/backpacks.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/back.dmi'
	icon_state = "satchel_security"

/obj/item/storage/backpack/duffelbag/sec/bluesec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/backpacks.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/back.dmi'
	icon_state = "duffel_security_black"
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Black Variant" = list(
			RESKIN_ICON_STATE = "duffel_security_black",
			RESKIN_WORN_ICON_STATE = "duffel_security_black"
		),
		"White Variant" = list(
			RESKIN_ICON_STATE = "duffel_security_white",
			RESKIN_WORN_ICON_STATE = "duffel_security_white"
		),
	)

/*
* BELTS
*/
/obj/item/storage/belt/security/bluesec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/belts.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/belt.dmi'
	icon_state = "belt_white"
	worn_icon_state = "belt_white"
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Black Variant" = list(
			RESKIN_ICON_STATE = "belt_black",
			RESKIN_WORN_ICON_STATE = "belt_black"
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "belt_blue",
			RESKIN_WORN_ICON_STATE = "belt_blue"
		),
		"White Variant" = list(
			RESKIN_ICON_STATE = "belt_white",
			RESKIN_WORN_ICON_STATE = "belt_white"
		),
		"Slim Variant" = list(
			RESKIN_ICON_STATE = "belt_slim",
			RESKIN_WORN_ICON_STATE = "belt_slim"
		),
	)

/obj/item/storage/belt/security/webbing/bluesec
	uses_advanced_reskins = FALSE
	unique_reskin = NONE
	current_skin = "securitywebbing" //Prevents reskinning

/obj/item/storage/belt/security/webbing/peacekeeper/bluesec
	current_skin = "peacekeeper_webbing"

/obj/item/storage/belt/security/webbing/peacekeeper/armadyne/bluesec
	current_skin = "armadyne_webbing"

/*
* GLASSES
*/
/obj/item/clothing/glasses/hud/security/bluesec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/glasses.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/eyes.dmi'
	icon_state = "security_hud"
	glass_colour_type = /datum/client_colour/glass_colour/lightblue

/obj/item/clothing/glasses/hud/security/sunglasses/bluesec
	icon_state = "security_hud_black"
	glass_colour_type = /datum/client_colour/glass_colour/blue
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Dark-Tint Variant" = list(
			RESKIN_ICON_STATE = "security_hud_black",
			RESKIN_WORN_ICON_STATE = "security_hud_black"
		),
		"Light-Tint Variant" = list(
			RESKIN_ICON_STATE = "security_hud_blue",
			RESKIN_WORN_ICON_STATE = "security_hud_blue"
		),
	)

/obj/item/clothing/glasses/hud/security/sunglasses/eyepatch/bluesec
	icon_state = "security_eyepatch"
	base_icon_state = "security_eyepatch"

/obj/item/clothing/glasses/hud/security/night/bluesec
	icon_state = "security_hud_nv"
	glass_colour_type = /datum/client_colour/glass_colour/green

/obj/item/clothing/glasses/hud/eyepatch/sec/bluesec
	unique_reskin = list(
		"Eyepatch" = list(
			RESKIN_ICON_STATE = "hudpatch",
			RESKIN_WORN_ICON_STATE = "hudpatch"
		),
		"Fake Blindfold" = list(
			RESKIN_ICON_STATE = "secfold",
			RESKIN_WORN_ICON_STATE = "secfold"
		)
	)

/*
* HEAD
*/

//Overrides the bulletproof helm with the older non red visor version.
/obj/item/clothing/head/helmet/alt/bluesec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/head.dmi'

//Standard helmet (w/ visor)
/obj/item/clothing/head/helmet/sec/bluesec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/head.dmi'
	icon_state = "security_helmet"
	base_icon_state = "security_helmet"
	actions_types = list(/datum/action/item_action/toggle)
	supports_variations_flags = CLOTHING_SNOUTED_VARIATION
	flags_cover = HEADCOVERSEYES | PEPPERPROOF
	visor_flags_cover = HEADCOVERSEYES | PEPPERPROOF
	dog_fashion = null

//Beret replacement
/obj/item/clothing/head/security_garrison/bluesec
	name = "security garrison cap"
	desc = "A robust garrison cap with the security insignia emblazoned on it. Uses reinforced fabric to offer sufficient protection."
	icon = 'modular_skyrat/master_files/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/head.dmi'
	icon_state = "garrison_black"
	uses_advanced_reskins = TRUE
	armor_type = /datum/armor/head_security_garrison
	strip_delay = 60
	supports_variations_flags = CLOTHING_SNOUTED_VARIATION_NO_NEW_ICON
	unique_reskin = list(
		"Black Variant" = list(
			RESKIN_ICON_STATE = "garrison_black",
			RESKIN_WORN_ICON_STATE = "garrison_black"
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "garrison_blue",
			RESKIN_WORN_ICON_STATE = "garrison_blue"
		),
	)

//Normal Cap

/datum/armor/head_security_garrison
	melee = 30
	bullet = 25
	laser = 25
	energy = 35
	bomb = 25
	fire = 20
	acid = 50

/obj/item/clothing/head/security_cap/bluesec
	name = "security cap"
	desc = "A robust cap with the security insignia emblazoned on it. Uses reinforced fabric to offer sufficient protection."
	icon = 'modular_skyrat/master_files/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/head.dmi'
	icon_state = "security_cap_black"
	uses_advanced_reskins = TRUE
	armor_type = /datum/armor/head_security_cap
	strip_delay = 60
	dog_fashion = null
	supports_variations_flags = CLOTHING_SNOUTED_VARIATION_NO_NEW_ICON
	unique_reskin = list(
		"Black Variant" = list(
			RESKIN_ICON_STATE = "security_cap_black",
			RESKIN_WORN_ICON_STATE = "security_cap_black"
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "security_cap_blue",
			RESKIN_WORN_ICON_STATE = "security_cap_blue"
		),
		"White Variant" = list(
			RESKIN_ICON_STATE = "security_cap_white",
			RESKIN_WORN_ICON_STATE = "security_cap_white"
		),
	)

/datum/armor/head_security_cap
	melee = 30
	bullet = 25
	laser = 25
	energy = 35
	bomb = 25
	fire = 20
	acid = 50

/obj/item/clothing/head/hats/hos/bluesec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/head.dmi'
	icon_state = "hoscap_blue"
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Blue Cap" = list(
			RESKIN_ICON_STATE = "hoscap_blue",
			RESKIN_WORN_ICON_STATE = "hoscap_blue"
		),
		"Sol Cap" = list(
			RESKIN_ICON_STATE = "policechiefcap",
			RESKIN_WORN_ICON_STATE = "policechiefcap"
		),
		"Sheriff Hat" = list(
			RESKIN_ICON_STATE = "cowboyhat_black",
			RESKIN_WORN_ICON_STATE = "cowboyhat_black"
		),
		"Wide Sheriff Hat" = list(
			RESKIN_ICON_STATE = "cowboy_black",
			RESKIN_WORN_ICON_STATE = "cowboy_black"
		)
	)

//Need to quickly redefine this so the icon doesnt break
/obj/item/clothing/head/hats/hos/syndicate/bluesec
	icon = 'icons/obj/clothing/head/hats.dmi'
	worn_icon = 'icons/mob/clothing/head/hats.dmi'
	icon_state = "hoscap"
	current_skin = "hoscap" //Prevents reskinning

/obj/item/clothing/head/hats/warden/bluesec
	icon_state = "policehelm"

/obj/item/clothing/head/cowboy/skyrat/cattleman/sec/bluesec
	name = "security cattleman hat"
	desc = "A security cattleman hat, perfect for any true lawman."
	greyscale_colors = "#39393F#3F6E9E"
	armor_type = /datum/armor/cattleman_sec
	flags_1 = NONE //No recoloring presets

/obj/item/clothing/head/cowboy/skyrat/cattleman/wide/sec/bluesec
	name = "wide brimmed security cattleman hat"
	desc = "A bandit turned sheriff, his enforcement is brutal but effective - whether out of fear or respect is unclear, though not many bodies hang high. A peaceful land, a quiet people."
	greyscale_colors = "#39393F#3F6E9E"
	armor_type = /datum/armor/wide_sec
	flags_1 = NONE //No recoloring presets

/*
* NECK
*/
/obj/item/clothing/neck/cloak/hos/bluesec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/neck.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/neck.dmi'
	icon_state = "hoscloak_blue"

//Not technically an override but oh well
/obj/item/clothing/neck/security_cape/bluesec
	name = "security cape"
	desc = "A fashionable cape worn by security officers."
	icon = 'modular_skyrat/master_files/icons/obj/clothing/neck.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/neck.dmi'
	icon_state = "cape_blue"
	inhand_icon_state = "" //no unique inhands
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Black Variant" = list(
			RESKIN_ICON_STATE = "cape_black",
			RESKIN_WORN_ICON_STATE = "cape_black"
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "cape_blue",
			RESKIN_WORN_ICON_STATE = "cape_blue"
		),
		"White Variant" = list(
			RESKIN_ICON_STATE = "cape_white",
			RESKIN_WORN_ICON_STATE = "cape_white"
		),
	)

/obj/item/clothing/neck/security_cape/armplate/bluesec
	name = "security gauntlet"
	desc = "A fashionable full-arm gauntlet worn by security officers. The gauntlet itself is made of plastic, and provides no protection, but it looks cool as hell."
	icon_state = "armplate_black"
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Black Variant" = list(
			RESKIN_ICON_STATE = "armplate_black",
			RESKIN_WORN_ICON_STATE = "armplate_black"
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "armplate_blue",
			RESKIN_WORN_ICON_STATE = "armplate_blue"
		),
		"Capeless Variant" = list(
			RESKIN_ICON_STATE = "armplate",
			RESKIN_WORN_ICON_STATE = "armplate"
		),
	)

/obj/item/clothing/neck/mantle/hosmantle/bluesec
	name = "\proper the head of security's mantle"
	desc = "A plated mantle that one might wrap around the upper torso. The 'scales' of the garment signify the members of security and how you're carrying them on your shoulders."
	icon = 'modular_skyrat/master_files/icons/mob/clothing/neck.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/neck.dmi'
	icon_state = "hosmantle_blue"

/*
* GLOVES
*/
/obj/item/clothing/gloves/color/black/security/bluesec
	name = "security gloves"
	desc = "A pair of security gloves."
	icon = 'modular_skyrat/master_files/icons/obj/clothing/gloves.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/hands.dmi'
	icon_state = "gloves_white"
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Black Variant" = list(
			RESKIN_ICON_STATE = "gloves_black",
			RESKIN_WORN_ICON_STATE = "gloves_black"
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "gloves_blue",
			RESKIN_WORN_ICON_STATE = "gloves_blue"
		),
		"White Variant" = list(
			RESKIN_ICON_STATE = "gloves_white",
			RESKIN_WORN_ICON_STATE = "gloves_white"
		),
	)

/obj/item/clothing/gloves/tackler/security/bluesec	//Can't just overwrite tackler, as there's a ton of subtypes that we'd then need to account for. This is easier. MUCH easier.
	icon = 'modular_skyrat/master_files/icons/obj/clothing/gloves.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/hands.dmi'
	icon_state = "tackle_blue"

/obj/item/clothing/gloves/krav_maga/sec/bluesec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/gloves.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/hands.dmi'
	icon_state = "fightgloves_blue"

/*
* SUITS
*/
/obj/item/clothing/suit/armor/vest/alt/sec/bluesec
	name = "armored security vest"
	desc = "A Type-II-AD-P armored vest that provides decent protection against most types of damage."
	icon = 'modular_skyrat/master_files/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/suit.dmi'
	icon_state = "vest_white"
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Black Variant" = list(
			RESKIN_ICON_STATE = "vest_black",
			RESKIN_WORN_ICON_STATE = "vest_black"
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "vest_blue",
			RESKIN_WORN_ICON_STATE = "vest_blue"
		),
		"White Variant" = list(
			RESKIN_ICON_STATE = "vest_white",
			RESKIN_WORN_ICON_STATE = "vest_white"
		),
		"Peacekeeper Variant" = list(
			RESKIN_ICON_STATE = "peacekeeper_armor",
			RESKIN_WORN_ICON_STATE = "peacekeeper"
		)
	)

/obj/item/clothing/suit/armor/vest/warden/bluesec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/suit.dmi'
	icon_state = "vest_warden"
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/suit/armor/hos/bluesec
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

//Standard Bulletproof Vest
/obj/item/clothing/suit/armor/bluesec/bulletproof
	desc = "A Type-III-AD-P heavy bulletproof vest that excels in protecting the wearer against traditional projectile weaponry and explosives to a minor extent."
	icon = 'modular_skyrat/master_files/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/suit.dmi'
	icon_state = "vest_bulletproof"
	body_parts_covered = CHEST|GROIN|ARMS // Our sprite has groin and arm protections, so we get it too.
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

//Riot Armor
/obj/item/clothing/suit/armor/bluesec/riot
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/suit.dmi'

//Warden's Vest
/obj/item/clothing/suit/armor/bluesec/vest/warden
	icon = 'modular_skyrat/master_files/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/suit.dmi'
	icon_state = "vest_warden"
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

//Security Wintercoat (and hood)
/obj/item/clothing/head/hooded/winterhood/security/bluesec
	desc = "A blue, armour-padded winter hood. Definitely not bulletproof, especially not the part where your face goes." //God dammit TG stop putting color in the desc of items like this
	icon = 'modular_skyrat/master_files/icons/obj/clothing/head/winterhood.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/head/winterhood.dmi'
	icon_state = "winterhood_security"

/obj/item/clothing/suit/hooded/wintercoat/security/bluesec
	name = "security winter coat" //TG has this as a Jacket now, so unless we update ours, this needs to be re-named as Coat
	desc = "A blue, armour-padded winter coat. It glitters with a mild ablative coating and a robust air of authority.  The zipper tab is a small <b>\"Lopland\"</b> logo."
	icon = 'modular_skyrat/master_files/icons/obj/clothing/suits/wintercoat.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/suits/wintercoat.dmi'
	icon_state = "coatsecurity_winter"

/obj/item/clothing/suit/armor/hos/hos_formal/bluesec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/suit.dmi'
	icon_state = "hosformal_blue"

/obj/item/clothing/suit/cossack //Replace non-security variant with blue variant
	icon = 'modular_skyrat/master_files/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/suit.dmi'
	icon_state = "don_cossak"

/obj/item/clothing/suit/toggle/jacket/sec/bluesec
	name = "security jacket"
	desc = "A comfortable jacket in security blue. Probably against uniform regulations."
	icon_state = "sec_dep_jacket"

/*
* UNDER
*/
//Officer
/obj/item/clothing/under/rank/security/bluesec/officer
	icon = 'modular_skyrat/master_files/icons/obj/clothing/under/security.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/under/security.dmi'
	icon_state = "security_black"
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Black Variant" = list(
			RESKIN_ICON_STATE = "security_black",
			RESKIN_WORN_ICON_STATE = "security_black"
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "security_blue",
			RESKIN_WORN_ICON_STATE = "security_blue"
		),
		"White Variant" = list(
			RESKIN_ICON_STATE = "security_white",
			RESKIN_WORN_ICON_STATE = "security_white"
		),
	)

/obj/item/clothing/under/rank/security/skyrat/utility/bluesec
	name = "security utility uniform"
	desc = "A utility uniform worn by Lopland-certified Security officers."
	icon_state = "util_sec"
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION | CLOTHING_MONKEY_VARIATION
	can_adjust = FALSE

//Warden
/obj/item/clothing/under/rank/security/warden
	icon = 'modular_skyrat/master_files/icons/obj/clothing/under/security.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/under/security.dmi'
	icon_state = "warden_black"

//HoS
/obj/item/clothing/under/rank/security/head_of_security/bluesec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/under/security.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/under/security.dmi'
	icon_state = "hos_black"

/obj/item/clothing/under/rank/security/head_of_security/parade/bluesec
	icon_state = "hos_parade_male_blue"

/obj/item/clothing/under/rank/security/head_of_security/parade/female/bluesec
	icon_state = "hos_parade_fem_blue"

/obj/item/clothing/under/rank/security/head_of_security/alt/bluesec
	icon_state = "hosalt_blue"

/obj/item/clothing/under/rank/security/head_of_security/alt/skirt/bluesec
	icon_state = "hosalt_skirt_blue"

/*
* FEET
*/
//Adds reskins and special footstep noises
/obj/item/clothing/shoes/jackboots/sec/bluesec
	name = "security jackboots"
	desc = "Lopland's Peacekeeper-issue Security combat boots for combat scenarios or combat situations. All combat, all the time."
	icon_state = "security_boots"
	icon = 'modular_skyrat/master_files/icons/obj/clothing/shoes.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/feet.dmi'
	clothing_traits = list(TRAIT_SILENT_FOOTSTEPS) // We have other footsteps.
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Blue-Trimmed Variant" = list(
			RESKIN_ICON_STATE = "security_boots",
			RESKIN_WORN_ICON_STATE = "security_boots"
		),
		"White-Trimmed Variant" = list(
			RESKIN_ICON_STATE = "security_boots_white",
			RESKIN_WORN_ICON_STATE = "security_boots_white"
		),
		"Full White Variant" = list(
			RESKIN_ICON_STATE = "security_boots_fullwhite",
			RESKIN_WORN_ICON_STATE = "security_boots_fullwhite"
		),
	)

//PDA Greyscale Overrides
/obj/item/modular_computer/pda/security/bluesec
	greyscale_colors = "#2B356D#1E1E1E"

/obj/item/modular_computer/pda/detective/bluesec
	greyscale_colors = "#90714F#1E1E1E"

/obj/item/modular_computer/pda/warden/bluesec
	greyscale_colors = "#2F416E#1E1E1E#ACACAC"

/obj/item/modular_computer/pda/heads/hos/bluesec
	greyscale_colors = "#2B356D#1E1E1E"

//Doors
/obj/machinery/door/airlock/security/bluesec
	icon = 'modular_skyrat/modules/aesthetics/airlock/icons/airlocks/station/security.dmi'
