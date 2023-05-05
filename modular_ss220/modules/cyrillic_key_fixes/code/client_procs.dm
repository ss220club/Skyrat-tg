/client/update_special_keybinds(datum/preferences/direct_prefs)
	var/datum/preferences/D = prefs || direct_prefs
	if(!D?.key_bindings)
		return
	movement_keys = list()
	for(var/kb_name in D.key_bindings)
		for(var/key in D.key_bindings[kb_name])
			switch(kb_name)
				if("North")
					movement_keys[key] = NORTH
				if("East")
					movement_keys[key] = EAST
				if("West")
					movement_keys[key] = WEST
				if("South")
					movement_keys[key] = SOUTH
				if(ADMIN_CHANNEL)
					if(holder)
						var/asay = tgui_say_create_open_command(ADMIN_CHANNEL)
						winset(src, "default-[REF(key)]", "parent=default;name=[key];command=[asay]")
					else
						winset(src, "default-[REF(key)]", "parent=default;name=[key];command=")
