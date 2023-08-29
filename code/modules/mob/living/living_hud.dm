/mob/proc/create_HUD()
	return

/mob/proc/dead_HUD()
	return

/mob/proc/minimalize_HUD()
	var/mob/H = src
	var/datum/hud/HUDdatum = GLOB.HUDdatums[H.defaultHUD]
	if (H.client.prefs.UI_compact_style && HUDdatum.MinStyleFlag)
		for (var/p in H.HUDneed)
			var/obj/screen/HUD = H.HUDneed[p]
			HUD.underlays.Cut()
			if(HUDdatum.HUDneed[p]["minloc"])
				HUD.screen_loc = HUDdatum.HUDneed[p]["minloc"]

		for (var/p in H.HUDtech)
			var/obj/screen/HUD = H.HUDtech[p]
			if(HUDdatum.HUDoverlays[p]["minloc"])
				HUD.screen_loc = HUDdatum.HUDoverlays[p]["minloc"]

		for (var/obj/screen/inventory/HUDinv in H.HUDinventory)
			HUDinv.underlays.Cut()
			for (var/p in H.hud.gear)
				if(H.hud.gear[p] == HUDinv.slot_id)
					if(HUDdatum.slot_data[p]["minloc"])
						HUDinv.screen_loc = HUDdatum.slot_data[p]["minloc"]
					break
		for (var/obj/screen/frippery/HUDfri in H.HUDfrippery)
			H.client.screen -= HUDfri
	else

		for (var/p in H.HUDneed)
			var/obj/screen/HUD = H.HUDneed[p]
			HUD.underlays.Cut()
			if (HUDdatum.HUDneed[p]["background"])
				HUD.underlays += HUDdatum.IconUnderlays[HUDdatum.HUDneed[p]["background"]]
			HUD.screen_loc = HUDdatum.HUDneed[p]["loc"]

		for (var/p in H.HUDtech)
			var/obj/screen/HUD = H.HUDtech[p]
			HUD.screen_loc = HUDdatum.HUDoverlays[p]["loc"]

		for (var/obj/screen/inventory/HUDinv in H.HUDinventory)
			for (var/p in H.hud.gear)
				if(H.hud.gear[p] == HUDinv.slot_id)
					HUDinv.underlays.Cut()
					if (HUDdatum.slot_data[p]["background"])//(HUDdatum.slot_data[HUDinv.slot_id]["background"])
						HUDinv.underlays += HUDdatum.IconUnderlays[HUDdatum.slot_data[p]["background"]]
					HUDinv.screen_loc = HUDdatum.slot_data[p]["loc"]
					break
		for (var/obj/screen/frippery/HUDfri in H.HUDfrippery)
			H.client.screen += HUDfri
	//update_equip_icon_position()
	for(var/obj/item/I in get_equipped_items(1))
		var/slotID = get_inventory_slot(I)
		I.screen_loc = find_inv_position(slotID)

	var/obj/item/I = get_active_hand()
	if(I)
		I.update_hud_actions()
/*	update_inv_w_uniform(0)
	update_inv_wear_id(0)
	update_inv_gloves(0)
	update_inv_glasses(0)
	update_inv_ears(0)
	update_inv_shoes(0)
	update_inv_s_store(0)
	update_inv_wear_mask(0)
	update_inv_head(0)
	update_inv_belt(0)
	update_inv_back(0)
	update_inv_wear_suit(0)
	update_inv_r_hand(0)
	update_inv_l_hand(0)
	update_inv_handcuffed(0)
	update_inv_legcuffed(0)
	update_inv_pockets(0)*/
//	H.regenerate_icons()
	return

/mob/living/proc/destroy_HUD()
	var/mob/living/H = src
	H.HUDprocess.Cut()
	for (var/p in H.HUDneed)
		qdel(H.HUDneed[p])
	for (var/HUDelement in H.HUDinventory)
		qdel(HUDelement)
	for (var/HUDelement in H.HUDfrippery)
		qdel(HUDelement)
	for (var/p in H.HUDtech)
		qdel(H.HUDtech[p])
	H.HUDtech.Cut()
	H.HUDneed.Cut()
	H.HUDinventory.Cut()
	H.HUDfrippery.Cut()
	return

/mob/living/proc/show_HUD()
	if(src.client)
		for (var/i=1,i<=HUDneed.len,i++)
			var/p = HUDneed[i]
			src.client.screen += HUDneed[p]
		for (var/obj/screen/HUDinv in src.HUDinventory)
			src.client.screen += HUDinv
		for (var/i=1,i<=HUDtech.len,i++)
			var/p = HUDtech[i]
			src.client.screen += HUDtech[p]
//For HUD checking needs
	return

/mob/living/proc/recolor_HUD(var/_color, var/_alpha)
	for (var/i=1,i<=HUDneed.len,i++)
		var/p = HUDneed[i]
		var/obj/screen/HUDelm = HUDneed[p]
		HUDelm.color = _color
		HUDelm.alpha = _alpha
	for (var/obj/screen/HUDinv in src.HUDinventory)
		HUDinv.color = _color
		HUDinv.alpha = _alpha
	return

/mob/living/proc/check_HUD()//Main HUD check process
	return

/mob/living/proc/check_HUDdatum()//correct a datum?
	return
/mob/living/proc/check_HUDinventory()//correct a HUDinventory?
	return
/mob/living/proc/check_HUDneed()
	return
/mob/living/proc/check_HUDfrippery()
	return
/mob/living/proc/check_HUDprocess()
	return
/mob/living/proc/check_HUDtech()
	return
/mob/living/proc/check_HUD_style()
	return


/mob/living/proc/create_HUDinventory()//correct a HUDinventory?
	return
/mob/living/proc/create_HUDneed()
	return
/mob/living/proc/create_HUDfrippery()
	return
///mob/living/proc/create_HUDprocess()
//	return
/mob/living/proc/create_HUDtech()
	return
