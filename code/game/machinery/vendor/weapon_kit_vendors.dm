//For Security Kits
/obj/machinery/vending/marshal_kit
	name = "\improper Liberty Watch Kit Vendor"
	desc = "A vendor that can dispense specialized equipment kits for Marshal Officers."
	icon_state = "trashvend"
	products = list(
		/obj/item/storage/box/m_kit/stinger = 5,
		/obj/item/storage/box/m_kit/trench = 5,
		/obj/item/storage/box/m_kit/kalash = 5,
		/obj/item/storage/box/m_kit/gear_lasgun = 5,
		/obj/item/storage/box/m_kit/taser = 5,
		/obj/item/storage/box/m_kit/specialist = 5,
		/obj/item/storage/box/m_kit/standard_armor = 5,
		/obj/item/storage/box/m_kit/bullet_proof = 5,
		/obj/item/storage/box/m_kit/laser_armor = 5,
		/obj/item/storage/box/m_kit/riot = 5
		)
	prices = list( // 500$ for default marshal stuff, 750 for the rest
		/obj/item/storage/box/m_kit/stinger = 750,
		/obj/item/storage/box/m_kit/trench = 750,
		/obj/item/storage/box/m_kit/kalash = 750,
		/obj/item/storage/box/m_kit/gear_lasgun = 750,
		/obj/item/storage/box/m_kit/taser = 500,
		/obj/item/storage/box/m_kit/specialist = 750,
		/obj/item/storage/box/m_kit/standard_armor = 500,
		/obj/item/storage/box/m_kit/bullet_proof = 850,
		/obj/item/storage/box/m_kit/riot = 750,
		/obj/item/storage/box/m_kit/laser_armor = 1250
		)
	auto_price = FALSE

/obj/machinery/vending/marshal_kit/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/voucher/marshal))
		var/obj/item/voucher/marshal/Voucher = I
		if(Voucher.stamped)
			return
		else
			Voucher.stamped = TRUE
		switch(Voucher.voucher_type)
			if("Primary")
				RedeemPrimary(I, user)
			if("Secondary")
				RedeemSecondary(I, user)
			if("SpecPrimary")
				RedeemSpecPrimary(I, user)
			if("RangerPrimary")
				RedeemRangerPrimary(I, user)
			if("Armor")
				RedeemArmor(I, user)
		return
	return ..()

/obj/machinery/vending/marshal_kit/proc/RedeemPrimary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Specialist Kit" = /obj/item/storage/box/m_kit/specialist,
					"Trench Kit" = /obj/item/storage/box/m_kit/trench,
					"Gear Laser Carbine Kit" = /obj/item/storage/box/m_kit/gear_lasgun)
	var/selection = items[input(redeemer, "Pick your primary weapon", "Marshal Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/marshal_kit/proc/RedeemSpecPrimary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Spec-Op Kit" = /obj/item/storage/box/m_kit/specop,
					"State Auto-Shotgun Kit" = /obj/item/storage/box/m_kit/state_auto,
					"Copperhead Kit" = /obj/item/storage/box/m_kit/copperhead,
					"Gear Laser Carbine Kit" = /obj/item/storage/box/m_kit/gear_lasgun,
					"Sunrise Las-SMG Kit" = /obj/item/storage/box/m_kit/typewriter)
	var/selection = items[input(redeemer, "Pick your primary weapon", "Marshal Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/marshal_kit/proc/RedeemRangerPrimary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Spec-Op Kit" = /obj/item/storage/box/m_kit/specop,
					"Custer Kit" = /obj/item/storage/box/m_kit/custer,
					"Peacekeeper Kit" = /obj/item/storage/box/m_kit/peacekeeper)
	var/selection = items[input(redeemer, "Pick your primary weapon", "Marshal Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/marshal_kit/proc/RedeemSecondary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Counselor Kit" = /obj/item/storage/box/m_kit/taser,
					"Liberty Kit" = /obj/item/storage/box/m_kit/liberty,
					"Judiciary Kit" = /obj/item/storage/box/m_kit/judiciary)
	var/selection = items[input(redeemer, "Pick your side-arm", "Marshal Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/marshal_kit/proc/RedeemRangerSecondary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Deckard Kit" = /obj/item/storage/box/m_kit/deckard,
					"Zwang Kit" = /obj/item/storage/box/m_kit/zwang,
					"Judge Revolver Kit" = /obj/item/storage/box/m_kit/judge)
	var/selection = items[input(redeemer, "Pick your side-arm", "Marshal Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/marshal_kit/proc/RedeemWOSecondary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Mateba Kit" = /obj/item/storage/box/m_kit/mateba,
					"Galaxy Kit" = /obj/item/storage/box/m_kit/galaxy,
					"Amnesty Kit" = /obj/item/storage/box/m_kit/amnesty)
	var/selection = items[input(redeemer, "Pick your side-arm", "Marshal Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/marshal_kit/proc/RedeemArmor(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Standard Plate" = /obj/item/storage/box/m_kit/standard_armor,
					"Riot Armor Kit" = /obj/item/storage/box/m_kit/riot,
					"Bullet-Proof Armor Kit" = /obj/item/storage/box/m_kit/bullet_proof,
					"Ablative Armor Kit" = /obj/item/storage/box/m_kit/laser_armor
					)
	var/selection = items[input(redeemer, "Pick your armor", "Marshal Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE
