/obj/item/melee/rune_carver
	desc = "A small knife made of cold steel, pure and perfect. Its sharpness can carve into titanium itself - \
		but only few can evoke the dangers that lurk beneath reality."

/obj/item/melee/rune_carver/examine(mob/user)
	. = ..()
	if(!IS_HERETIC_OR_MONSTER(user) && !isobserver(user))
		return

	. -= span_notice("<b>[length(current_runes)] / [max_rune_amt]</b> total carvings have been drawn.")
	. -= span_info("The following runes can be carved:")
	for(var/obj/structure/trap/eldritch/trap as anything in subtypesof(/obj/structure/trap/eldritch))
		var/potion_string = span_info("\tThe " + initial(trap.name) + " - " + initial(trap.carver_tip))
		. -= potion_string

	. += span_notice("ПЕРЕВЕСТИ: <b>[length(current_runes)] / [max_rune_amt]</b> total carvings have been drawn.")
	. += span_info("ПЕРЕВЕСТИ: The following runes can be carved:")
	for(var/obj/structure/trap/eldritch/trap as anything in subtypesof(/obj/structure/trap/eldritch))
		var/potion_string = span_info("\tThe " + initial(trap.name) + " - " + initial(trap.carver_tip)) // Закладка на момент, когда будут готовы переводы
		. += potion_string

/datum/action/item_action/rune_shatter
	desc = "Destroys all runes carved by this blade."

/obj/structure/trap/eldritch
	desc = "Collection of unknown symbols, they remind you of days long gone..."

/obj/structure/trap/eldritch/alert
	carver_tip = "A nearly invisible rune that, when stepped on, alerts the carver who triggered it and where."

/obj/structure/trap/eldritch/tentacle
	carver_tip = "When stepped on, causes heavy damage leg damage and stuns the victim for 5 seconds. Has 1 charge."

/obj/structure/trap/eldritch/mad
	carver_tip = "When stepped on, causes heavy stamina damage, blindness, and a variety of ailments to the victim. Has 2 charges."
