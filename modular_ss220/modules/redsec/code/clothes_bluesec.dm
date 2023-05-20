/*
*	SS220: Bluesec items.
*
*	Tips:
*		- I used `current_skin` for disabling skin choose
		- If you're not sure why you can't select a skin (but you have one), you may need to set `current_skin` to null
*		- All clothing is took his path from his parent, so you should override it on your code if you need it
*		- Make sure every icon, worn_icon, icon_state, inhand_icon_state is correct
*
*	There's may be some `not needed` overridings but it'll took ages for me to clean this up
*/

/*
* SUITS
*/
/obj/item/clothing/suit/hooded/wintercoat/security/bluesec
	name = "security winter coat" //TG has this as a Jacket now, so unless we update ours, this needs to be re-named as Coat
	desc = "A blue, armour-padded winter coat. It glitters with a mild ablative coating and a robust air of authority.  The zipper tab is a small <b>\"Lopland\"</b> logo."
	icon = 'modular_skyrat/master_files/icons/obj/clothing/suits/wintercoat.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/suits/wintercoat.dmi'
	icon_state = "coatsecurity_winter"

/obj/item/clothing/suit/armor/vest/alt/sec/bluesec
	name = "armored security vest"
	desc = "A Type-II-AD-P armored vest that provides decent protection against most types of damage."
	icon = 'modular_skyrat/master_files/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/suit.dmi'
	icon_state = "vest_white"
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON
	current_skin = null
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
			RESKIN_ICON = 'modular_skyrat/master_files/icons/obj/clothing/suits.dmi',
			RESKIN_ICON_STATE = "warden_alt",
			RESKIN_WORN_ICON = 'modular_skyrat/master_files/icons/mob/clothing/suit.dmi',
			RESKIN_WORN_ICON_STATE = "warden_alt"
		),
		"Standard" = list(
			RESKIN_ICON = 'modular_skyrat/master_files/icons/obj/clothing/suits.dmi',
			RESKIN_ICON_STATE = "vest_warden",
			RESKIN_WORN_ICON = 'modular_skyrat/master_files/icons/mob/clothing/suit.dmi',
			RESKIN_WORN_ICON_STATE = "vest_warden",
		),
		"Peacekeeper" = list(
			RESKIN_ICON = 'modular_skyrat/master_files/icons/obj/clothing/suits.dmi',
			RESKIN_ICON_STATE = "peacekeeper_trench_warden",
			RESKIN_WORN_ICON = 'modular_skyrat/master_files/icons/mob/clothing/suit.dmi',
			RESKIN_WORN_ICON_STATE = "peacekeeper_trench_warden",
			RESKIN_SUPPORTS_VARIATIONS_FLAGS = NONE
		)
	)

/obj/item/clothing/suit/armor/hos/bluesec
	name = "armored greatcoat"
	desc = "A greatcoat enhanced with a special alloy for some extra protection and style for those with a commanding presence."
	icon_state = "hos"
	inhand_icon_state = "greatcoat"
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	armor_type = /datum/armor/armor_hos
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS
	strip_delay = 80
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Greatcoat" = list(
			RESKIN_ICON = 'icons/obj/clothing/suits/armor.dmi',
			RESKIN_ICON_STATE = "hos",
			RESKIN_WORN_ICON = 'icons/mob/clothing/suits/armor.dmi',
			RESKIN_WORN_ICON_STATE = "hos"
		),
		"Trenchcoat" = list(
			RESKIN_ICON = 'icons/obj/clothing/suits/armor.dmi',
			RESKIN_ICON_STATE = "hostrench",
			RESKIN_WORN_ICON = 'icons/mob/clothing/suits/armor.dmi',
			RESKIN_WORN_ICON_STATE = "hostrench"
		),
		"Navy Blue Jacket" = list(
			RESKIN_ICON = 'modular_skyrat/master_files/icons/obj/clothing/suits.dmi',
			RESKIN_ICON_STATE = "hosbluejacket",
			RESKIN_WORN_ICON = 'modular_skyrat/master_files/icons/mob/clothing/suit.dmi',
			RESKIN_WORN_ICON_STATE = "hosbluejacket"
		),
		"Trenchcloak" = list(
			RESKIN_ICON = 'modular_skyrat/master_files/icons/obj/clothing/suits.dmi',
			RESKIN_ICON_STATE = "trenchcloak",
			RESKIN_WORN_ICON = 'modular_skyrat/master_files/icons/mob/clothing/suit.dmi',
			RESKIN_WORN_ICON_STATE = "trenchcloak"
		),
		"Black" = list(
			RESKIN_ICON = 'modular_skyrat/master_files/icons/obj/clothing/suits.dmi',
			RESKIN_ICON_STATE = "hos_black",
			RESKIN_WORN_ICON = 'modular_skyrat/master_files/icons/mob/clothing/suit.dmi',
			RESKIN_WORN_ICON_STATE = "hos_black",
			RESKIN_SUPPORTS_VARIATIONS_FLAGS = NONE
		)
	)

