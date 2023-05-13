/obj/effect/heretic_rune
	desc = "A flowing circle of shapes and runes is etched into the floor, filled with a thick black tar-like fluid."

/obj/effect/heretic_rune/examine(mob/user)
	. = ..()
	if(!IS_HERETIC(user))
		return

	. -= span_notice("Allows you to transmute objects by invoking the rune after collecting the prerequisites overhead.")
	. -= span_notice("You can use your <i>Mansus Grasp</i> on the rune to remove it.")
	. += span_notice("ПЕРЕВЕСТИ: Allows you to transmute objects by invoking the rune after collecting the prerequisites overhead.")
	. += span_notice("ПЕРЕВЕСТИ: You can use your <i>Mansus Grasp</i> on the rune to remove it.")
