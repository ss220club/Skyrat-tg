#define MAX_HOTKEY_SLOTS 3


/datum/preference_middleware/keybindings/set_keybindings(list/params)
	var/keybind_name = params["keybind_name"]

	if (isnull(GLOB.keybindings_by_name[keybind_name]))
		return FALSE

	var/list/raw_hotkeys = params["hotkeys"]
	if (!istype(raw_hotkeys))
		return FALSE

	if (raw_hotkeys.len > MAX_HOTKEY_SLOTS)
		return FALSE

	// There's no optimal, easy way to check if something is an array
	// and not an object in BYOND, so just sanitize it to make sure.
	var/list/hotkeys = list()
	for (var/hotkey in raw_hotkeys)
		if (!istext(hotkey))
			return FALSE

		// Fairly arbitrary number, it's just so you don't save enormous fake keybinds.
		if (length(hotkey) > 100)
			return FALSE

		hotkeys += convert_ru_key_to_en_key(hotkey)

	preferences.key_bindings[keybind_name] = hotkeys
	preferences.key_bindings_by_key = preferences.get_key_bindings_by_key(preferences.key_bindings)

	return TRUE


#undef MAX_HOTKEY_SLOTS