/obj/item/clothing/suit/armor/cossack/sec/bluesec
	icon_state = "don_cossak"

/obj/item/clothing/suit/toggle/jacket/sec/bluesec
	desc = "A comfortable jacket in security blue. Probably against uniform regulations."
	icon_state = "sec_dep_jacket"

/*
* BACKPACKS
*/
/obj/item/storage/backpack/security/bluesec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/backpacks.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/back.dmi'
	icon_state = "backpack_security_black"
	current_skin = null
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
	current_skin = null
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
* UNDER
*/
/obj/item/clothing/under/rank/security/officer/bluesec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/under/security.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/under/security.dmi'
	icon_state = "security_black"
	current_skin = null
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

/obj/item/clothing/under/rank/security/warden/bluesec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/under/security.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/under/security.dmi'
	icon_state = "warden_black"

/obj/item/clothing/under/rank/security/head_of_security/bluesec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/under/security.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/under/security.dmi'
	icon_state = "hos_black"

/obj/item/clothing/under/rank/security/head_of_security/bluesec/parade
	icon_state = "hos_parade_male_blue"
	can_adjust = FALSE

/obj/item/clothing/under/rank/security/head_of_security/bluesec/parade/female
	icon_state = "hos_parade_fem_blue"
	can_adjust = FALSE

/obj/item/clothing/under/rank/security/head_of_security/bluesec/alt
	icon_state = "hosalt_blue"
	can_adjust = TRUE

/obj/item/clothing/under/rank/security/head_of_security/bluesec/alt/skirt
	icon_state = "hosalt_skirt_blue"
	can_adjust = TRUE

//Plasmaman
/obj/item/clothing/under/plasmaman/security/bluesec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/under/plasmaman.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/under/plasmaman.dmi'
	icon_state = "security_envirosuit_new"

/obj/item/clothing/under/plasmaman/security/bluesec/warden
	icon_state = "warden_envirosuit_new"

/obj/item/clothing/under/plasmaman/security/bluesec/head_of_security
	icon_state = "hos_envirosuit_new"

/obj/item/clothing/head/helmet/space/plasmaman/security/bluesec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/head/plasmaman_hats.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/head/plasmaman_head.dmi'
	icon_state = "security_envirohelm_new"

/obj/item/clothing/head/helmet/space/plasmaman/security/bluesec/warden
	icon_state = "warden_envirohelm_new"

/obj/item/clothing/head/helmet/space/plasmaman/security/bluesec/head_of_security
	icon_state = "hos_envirohelm_new"

/*
* SHOES
*/
/obj/item/clothing/shoes/jackboots/sec/bluesec
	name = "security jackboots"
	desc = "Lopland's Peacekeeper-issue Security combat boots for combat scenarios or combat situations. All combat, all the time."
	icon_state = "security_boots"
	icon = 'modular_skyrat/master_files/icons/obj/clothing/shoes.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/feet.dmi'
	clothing_traits = list(TRAIT_SILENT_FOOTSTEPS) // We have other footsteps.
	current_skin = null
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

/*
* BELTS
*/
/obj/item/storage/belt/security/bluesec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/belts.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/belt.dmi'
	icon_state = "belt_white"
	worn_icon_state = "belt_white"
	current_skin = null
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
	current_skin = "securitywebbing"

/*
* GLOVES
*/
/obj/item/clothing/gloves/color/black/bluesec
	desc = "These gloves are fire-resistant."
	name = "black gloves"
	icon_state = "black"
	greyscale_colors = "#2f2e31"
	resistance_flags = NONE
	cold_protection = HANDS
	heat_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	cut_type = /obj/item/clothing/gloves/fingerless
	current_skin = null
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Basic Gloves" = list(
			RESKIN_ICON = 'icons/obj/clothing/gloves.dmi',
			RESKIN_ICON_STATE = "black",
			RESKIN_WORN_ICON = 'icons/mob/clothing/hands.dmi',
			RESKIN_WORN_ICON_STATE = "black"
		),
		"Peacekeeper Gloves" = list(
			RESKIN_ICON = 'modular_skyrat/master_files/icons/obj/clothing/gloves.dmi',
			RESKIN_ICON_STATE = "peacekeeper_gloves",
			RESKIN_WORN_ICON = 'modular_skyrat/master_files/icons/mob/clothing/hands.dmi',
			RESKIN_WORN_ICON_STATE = "peacekeeper"
		)
	)

/obj/item/clothing/gloves/color/black/security/bluesec
	name = "security gloves"
	desc = "A pair of security gloves."
	icon = 'modular_skyrat/master_files/icons/obj/clothing/gloves.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/hands.dmi'
	icon_state = "gloves_white"
	current_skin = null
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

/*
* GLASSES
*/
/obj/item/clothing/glasses/hud/security/bluesec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/glasses.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/eyes.dmi'
	icon_state = "security_hud"
	glass_colour_type = /datum/client_colour/glass_colour/lightblue

