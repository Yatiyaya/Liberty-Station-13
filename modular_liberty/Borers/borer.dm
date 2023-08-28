/mob/living/simple_animal/borer
	name = "cortical borer"
	real_name = "cortical borer"
	desc = "A small, quivering sluglike creature."
	speak_emote = list("chirrups")
	emote_hear = list("chirrups")
	response_help  = "pokes the"
	response_disarm = "prods the"
	response_harm   = "stomps on the"
	icon_state = "brainslug"
	colony_friend = TRUE
	health = 30
	maxHealth = 30

	speed = 4
	see_in_dark = 8
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	a_intent = I_HURT
	stop_automated_movement = 1
	status_flags = CANPUSH
	attacktext = "nipped"
	friendly = "prods"
	wander = 0
	hunger_enabled = FALSE
	pass_flags = PASSTABLE
	universal_understand = 1

	defaultHUD = "BorerStyle"

	//holder_type = /obj/item/holder/borer //Theres no inhand sprites for holding borers, it turns you into a pink square

	var/borer_level = 0			// Level of borer.
	var/borer_exp = 0			// Borer experience.
	var/last_request
	var/used_dominate
	var/max_chemicals = 50									// Max chemicals produce without a host
	var/max_chemicals_inhost =	250							// Max chemicals produce within a host
	var/chemicals = 50										// Chemicals used for reproduction and spitting neurotoxin.

	var/mob/living/captive_brain/host_brain			// Used for swapping control of the body back and forth.
	var/mob/living/carbon/human/H					// Human host for the brain worm.
	var/mob/living/carbon/superior_animal/symbiont	// Superior host for the brain worm.
	var/mob/living/simple_animal/parasitoid			// Lesser host for the brain worm.
	var/mob/living/host								// Generic host for the brain worm.

	var/truename							// Name used for brainworm-speak.
	var/controlling = FALSE					// Used in human death check.
	var/docile = 0							// Sugar can stop borers from acting.
	var/has_reproduced
	var/roundstart

	// Abilities borer can use when outside the host
	var/list/abilities_standalone = list(
		/mob/living/proc/ventcrawl,
		/mob/living/proc/hide,
		/mob/living/simple_animal/borer/proc/paralyze_victim,
		/mob/living/simple_animal/borer/proc/infest,

		)

	// Abilities borer can use when inside the host, but not in control
	var/list/abilities_in_host = list(
		/mob/living/simple_animal/borer/proc/secrete_chemicals,
		/mob/living/simple_animal/borer/proc/assume_control,
		/mob/living/simple_animal/borer/proc/paralyze_victim,
		/mob/living/simple_animal/borer/proc/read_mind,
		/mob/living/simple_animal/borer/proc/write_mind,
		/mob/living/simple_animal/borer/proc/release_host,
		/mob/living/simple_animal/borer/proc/reproduce
	)

	// Abilities borer can use when controlling the host
	// (keep in mind that those have to be abilities of /mob/living/carbon, not /mob/living/simple_animal/borer)
	var/list/abilities_in_control = list(
		/mob/living/proc/release_control,
		/mob/living/carbon/proc/talk_host,
		/mob/living/carbon/human/proc/psychic_whisper,
		/mob/living/carbon/proc/spawn_larvae
	)

	// Reagents the borer can secrete into host's blood
	var/list/produced_reagents = list(
		"alkysine", "bicaridine", "kelotane", "dexalin", "anti_toxin",
		"chronos", "tramadol", "space_drugs", "mindbreaker"
		)

/mob/living/simple_animal/borer/roundstart
	roundstart = 1

/mob/living/simple_animal/borer/Login()
	..()
	if(!roundstart && mind && !mind.antagonist.len)
		var/datum/antagonist/A = create_antag_instance(ROLE_BORER_REPRODUCED)
		A.create_antagonist(mind,update = FALSE)

/mob/living/simple_animal/borer/New()
	..()

	add_language(LANGUAGE_CORTICAL)
	update_abilities()

	truename = "[pick("Primary","Secondary","Tertiary","Quaternary")] [rand(1000,9999)]"
	if(!roundstart) request_player()
	create_HUD()

/mob/living/simple_animal/borer/create_HUD()

	create_HUDneed()
	create_HUDfrippery()
	create_HUDtech()
//	create_HUDinventory()

	show_HUD()

	return

