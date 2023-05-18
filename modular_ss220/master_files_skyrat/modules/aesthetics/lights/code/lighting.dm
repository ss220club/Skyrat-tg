/obj/machinery/light
	brightness = 8
	bulb_colour = LIGHT_COLOR_DEFAULT
	bulb_low_power_colour = COLOR_VERY_SOFT_YELLOW

/obj/machinery/light/update_icon_state()
	. = ..()
	if(status == LIGHT_OK)
		if(low_power_mode)
			icon_state = "[base_state]"
