/obj/item/clothing/head/hooded/cult_hoodie/eldritch
	desc = "A torn, dust-caked hood. Strange eyes line the inside."

/obj/item/clothing/suit/hooded/cultrobes/eldritch
	desc = "A ragged, dusty set of robes. Strange eyes line the inside."

/obj/item/clothing/suit/hooded/cultrobes/eldritch/examine(mob/user)
	. = ..()
	if(!IS_HERETIC(user))
		return
	if(hood_up)
		return

	. -= span_notice("Allows you to cast heretic spells while the hood is up.")
	. += span_notice("ПЕРЕВЕСТИ: Allows you to cast heretic spells while the hood is up.")

/obj/item/clothing/head/hooded/cult_hoodie/void
	desc = "Black like tar, doesn't reflect any light. Runic symbols line the outside, \
		with each flash you loose comprehension of what you are seeing."

/obj/item/clothing/suit/hooded/cultrobes/void
	desc = "Black like tar, doesn't reflect any light. Runic symbols line the outside, \
		with each flash you loose comprehension of what you are seeing."