/mob/living/simple_animal/borer/create_HUDneed()
	var/mob/living/simple_animal/borer/H = src
	var/datum/hud/borer/HUDdatum = GLOB.HUDdatums[H.defaultHUD]
	for (var/HUDname in HUDdatum.HUDneed)
		var/HUDtype = HUDdatum.HUDneed[HUDname]["type"]

		var/obj/screen/HUD = new HUDtype(HUDname, H,\
		HUDdatum.HUDneed[HUDname]["icon"] ? HUDdatum.HUDneed[HUDname]["icon"] : HUDdatum.icon,\
		HUDdatum.HUDneed[HUDname]["icon_state"] ? HUDdatum.HUDneed[HUDname]["icon_state"] : null)

		HUD.screen_loc = HUDdatum.HUDneed[HUDname]["loc"]

		H.HUDneed[HUD.name] += HUD
		if (HUD.process_flag)
			H.HUDprocess += HUD
	return

/mob/living/simple_animal/borer/create_HUDinventory()
	var/mob/living/simple_animal/borer/H = src
	var/datum/hud/borer/HUDdatum = GLOB.HUDdatums[H.defaultHUD]

	for (var/gear_slot in hud.gear)
		if (!HUDdatum.slot_data.Find(gear_slot))
			log_debug("[usr] try take inventory data for [gear_slot], but HUDdatum not have it!")
			to_chat(H, "Sorry, but something went wrong with creating inventory slots, we recommend changing HUD type or call admins")
			return
		else
			var/HUDtype
			if(HUDdatum.slot_data[gear_slot]["type"])
				HUDtype = HUDdatum.slot_data[gear_slot]["type"]
			else
				HUDtype = /obj/screen/inventory

			var/obj/screen/inventory/inv_box = new HUDtype(gear_slot,\
			hud.gear[gear_slot],\
			HUDdatum.icon, HUDdatum.slot_data[gear_slot]["state"], H)

			if(HUDdatum.slot_data[gear_slot]["hideflag"])
				inv_box.hideflag = HUDdatum.slot_data[gear_slot]["hideflag"]

			H.HUDinventory += inv_box
	return

/mob/living/simple_animal/borer/create_HUDfrippery()
	var/mob/living/simple_animal/borer/H = src
	var/datum/hud/borer/HUDdatum = GLOB.HUDdatums[H.defaultHUD]

	for (var/list/whistle in HUDdatum.HUDfrippery)
		var/obj/screen/frippery/F = new (whistle["icon_state"],whistle["loc"],H)
		F.icon = HUDdatum.icon
		if(whistle["hideflag"])
			F.hideflag = whistle["hideflag"]
		H.HUDfrippery += F
	return

/mob/living/simple_animal/borer/create_HUDtech()
	var/mob/living/simple_animal/borer/H = src
	var/datum/hud/borer/HUDdatum = GLOB.HUDdatums[H.defaultHUD]

	for (var/techobject in HUDdatum.HUDoverlays)
		var/HUDtype = HUDdatum.HUDoverlays[techobject]["type"]

		var/obj/screen/HUD = new HUDtype(techobject,H,\
		 HUDdatum.HUDoverlays[techobject]["icon"] ? HUDdatum.HUDoverlays[techobject]["icon"] : null,\
		 HUDdatum.HUDoverlays[techobject]["icon_state"] ? HUDdatum.HUDoverlays[techobject]["icon_state"] : null)
		HUD.layer = FLASH_LAYER

		H.HUDtech[HUD.name] += HUD
		if (HUD.process_flag)
			H.HUDprocess += HUD
	return

/mob/living/simple_animal/borer/proc/ghost_enter(mob/user)
	if(stat || key)
		return FALSE
	var/confirmation = alert("Would you like to occupy \the [src]?", "", "Yes", "No")
	if(confirmation == "No" || QDELETED(src))
		return TRUE
	if(key)
		to_chat(user, SPAN_WARNING("Someone is already occupying this body."))
		return TRUE
	key = user.key

	show_HUD()
	return TRUE

/mob/living/simple_animal/borer/attack_ghost(mob/user)
	. = ..()
	if(!.)
		. = ghost_enter(user)

/mob/living/simple_animal/borer/proc/update_abilities(force_host=FALSE)
	// Remove all abilities
	verbs -= abilities_standalone
	verbs -= abilities_in_host
	verbs -= abilities_in_control
	host?.verbs -= abilities_in_control
	verbs -= list(
		/mob/living/simple_animal/verb/toggle_AI,
		/mob/living/simple_animal/hostile/verb/break_around,
		)

	// Borer gets host abilities before actually getting inside the host
	// Workaround for a BYOND bug: http://www.byond.com/forum/post/1833666
	/*
	if(force_host)
		if(ishuman(host))
			verbs += abilities_in_host
			return
		for(var/ability in abilities_in_host)
			if(ispath(ability, /mob/living/carbon/human))
				continue
			verbs += ability
		return
	*/
	// Re-grant some of the abilities, depending on the situation
	if(!host)
		verbs += abilities_standalone

	else if(!controlling)
		for(var/ability in abilities_in_host)
			if(ispath(ability, /mob/living/carbon/human))
				continue
			verbs += ability
			verbs += abilities_in_host
			Stat()
			return

	else
		host.verbs += abilities_in_control
	Stat()

