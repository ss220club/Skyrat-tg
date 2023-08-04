//smooth fix
/turf/open/misc/ice/smooth
	smoothing_groups = SMOOTH_GROUP_FLOOR_ICE
	canSmoothWith = SMOOTH_GROUP_TURF_OPEN + SMOOTH_GROUP_OPEN_FLOOR + SMOOTH_GROUP_FLOOR_SNOWED

/turf/open/water/xen_acid/Entered(atom/movable/arrived, atom/old_loc, list/atom/old_locs)
	if(is_type_on_turf(src, /obj/structure/lattice/catwalk)) // Walk-FIX
		return FALSE
	. = ..()

//Winter objects
/obj/machinery/vending/wardrobe/winter
	name = "\improper Зимняя одежда"
	desc = "Гардеробная с зимней одежды для самой недоброжелательной природы."
	icon_state = "lawdrobe"
	product_ads = "Не морозь уши на зло маме!"
	vend_reply = "Всегда будьте в тепле!"
	products = list(/obj/item/clothing/suit/hooded/wintercoat = 10,
					/obj/item/clothing/suit/hooded/wintercoat/captain = 10,
					/obj/item/clothing/suit/hooded/wintercoat/hop = 10,
					/obj/item/clothing/suit/hooded/wintercoat/hydro = 10,
					/obj/item/clothing/suit/hooded/wintercoat/janitor = 10,
					/obj/item/clothing/suit/hooded/wintercoat/security = 10,
					/obj/item/clothing/suit/hooded/wintercoat/medical = 10,
					/obj/item/clothing/suit/hooded/wintercoat/medical/paramedic = 10,
					/obj/item/clothing/suit/hooded/wintercoat/medical/chemistry = 10,
					/obj/item/clothing/suit/hooded/wintercoat/medical/coroner = 10,
					/obj/item/clothing/suit/hooded/wintercoat/medical/viro = 10,
					/obj/item/clothing/suit/hooded/wintercoat/medical/cmo = 10,
					/obj/item/clothing/suit/hooded/wintercoat/science/genetics = 10,
					/obj/item/clothing/suit/hooded/wintercoat/science = 10,
					/obj/item/clothing/suit/hooded/wintercoat/science/rd = 10,
					/obj/item/clothing/suit/hooded/wintercoat/science/robotics = 10,
					/obj/item/clothing/suit/hooded/wintercoat/engineering = 10,
					/obj/item/clothing/suit/hooded/wintercoat/engineering/atmos = 10,
					/obj/item/clothing/suit/hooded/wintercoat/engineering/ce = 10,
					/obj/item/clothing/suit/hooded/wintercoat/cargo = 10,
					/obj/item/clothing/suit/hooded/wintercoat/cargo/qm = 10,
					/obj/item/clothing/suit/hooded/wintercoat/miner = 10,
					/obj/item/clothing/suit/hooded/wintercoat/skyrat = 10,
					/obj/item/clothing/suit/hooded/wintercoat/skyrat/bartender = 10,
					/obj/item/clothing/suit/hooded/wintercoat/skyrat/blueshield = 10,
					/obj/item/clothing/suit/hooded/wintercoat/skyrat/christmas = 10,
					)
	premium = list(	/obj/item/clothing/suit/hooded/wintercoat/centcom = 3,
					/obj/item/clothing/suit/hooded/wintercoat/skyrat/narsie = 3,
					/obj/item/clothing/suit/hooded/wintercoat/skyrat/ratvar = 3,
					/obj/item/clothing/suit/hooded/wintercoat/skyrat/syndicate = 3,
	)
	refill_canister = /obj/item/vending_refill/wardrobe/cent_wardrobe
	payment_department = ACCOUNT_SEC
	light_color = COLOR_MODERATE_BLUE
