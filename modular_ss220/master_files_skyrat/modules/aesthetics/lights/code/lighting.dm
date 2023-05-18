/obj/machinery/light
	brightness = 8
	bulb_colour = LIGHT_COLOR_DEFAULT
	bulb_low_power_colour = COLOR_VERY_SOFT_YELLOW

/obj/machinery/light/update_icon_state()
	. = ..()
	switch(status) // set icon_states
		if(LIGHT_OK)
			var/area/local_area = get_area(src)
			if(low_power_mode)
				icon_state = "[base_state]"
			else if(major_emergency || (local_area?.fire))
				icon_state = "[base_state]_emergency"
			else
				icon_state = "[base_state]"
	return
