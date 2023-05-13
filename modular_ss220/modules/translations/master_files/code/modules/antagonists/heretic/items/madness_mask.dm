/obj/item/clothing/mask/madness_mask
	desc = "A mask created from the suffering of existence. Looking down it's eyes, you notice something gazing back at you."

/obj/item/clothing/mask/madness_mask/examine(mob/user)
	. = ..()
	if(IS_HERETIC_OR_MONSTER(user))
		. -= span_notice("Actively drains the sanity and stamina of nearby non-heretics when worn.")
		. -= span_notice("If forced onto the face of a non-heretic, they will be unable to remove it willingly.")
		. += span_notice("ПЕРЕВЕСТИ: Actively drains the sanity and stamina of nearby non-heretics when worn.")
		. += span_notice("ПЕРЕВЕСТИ: If forced onto the face of a non-heretic, they will be unable to remove it willingly.")
	else
		. -= span_danger("The eyes fill you with dread... You best avoid it.")
		. += span_danger("ПЕРЕВЕСТИ: The eyes fill you with dread... You best avoid it.")
