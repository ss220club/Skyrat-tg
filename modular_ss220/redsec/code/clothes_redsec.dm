/*
*	SS220: Actual Skyrat Bluesec to Redsec overrides.
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
/obj/item/clothing/suit/hooded/wintercoat/security
	name = "security winter jacket"
	desc = "A red, armour-padded winter coat. It glitters with a mild ablative coating and a robust air of authority. The zipper tab is a pair of jingly little handcuffs that get annoying after the first ten seconds."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	worn_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	icon_state = "coatsecurity"
	inhand_icon_state = "coatsecurity"
	hoodtype = /obj/item/clothing/head/hooded/winterhood/security

/obj/item/clothing/suit/armor/vest/alt/sec
	desc = "A Type I armored vest that provides decent protection against most types of damage."
	icon = 'icons/obj/clothing/suits/armor.dmi'
	worn_icon = 'icons/mob/clothing/suits/armor.dmi'
	icon_state = "armor_sec"
	current_skin = "armor_sec"

/obj/item/clothing/suit/armor/vest/warden
	icon = 'icons/obj/clothing/suits/armor.dmi'
	worn_icon = 'icons/mob/clothing/suits/armor.dmi'
	icon_state = "warden_jacket"
	inhand_icon_state = "armor"
	unique_reskin = list(
		"Basic Warden Armor" = list(
			RESKIN_ICON = 'icons/obj/clothing/suits/armor.dmi',
			RESKIN_ICON_STATE = "warden_jacket",
			RESKIN_WORN_ICON = 'icons/mob/clothing/suits/armor.dmi',
			RESKIN_WORN_ICON_STATE = "warden_jacket"
		),
		"Standard" = list(
			RESKIN_ICON = 'modular_skyrat/master_files/icons/obj/clothing/suits.dmi',
			RESKIN_ICON_STATE = "warden_jacket",
			RESKIN_WORN_ICON = 'modular_skyrat/master_files/icons/mob/clothing/suit.dmi',
			RESKIN_WORN_ICON_STATE = "warden_jacket"
		)
	)

/obj/item/clothing/suit/armor/hos
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
		"Trenchcloak" = list(
			RESKIN_ICON = 'modular_skyrat/master_files/icons/obj/clothing/suits/armor.dmi',
			RESKIN_ICON_STATE = "trenchcloak",
			RESKIN_WORN_ICON = 'modular_skyrat/master_files/icons/mob/clothing/suits/armor.dmi',
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


/obj/item/clothing/suit/toggle/jacket/sec
	desc = "A comfortable jacket in security red. Probably against uniform regulations."
	icon_state = "sec_dep_jacket_old"

/*
* BACKPACKS
*/
/obj/item/storage/backpack/security
	icon = 'icons/obj/storage/backpack.dmi'
	worn_icon = 'icons/mob/clothing/back/backpack.dmi'
	icon_state = "backpack-security"
	current_skin = "backpack-security"

/obj/item/storage/backpack/satchel/sec
	icon = 'icons/obj/storage/backpack.dmi'
	worn_icon = 'icons/mob/clothing/back/backpack.dmi'
	icon_state = "satchel-security"

/obj/item/storage/backpack/duffelbag/sec
	icon = 'icons/obj/storage/backpack.dmi'
	worn_icon = 'icons/mob/clothing/back/backpack.dmi'
	icon_state = "duffel-security"
	current_skin = "duffel-security"

/*
* UNDER
*/
/obj/item/clothing/under/rank/security/officer
	icon = 'icons/obj/clothing/under/security.dmi'
	worn_icon = 'icons/mob/clothing/under/security.dmi'
	icon_state = "rsecurity"
	current_skin = "rsecurity"

/obj/item/clothing/under/rank/security/officer/skirt
	icon = 'icons/obj/clothing/under/security.dmi'
	worn_icon = 'icons/mob/clothing/under/security.dmi'
	worn_icon_state = "secskirt"
	icon_state = "secskirt"
	current_skin = "secskirt"

/obj/item/clothing/under/rank/security/skyrat/utility
	desc = "A utility uniform worn by trained Security officers."
	icon_state = "util_sec_old"

