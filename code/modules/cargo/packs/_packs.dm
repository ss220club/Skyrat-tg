/datum/supply_pack
	/// The name of the supply pack, as listed on th cargo purchasing UI.
	var/name = "Crate"
	/// The group that the supply pack is sorted into within the cargo purchasing UI.
	var/group = ""
	/// Is this cargo supply pack visible to the cargo purchasing UI.
	var/hidden = FALSE
	/// Is this supply pack purchasable outside of the standard purchasing band? Contraband is available by multitooling the cargo purchasing board.
	var/contraband = FALSE
	/// Cost of the crate. DO NOT GO ANY LOWER THAN X1.4 the "CARGO_CRATE_VALUE" value if using regular crates, or infinite profit will be possible!
	var/cost = CARGO_CRATE_VALUE * 1.4
	/// What access is required to open the crate when spawned?
	var/access = FALSE
	/// Who can view this supply_pack and with what access.
	var/access_view = FALSE
	/// If someone with any of the following accesses in a list can open this cargo pack crate.
	var/access_any = FALSE
	/// A list of items that are spawned in the crate of the supply pack.
	var/list/contains = null
	/// What is the name of the crate that is spawned with the crate's contents??
	var/crate_name = "crate"
	/// When spawning a gas canistor, what kind of gas type are we spawning?
	var/id
	/// The description shown on the cargo purchasing UI. No desc by default.
	var/desc = ""
	/// What typepath of crate do you spawn?
	var/crate_type = /obj/structure/closet/crate
	/// Should we message admins?
	var/dangerous = FALSE
	/// Event/Station Goals/Admin enabled packs
	var/special = FALSE
	/// When a cargo pack can be unlocked by special events (as seen in special), this toggles if it's been enabled in the round yet (For example, after the station alert, we can now enable buying the station goal pack).
	var/special_enabled = FALSE
	/// Only usable by the Bluespace Drop Pod via the express cargo console
	var/drop_pod_only = FALSE
	/// If this pack comes shipped in a specific pod when launched from the express console
	var/special_pod
	/// Was this spawned through an admin proc?
	var/admin_spawned = FALSE
	/// Goodies can only be purchased by private accounts and can have coupons apply to them. They also come in a lockbox instead of a full crate, so the 700 min doesn't apply
	var/goody = FALSE

/datum/supply_pack/New()
	id = type

/datum/supply_pack/proc/generate(atom/A, datum/bank_account/paying_account)
	var/obj/structure/closet/crate/C
	if(paying_account)
		C = new /obj/structure/closet/crate/secure/owned(A, paying_account)
		C.name = "[crate_name] - Purchased by [paying_account.account_holder]"
	else if(!crate_type)
		CRASH("tried to generate a supply pack without a valid crate type")
	else
		C = new crate_type(A)
		C.name = crate_name
	if(access)
		C.req_access = list(access)
	if(access_any)
		C.req_one_access = access_any

	fill(C)
	return C

/datum/supply_pack/proc/get_cost()
	. = cost
	. *= SSeconomy.pack_price_modifier

/datum/supply_pack/proc/fill(obj/structure/closet/crate/C)
	for(var/item in contains)
		if(!contains[item])
			contains[item] = 1
		for(var/iteration = 1 to contains[item])
			var/atom/A = new item(C)
			if(!admin_spawned)
				continue
			A.flags_1 |= ADMIN_SPAWNED_1

/// For generating supply packs at runtime. Returns a list of supply packs to use instead of this one.
/datum/supply_pack/proc/generate_supply_packs()
	return

///Easily send a supplypod to an area
/proc/send_supply_pod_to_area(contents, area_type, pod_type = /obj/structure/closet/supplypod)
	var/list/areas = get_areas(area_type)
	if(!LAZYLEN(areas))
		return FALSE
	var/list/open_turfs = list()
	for(var/turf/open/floor/found_turf in get_area_turfs(pick(areas), subtypes = TRUE))
		open_turfs += found_turf 

	if(!length(open_turfs))
		return FALSE

	new /obj/effect/pod_landingzone (pick(open_turfs), new pod_type (), contents)
	return TRUE

/**
 * Custom supply pack
 * The contents are given on New rather than being static
 * This is for adding custom orders to the Cargo console (like order consoles)
 */
/datum/supply_pack/custom
	name = "mining order"
	hidden = TRUE
	crate_name = "shaft mining delivery crate"
	access = list(ACCESS_MINING)

/datum/supply_pack/custom/New(purchaser, cost, list/contains)
	. = ..()
	name = "[purchaser]'s Mining Order"
	src.cost = cost
	src.contains = contains
