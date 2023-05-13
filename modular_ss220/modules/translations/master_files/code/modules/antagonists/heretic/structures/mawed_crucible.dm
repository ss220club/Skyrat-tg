/obj/structure/destructible/eldritch_crucible
	desc = "A deep basin made of cast iron, immortalized by steel-like teeth holding it in place. \
		Staring at the vile extract within fills your mind with terrible ideas."

/obj/structure/destructible/eldritch_crucible/examine(mob/user)
	. = ..()
	if(!IS_HERETIC_OR_MONSTER(user) && !isobserver(user))
		return

	if(current_mass < max_mass)
		var/to_fill = max_mass - current_mass
		. -= span_notice("[src] requires <b>[to_fill]</b> more organ[to_fill == 1 ? "":"s"] or bodypart[to_fill == 1 ? "":"s"].")
		. += span_notice("ПЕРЕВЕСТИ: [src] requires <b>[to_fill]</b> more organ[to_fill == 1 ? "":"s"] or bodypart[to_fill == 1 ? "":"s"].")
	else
		. -= span_boldnotice("[src] is bubbling to the brim with viscous liquid, and is ready to use.")
		. += span_boldnotice("ПЕРЕВЕСТИ: [src] is bubbling to the brim with viscous liquid, and is ready to use.")

	. -= span_notice("You can <b>[anchored ? "unanchor and move":"anchor in place"]</b> [src] with a <b>Codex Cicatrix</b> or <b>Mansus Grasp</b>.")
	. -= span_info("The following potions can be brewed:")
	for(var/obj/item/eldritch_potion/potion as anything in subtypesof(/obj/item/eldritch_potion))
		var/potion_string = span_info("\tThe " + initial(potion.name) + " - " + initial(potion.crucible_tip))
		. -= potion_string

	. += span_notice("ПЕРЕВЕСТИ: You can <b>[anchored ? "unanchor and move":"anchor in place"]</b> [src] with a <b>Codex Cicatrix</b> or <b>Mansus Grasp</b>.")
	. += span_info("ПЕРЕВЕСТИ: The following potions can be brewed:")
	for(var/obj/item/eldritch_potion/potion as anything in subtypesof(/obj/item/eldritch_potion))
		var/potion_string = span_info("\tThe " + initial(potion.name) + " - " + initial(potion.crucible_tip)) // Закладка на момент, когда будут готовы переводы
		. += potion_string

/obj/item/eldritch_potion
	desc = "You should never see this"

/obj/item/eldritch_potion/crucible_soul
	desc = "A glass bottle contianing a bright orange, translucent liquid."
	crucible_tip = "Allows you to walk through walls. After expiring, you are teleported to your original location. Lasts 15 seconds."

/obj/item/eldritch_potion/duskndawn
	desc = "A glass bottle contianing a dull yellow liquid. It seems to fade in and out with regularity."
	crucible_tip = "Allows you to see through walls and objects. Lasts 60 seconds."

/obj/item/eldritch_potion/wounded
	desc = "A glass bottle contianing a colorless, dark liquid."
	crucible_tip = "Causes all wounds you are experiencing to begin to heal you. Fractures, sprains, cuts, and punctures will heal bruises, \
		and flesh damage will heal burns. The more severe the wounds, the stronger the healing. Additionally, prevents slowdown from damage. \
		Lasts 60 seconds. "