/obj/item/clothing/under/rank/security/warden
	icon = 'icons/obj/clothing/under/security.dmi'
	worn_icon = 'icons/mob/clothing/under/security.dmi'
	icon_state = "rwarden"

/obj/item/clothing/under/rank/security/head_of_security
	icon_state = "rhos"

/obj/item/clothing/under/rank/security/head_of_security/parade
	icon_state = "hos_parade_male"

/obj/item/clothing/under/rank/security/head_of_security/parade/female
	icon_state = "hos_parade_fem"

/obj/item/clothing/under/rank/security/head_of_security/alt
	icon_state = "hosalt"

/obj/item/clothing/under/rank/security/head_of_security/alt/skirt
	icon_state = "hosalt_skirt"

//Plasmaman
/obj/item/clothing/under/plasmaman/security
	icon = 'icons/obj/clothing/under/plasmaman.dmi'
	worn_icon = 'icons/mob/clothing/under/plasmaman.dmi'
	icon_state = "security_envirosuit"

/obj/item/clothing/under/plasmaman/security/warden
	icon_state = "warden_envirosuit"

/obj/item/clothing/under/plasmaman/security/head_of_security
	icon = 'icons/obj/clothing/under/plasmaman.dmi'
	worn_icon = 'icons/mob/clothing/under/plasmaman.dmi'
	icon_state = "hos_envirosuit"

/obj/item/clothing/head/helmet/space/plasmaman/security
	icon = 'icons/obj/clothing/head/plasmaman_hats.dmi'
	worn_icon = 'icons/mob/clothing/head/plasmaman_head.dmi'
	icon_state = "security_envirohelm"

/obj/item/clothing/head/helmet/space/plasmaman/security/warden
	icon_state = "warden_envirohelm"

/obj/item/clothing/head/helmet/space/plasmaman/security/head_of_security
	icon_state = "hos_envirohelm"

/*
* SHOES
*/
/obj/item/clothing/shoes/jackboots/sec
	desc = "Nanotrasen-issue Security combat boots for combat scenarios or combat situations. All combat, all the time."
	icon_state = "jackboots_sec"
	icon = 'icons/obj/clothing/shoes.dmi'
	worn_icon = 'icons/mob/clothing/feet.dmi'
	current_skin = "jackboots_sec"

/*
* BELTS
*/
/obj/item/storage/belt/security
	name = "security belt"
	desc = "Can hold security gear like handcuffs and flashes."
	icon = 'icons/obj/clothing/belts.dmi'
	worn_icon = 'icons/mob/clothing/belt.dmi'
	lefthand_file = 'icons/mob/inhands/equipment/belt_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/belt_righthand.dmi'
	icon_state = "security"
	inhand_icon_state = "security"
	worn_icon_state = "security"
	current_skin = "security"

/obj/item/storage/belt/security/webbing
	icon = 'icons/obj/clothing/belts.dmi'
	uses_advanced_reskins = FALSE
	unique_reskin = NONE
	current_skin = "securitywebbing"

/*
* GLOVES
*/
/obj/item/clothing/gloves/color/black
	current_skin = "black"

/obj/item/clothing/gloves/color/black/security
	icon = 'icons/obj/clothing/gloves.dmi'
	worn_icon = 'icons/mob/clothing/hands.dmi'
	icon_state = "black"
	greyscale_colors = "#2f2e31"
	current_skin = "black"

/*
* GLASSES
*/
/obj/item/clothing/glasses/hud/security
	icon = 'icons/obj/clothing/glasses.dmi'
	worn_icon = 'icons/mob/clothing/eyes.dmi'
	icon_state = "securityhud"
	glass_colour_type = /datum/client_colour/glass_colour/red

/obj/item/clothing/glasses/hud/security/sunglasses
	icon = 'icons/obj/clothing/glasses.dmi'
	worn_icon = 'icons/mob/clothing/eyes.dmi'
	icon_state = "sunhudsec"
	glass_colour_type = /datum/client_colour/glass_colour/darkred
	current_skin = "sunhudsec"

/obj/item/clothing/glasses/hud/security/sunglasses/eyepatch
	icon = 'icons/obj/clothing/glasses.dmi'
	worn_icon = 'icons/mob/clothing/eyes.dmi'
	icon_state = "hudpatch"
	base_icon_state = "hudpatch"