// If borer is controlling a host directly, send messages to host instead of borer
/mob/living/simple_animal/borer/proc/get_borer_control()
	return (host && controlling) ? host : src

/mob/living/simple_animal/borer/Life()
	..()

	if((chemicals < max_chemicals) && !invisibility)
		chemicals++

	if(invisibility)
		if(chemicals <= 2)
			invisible()
			chemicals = 0
		else
			chemicals -= 1

	if(host && !stat && !(host.stat == 2))
		// Regenerate if within a host
		if(health < maxHealth)
			adjustBruteLoss(-1)

		if(host.reagents.has_reagent("sugar"))
			if(!docile)
				to_chat(get_borer_control(), SPAN_DANGER("You feel the soporific flow of sugar in your host's blood, lulling you into docility."))
				docile = TRUE
		else
			if(docile)
				to_chat(get_borer_control(), SPAN_DANGER("You shake off your lethargy as the sugar leaves your host's blood."))
				docile = FALSE

		if(chemicals < max_chemicals_inhost)
			chemicals += level + 1

		if(controlling)
			if(docile)
				to_chat(host, SPAN_DANGER("You are feeling far too docile to continue controlling your host..."))
				host.release_control()
				return

			if(!host.AI_inactive) //We are in control now.
				host.AI_inactive = 1

			if(prob(5))
				host.adjustBrainLoss(0.1)

			if(prob(host.brainloss/20))
				host.say("*[pick(list("blink","blink_r","choke","aflap","drool","twitch","twitch_s","gasp"))]")

//	for(var/mob/living/L in oviewers(8)) //Sucks to put this here, but otherwise mobs will ignore them
//		L.try_activate_ai()

/mob/living/simple_animal/borer/Stat()
	. = ..()
	statpanel("Status")

	if(evacuation_controller)
		var/eta_status = evacuation_controller.get_status_panel_eta()
		if(eta_status)
			stat(null, eta_status)

	if (client?.statpanel == "Status")
		stat("Evolution Level", borer_level)
		stat("Chemicals", host ? "[chemicals] / [max_chemicals_inhost]" : "[chemicals] / [max_chemicals]")
		if(host)
			stat("Host health", host.stat == DEAD ? "Deceased" : host.health)
			stat("Host brain damage", host.getBrainLoss())

/mob/living/simple_animal/borer/proc/detatch()

	if(!host || !controlling) return

	if(ishuman(host))
		var/mob/living/carbon/human/H = host
		var/obj/item/organ/external/head = H.get_organ(BP_HEAD)
		head.implants -= src

	controlling = FALSE
	host.AI_inactive = 0

	host.remove_language(LANGUAGE_CORTICAL)
	update_abilities()

	if(host_brain)

		// these are here so bans and multikey warnings are not triggered on the wrong people when ckey is changed.
		// computer_id and IP are not updated magically on their own in offline mobs -walter0o

		// host -> self
		var/h2s_id = host.computer_id
		var/h2s_ip= host.lastKnownIP
		host.computer_id = null
		host.lastKnownIP = null

		src.ckey = host.ckey

		if(!src.computer_id)
			src.computer_id = h2s_id

		if(!host_brain.lastKnownIP)
			src.lastKnownIP = h2s_ip

		// brain -> host
		var/b2h_id = host_brain.computer_id
		var/b2h_ip= host_brain.lastKnownIP
		host_brain.computer_id = null
		host_brain.lastKnownIP = null

		host.ckey = host_brain.ckey

		if(!host.computer_id)
			host.computer_id = b2h_id

		if(!host.lastKnownIP)
			host.lastKnownIP = b2h_ip
		show_HUD()

	qdel(host_brain)

/mob/living/simple_animal/borer/proc/leave_host()
	if(!host) return

	if(host.mind)
		clear_antagonist_type(host.mind, ROLE_BORER)

	src.loc = get_turf(host)

	reset_view(null)
	machine = null

	host.reset_view(null)
	host.machine = null

	var/mob/living/H = host
	H.status_flags &= ~PASSEMOTES
	host = null
	update_abilities()

//Procs for grabbing players.
/mob/living/simple_animal/borer/proc/request_player()
	var/datum/ghosttrap/G = get_ghost_trap("cortical borer")
	G.request_player(src, "A cortical borer needs a player.", ANIMAL)

/mob/living/simple_animal/borer/proc/borer_add_exp(var/num)
	borer_exp += num
	update_borer_level()

