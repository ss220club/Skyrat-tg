/datum/world_topic/status/Run(list/input)
	. = ..()
	var/list/admins = list()
	for(var/client/C in GLOB.clients)
		if(C.holder)
			if(C.holder.fakekey)
				continue	//so stealthmins aren't revealed by the hub
			admins += list(list(C.key, join_admin_ranks(C.holder.ranks)))
	if(key_valid)
		for(var/i in 1 to admins.len)
			var/list/A = admins[i]
			.["admin[i - 1]"] = A[1]
			.["adminrank[i - 1]"] = A[2]
