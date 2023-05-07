/*
*	SS220: Actual Skyrat Bluesec override to Redsec again.
*/

/*
* SUITS
*/
/obj/item/clothing/suit/hooded/wintercoat/security
	name = "security winter jacket"
	desc = "A red, armour-padded winter coat. It glitters with a mild ablative coating and a robust air of authority. The zipper tab is a pair of jingly little handcuffs that get annoying after the first ten seconds."
	icon_state = "coatsecurity"
	inhand_icon_state = "coatsecurity"

/obj/item/clothing/suit/armor/vest/alt/sec
	desc = "A Type I armored vest that provides decent protection against most types of damage."
	icon = 'icons/obj/clothing/suits/armor.dmi'
	worn_icon = 'icons/mob/clothing/suits/armor.dmi'
	icon_state = "armor_sec"
	current_skin = "armor_sec" //prevents reskinning

/*
* BACKPACKS
*/
/obj/item/storage/backpack/security
	icon = 'icons/obj/storage/backpack.dmi'
	worn_icon = 'icons/mob/clothing/back/backpack.dmi'
	icon_state = "backpack-security"
	current_skin = "backpack-security" //prevents reskinning

/obj/item/storage/backpack/satchel/sec
	icon = 'icons/obj/storage/backpack.dmi'
	worn_icon = 'icons/mob/clothing/back/backpack.dmi'
	icon_state = "satchel-security"

/obj/item/storage/backpack/duffelbag/sec
	icon = 'icons/obj/storage/backpack.dmi'
	worn_icon = 'icons/mob/clothing/back/backpack.dmi'
	icon_state = "duffel-security"
	current_skin = "duffel-security" //prevents reskinning

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