/mob/living/simple_animal/borer/proc/update_borer_level()
	if((borer_exp >= 20) && (borer_level < 1))
		borer_level = 1
		if(host && controlling)
			to_chat(host, SPAN_NOTICE("Congratulations! You've reached Evolution Level 1, new reagents and new abilities are now available."))
		else
			to_chat(src, SPAN_NOTICE("Congratulations! You've reached Evolution Level 1, new reagents and new abilities are now available."))
		produced_reagents |= list("inaprovaline", "tricordrazine", "synaptizine", "imidazoline", "hyronalin")
		abilities_in_host |= list(/mob/living/simple_animal/borer/proc/say_host, /mob/living/simple_animal/borer/proc/whisper_host, /mob/living/simple_animal/borer/proc/commune, /mob/living/simple_animal/borer/proc/sample_blood)
		abilities_standalone |= list(/mob/living/simple_animal/borer/proc/commune)
		if(host && !controlling)
			verbs += /mob/living/simple_animal/borer/proc/say_host
			verbs += /mob/living/simple_animal/borer/proc/whisper_host
			verbs += /mob/living/simple_animal/borer/proc/commune
			verbs += /mob/living/simple_animal/borer/proc/sample_blood
		if(!host)
			verbs += /mob/living/simple_animal/borer/proc/commune
		max_chemicals += (borer_level * 10)
		max_chemicals_inhost = max_chemicals * 5

	if((borer_exp >= 40) && (borer_level < 2))
		borer_level = 2
		if(host && controlling)
			to_chat(host, SPAN_NOTICE("Congratulations! You've reached Evolution Level 2, new reagents and new abilities are now available."))
		else
			to_chat(src, SPAN_NOTICE("Congratulations! You've reached Evolution Level 2, new reagents and new abilities are now available."))
		produced_reagents |= list("spaceacillin", "quickclot", "detox", "purger", "arithrazine")
		abilities_standalone |= list(/mob/living/simple_animal/borer/proc/biograde)
		abilities_in_control |= list(/mob/living/carbon/human/proc/commune)
		if(!host)
			verbs += /mob/living/simple_animal/borer/proc/biograde
		if(host && controlling && ishuman(host))
			verbs += /mob/living/carbon/human/proc/commune
		max_chemicals += (borer_level * 10)
		max_chemicals_inhost = max_chemicals * 5

	if((borer_exp >= 80) && (borer_level < 3))
		borer_level = 3
		if(host && controlling)
			to_chat(host, SPAN_NOTICE("Congratulations! You've reached Evolution Level 3, new reagents and new abilities are now available."))
		else
			to_chat(src, SPAN_NOTICE("Congratulations! You've reached Evolution Level 3, new reagents and new abilities are now available."))
		produced_reagents |= list("meralyne", "dermaline", "dexalinp", "oxycodone", "ryetalyn")
		abilities_standalone |= list(/mob/living/simple_animal/borer/proc/invisible)
		if(!host)
			verbs += /mob/living/simple_animal/borer/proc/invisible
		max_chemicals += (borer_level * 10)
		max_chemicals_inhost = max_chemicals * 5

	if((borer_exp >= 160) && (borer_level < 4))
		borer_level = 4
		if(host && controlling)
			to_chat(host, SPAN_NOTICE("Congratulations! You've reached Evolution Level 4, new reagents are now available."))
		else
			to_chat(src, SPAN_NOTICE("Congratulations! You've reached Evolution Level 4, new reagents are now available."))
		produced_reagents |= list("peridaxon", "rezadone", "ossisine", "kyphotorin", "aminazine")
		health = 100
		maxHealth = 100
		speed = 1
		max_chemicals += (borer_level * 10)
		max_chemicals_inhost = max_chemicals * 5

	if((borer_exp >= 320) && (borer_level < 5))
		borer_level = 5
		if(host && controlling)
			to_chat(host, SPAN_NOTICE("Congratulations! You've reached Evolution Level 5, new abilities are now available."))
		else
			to_chat(src, SPAN_NOTICE("Congratulations! You've reached Evolution Level 5, new abilities are now available."))
		produced_reagents |= list("violence", "steady", "bouncer", "prosurgeon", "cherry drops", "greaser")
		abilities_in_host |= list(/mob/living/simple_animal/borer/proc/jumpstart)
		if(host && !controlling)
			verbs += /mob/living/simple_animal/borer/proc/jumpstart
		max_chemicals += (borer_level * 10)
		max_chemicals_inhost = max_chemicals * 5

/mob/living/simple_animal/borer/cannot_use_vents()
	return

/mob/living/simple_animal/borer/death()
	.=..()
	if(invisibility)
		alpha = 255
		invisibility = 0

/mob/living/simple_animal/borer/update_sight()
	if(stat == DEAD || eyeobj)
		update_dead_sight()
	else
		if (is_ventcrawling)
			sight |= SEE_TURFS|SEE_OBJS|SEE_MOBS|BLIND
		else
			//sight = initial(sight)
			see_in_dark = initial(see_in_dark)
