/*
*	SS220: Bluesec uniform
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
* UNDER
*/
/obj/item/clothing/under/rank/security/officer
	icon = 'icons/obj/clothing/under/security.dmi'
	worn_icon = 'icons/mob/clothing/under/security.dmi'
	icon_state = "rsecurity"
	current_skin = "rsecurity" //prevents reskinning

/obj/item/clothing/under/rank/security/skyrat/utility
	desc = "A utility uniform worn by trained Security officers."
	icon_state = "util_sec_old"

/obj/item/clothing/under/rank/security/head_of_security
	icon = 'icons/obj/clothing/under/security.dmi'
	worn_icon = 'icons/mob/clothing/under/security.dmi'
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
	icon = 'icons/obj/clothing/under/security.dmi'
	worn_icon = 'icons/mob/clothing/under/security.dmi'
	icon_state = "hos_envirosuit"

/*
* SHOES
*/
/obj/item/clothing/shoes/jackboots/sec
	desc = "Nanotrasen-issue Security combat boots for combat scenarios or combat situations. All combat, all the time."
	icon_state = "jackboots_sec"
	icon = 'icons/obj/clothing/shoes.dmi'
	worn_icon = 'icons/mob/clothing/feet.dmi'
	current_skin = "jackboots_sec" //prevents reskinning

/*
* BELTS
*/
/obj/item/storage/belt/security
	name = "security belt"
	desc = "Can hold security gear like handcuffs and flashes."
	icon = 'icons/obj/clothing/belts.dmi'
	lefthand_file = 'icons/mob/inhands/equipment/belt_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/belt_righthand.dmi'
	icon_state = "security"
	inhand_icon_state = "security"
	worn_icon_state = "security"
	current_skin = "security" //prevents reskinning

/obj/item/storage/belt/security/webbing
	icon = 'icons/obj/clothing/belts.dmi'
	uses_advanced_reskins = FALSE
	unique_reskin = NONE
	current_skin = "securitywebbing" //prevents reskinning

/*
* GLOVES
*/
/obj/item/clothing/gloves/color/black
	current_skin = "black" //prevents reskinning
