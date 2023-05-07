/obj/item/melee/baton
	stamina_damage = 55 // (TG: 55, Skyrat: 35)

/obj/item/melee/baton/telescopic/contractor_baton
	stamina_damage = 85 // (TG: 85, Skyrat: 115)

/obj/item/melee/baton/security
	stamina_damage = 60 // 2 batons for crit (TG: 60, Skyrat: 35)

/obj/item/melee/baton/security/additional_effects_non_cyborg(mob/living/target, mob/living/user)
	. = ..()
	target.set_confusion_if_lower(10 SECONDS) // Removed on Skyrat