/obj/item/clothing/glasses/hud/security/bluesec/sunglasses
	icon_state = "security_hud_black"
	glass_colour_type = /datum/client_colour/glass_colour/blue
	current_skin = null
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

/obj/item/clothing/glasses/hud/security/bluesec/sunglasses/eyepatch
	icon_state = "security_eyepatch"
	base_icon_state = "security_eyepatch"
	current_skin = "security_eyepatch"
	actions_types = list(/datum/action/item_action/flip)

/obj/item/clothing/glasses/hud/security/bluesec/sunglasses/eyepatch/attack_self(mob/user, modifiers)
	. = ..()
	icon_state = (icon_state == base_icon_state) ? "[base_icon_state]_flipped" : base_icon_state
	user.update_worn_glasses()

/obj/item/clothing/glasses/hud/security/night/bluesec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/glasses.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/eyes.dmi'
	icon_state = "security_hud_nv"
	glass_colour_type = /datum/client_colour/glass_colour/lightblue

/obj/item/clothing/glasses/hud/eyepatch/sec/bluesec
	name = "security eyepatch HUD"
	desc = "Lost your eye beating an innocent clown? Thankfully your corporate overlords have made something to make up for this. May not do well against flashes."
	icon = 'modular_skyrat/master_files/icons/obj/clothing/glasses.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/eyes.dmi'
	icon_state = "hudpatch"
	base_icon_state = "hudpatch"
	inhand_icon_state = "sunhudmed"
	hud_type = DATA_HUD_SECURITY_ADVANCED
	hud_trait = TRAIT_SECURITY_HUD
	glass_colour_type = /datum/client_colour/glass_colour/blue
	current_skin = "hudpatch"
	uses_advanced_reskins = FALSE

/obj/item/clothing/glasses/hud/eyepatch/sec/bluesec/blindfold
	icon = 'modular_skyrat/master_files/icons/obj/clothing/glasses.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/eyes.dmi'
	icon_state = "secfold"
	base_icon_state = "secfold"
	glass_colour_type = /datum/client_colour/glass_colour/darkred
	current_skin = "secfold"
	uses_advanced_reskins = FALSE

/*
* HEAD
*/
/obj/item/clothing/head/security_cap/bluesec
	name = "security cap"
	desc = "A robust cap with the security insignia emblazoned on it. Uses reinforced fabric to offer sufficient protection."
	icon = 'modular_skyrat/master_files/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/head.dmi'
	icon_state = "security_cap_black"
	armor_type = /datum/armor/head_security_cap
	strip_delay = 60
	supports_variations_flags = CLOTHING_SNOUTED_VARIATION_NO_NEW_ICON
	dog_fashion = null
	current_skin = null
	uses_advanced_reskins = TRUE
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

/obj/item/clothing/head/hats/warden/bluesec
	name = "warden's police hat"
	desc = "It's a special armored hat issued to the Warden of a security force. Protects the head from impacts."
	icon_state = "policehelm"

/obj/item/clothing/head/helmet/sec/bluesec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/head/helmet.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/head/helmet.dmi'
	icon_state = "security_helmet"
	base_icon_state = "security_helmet"
	can_toggle = TRUE
	actions_types = list(/datum/action/item_action/toggle)
	supports_variations_flags = CLOTHING_SNOUTED_VARIATION
	flags_cover = HEADCOVERSEYES | PEPPERPROOF
	visor_flags_cover = HEADCOVERSEYES | PEPPERPROOF
	dog_fashion = null

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
	current_skin = null
	uses_advanced_reskins = TRUE
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

/obj/item/clothing/head/cowboy/skyrat/cattleman/sec/bluesec
	greyscale_colors = "#39393F#3F6E9E"

/obj/item/clothing/head/cowboy/skyrat/cattleman/wide/sec/bluesec
	greyscale_colors = "#39393F#3F6E9E"

/*
* NECK
*/
/obj/item/clothing/neck/security_cape/bluesec
	name = "security cape"
	desc = "A fashionable cape worn by security officers."
	icon = 'modular_skyrat/master_files/icons/obj/clothing/neck.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/neck.dmi'
	icon_state = "cape_black"
	inhand_icon_state = "" //no unique inhands
	current_skin = null
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

/obj/item/clothing/neck/security_cape/bluesec/armplate
	name = "security gauntlet"
	desc = "A fashionable full-arm gauntlet worn by security officers. The gauntlet itself is made of plastic, and provides no protection, but it looks cool as hell."
	icon_state = "armplate_black"
	current_skin = null
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
	icon = 'modular_skyrat/master_files/icons/mob/clothing/neck.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/neck.dmi'
	icon_state = "hosmantle_blue"

/*
* ACCESSORY
*/
/obj/item/clothing/accessory/armband/deputy/bluesec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/accessories.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/accessories.dmi'
	icon_state = "armband_lopland"

/obj/item/clothing/accessory/armband/deputy/bluesec/lopland
	desc = "A Peacekeeper-blue armband, showing the wearer to be certified by Lopland as a top-of-their-class Security Officer."
