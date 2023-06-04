/datum/traitor_objective/ultimate/space_dragon
	name = "Мутируйте свою ДНК с помощью ДНК карпа, чтобы стать космическим драконом."
	description = "Отправляйтесь в %AREA% и получите сканер для ДНК карпа. \
		Используйте его на любом космическом карпе, чтобы собрать его ДНК. \
		Затем используйте его на себе, чтобы стать космическим драконом. \
		Не беспокойтесь о поиске карпов, я уверен, что они появятся в самый подходящий момент."

	///Area type the objective owner must be in to recieve the DNA extractor.
	var/area/dna_scanner_spawnarea_type
	///Whether the DNA extraction kit was sent already.
	var/recieved_dna_scanner = FALSE

/datum/traitor_objective/ultimate/space_dragon/on_objective_taken(mob/user)
	. = ..()
	force_event(/datum/round_event_control/carp_migration, "[handler.owner]'s final objective")

/datum/traitor_objective/ultimate/space_dragon/generate_objective(datum/mind/generating_for, list/possible_duplicates)
	var/list/possible_areas = GLOB.the_station_areas.Copy()
	for(var/area/possible_area as anything in possible_areas)
		//remove areas too close to the destination, too obvious for our poor shmuck, or just unfair
		if(ispath(possible_area, /area/station/hallway) || ispath(possible_area, /area/station/security))
			possible_areas -= possible_area
	if(length(possible_areas) == 0)
		return FALSE
	dna_scanner_spawnarea_type = pick(possible_areas)
	replace_in_name("%AREA%", initial(dna_scanner_spawnarea_type.name))
	return TRUE

/datum/traitor_objective/ultimate/space_dragon/generate_ui_buttons(mob/user)
	var/list/buttons = list()
	if(!recieved_dna_scanner)
		buttons += add_ui_button("", "Pressing this will call down a pod with the DNA extraction kit.", "biohazard", "carp_dna")
	return buttons

/datum/traitor_objective/ultimate/space_dragon/ui_perform_action(mob/living/user, action)
	. = ..()
	switch(action)
		if("carp_dna")
			if(recieved_dna_scanner)
				return
			var/area/delivery_area = get_area(user)
			if(delivery_area.type != dna_scanner_spawnarea_type)
				to_chat(user, span_warning("You must be in [initial(dna_scanner_spawnarea_type.name)] to recieve the DNA extraction kit."))
				return
			recieved_dna_scanner = TRUE
			podspawn(list(
				"target" = get_turf(user),
				"style" = STYLE_SYNDICATE,
				"spawn" = /obj/item/storage/box/syndie_kit/space_dragon,
			))