/obj/item/clothing/glasses/hud/security/night
	icon = 'icons/obj/clothing/glasses.dmi'
	worn_icon = 'icons/mob/clothing/eyes.dmi'
	icon_state = "securityhudnight"

/obj/item/clothing/glasses/hud/eyepatch/sec
	icon = 'icons/obj/clothing/glasses.dmi'
	worn_icon = 'icons/mob/clothing/eyes.dmi'
	lefthand_file = 'icons/mob/inhands/clothing/glasses_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/clothing/glasses_righthand.dmi'
	icon_state = "hudpatch"
	current_skin = "hudpatch"
	glass_colour_type = /datum/client_colour/glass_colour/darkred

/obj/item/clothing/glasses/hud/eyepatch/sec/blindfold
	icon = 'modular_skyrat/master_files/icons/obj/clothing/glasses.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/eyes.dmi'

/*
* HEAD
*/
/obj/item/clothing/head/security_cap
	unique_reskin = NONE
	current_skin = "security_cap_black"

/obj/item/clothing/head/hats/warden
	name = "warden's hat"
	desc = "A warden's red hat. Looking at it gives you the feeling of wanting to keep people in cells for as long as possible."
	icon_state = "wardenhat"

/obj/item/clothing/head/helmet/sec
	icon = 'icons/obj/clothing/head/helmet.dmi'
	worn_icon = 'icons/mob/clothing/head/helmet.dmi'
	icon_state = "helmet"
	base_icon_state = "helmet"
	actions_types = list()
	can_toggle = FALSE
	supports_variations_flags = CLOTHING_SNOUTED_VARIATION_NO_NEW_ICON
	flags_cover = HEADCOVERSEYES
	flags_inv = HIDEHAIR

/obj/item/clothing/head/helmet/sec/attack_self(mob/user)
	. = ..()

/obj/item/clothing/head/security_garrison
	name = "security garrison cap"
	desc = "A robust garrison cap with the security insignia emblazoned on it. Uses reinforced fabric to offer sufficient protection."
	icon = 'modular_skyrat/master_files/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/head.dmi'
	icon_state = "garrison_black"
	uses_advanced_reskins = TRUE
	armor_type = /datum/armor/head_helmet
	strip_delay = 60
	supports_variations_flags = CLOTHING_SNOUTED_VARIATION_NO_NEW_ICON
	current_skin = "garrison_black"

/obj/item/clothing/head/cowboy/skyrat/cattleman/sec
	greyscale_colors = "#39393F#EA3232"

/obj/item/clothing/head/cowboy/skyrat/cattleman/wide/sec
	greyscale_colors = "#39393F#EA3232"

/*
* NECK
*/
/obj/item/clothing/neck/security_cape
	unique_reskin = list(
		"Black Variant" = list(
			RESKIN_ICON_STATE = "cape_black",
			RESKIN_WORN_ICON_STATE = "cape_black"
		),
		"White Variant" = list(
			RESKIN_ICON_STATE = "cape_white",
			RESKIN_WORN_ICON_STATE = "cape_white"
		)
	)

/obj/item/clothing/neck/security_cape/armplate
	unique_reskin = list(
		"Black Variant" = list(
			RESKIN_ICON_STATE = "armplate_black",
			RESKIN_WORN_ICON_STATE = "armplate_black"
		),
		"Capeless Variant" = list(
			RESKIN_ICON_STATE = "armplate",
			RESKIN_WORN_ICON_STATE = "armplate"
		)
	)

/obj/item/clothing/neck/mantle/hosmantle
	name = "\proper the head of security's mantle"
	desc = "A plated mantle that one might wrap around the upper torso. The 'scales' of the garment signify the members of security and how you're carrying them on your shoulders."
	icon = 'modular_skyrat/master_files/icons/mob/clothing/neck.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/neck.dmi'
	icon_state = "hosmantle"

/*
* ACCESSORY
*/
/obj/item/clothing/accessory/armband/deputy
	icon = 'icons/obj/clothing/accessories.dmi'
	worn_icon = 'icons/mob/clothing/accessories.dmi'
	icon_state = "redband"

/obj/item/clothing/accessory/armband/deputy/lopland
	desc = "A armband, showing the wearer to be certified by Lopland as a top-of-their-class Security Officer."
