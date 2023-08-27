#define REPAIR_DOOR_AMOUNT 2

/datum/lecture/hearthcore/machines
	name = "machines"
	phrase = null
	implant_type = /obj/item/implant/core_implant/hearthcore
	fail_message = "The Hearthcore feels cold against your chest."
	category = "Machinery"
	ignore_stuttering = TRUE

/*
//Cloning
/datum/lecture/hearthcore/machines/resurrection
	name = "Resurrection"
	phrase = "Qui fuit, et crediderunt in me non morietur in aeternum"
	desc = "A ritual of formation of a new body in a speclially designed machine.  Deceased person's Hearthcore has to be placed on the scanner then a lecture is to be uttered over the apparatus."

/datum/lecture/hearthcore/machines/resurrection/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/list/OBJS = get_front(user)

	var/obj/machinery/capsa/cloner/pod = locate(/obj/machinery/capsa/cloner) in OBJS

	if(!pod)
		fail("You fail to find any cloner here.", user, C)
		return FALSE

	if(pod.cloning)
		fail("Cloner is already cloning.", user, C)
		return FALSE

	if(pod.stat & NOPOWER)
		fail("Cloner is off.", user, C)
		return FALSE

	pod.start()
	return TRUE
*/

//Airlocks

/datum/lecture/hearthcore/machines/lock_door
	name = "Activate Hatchway"
	phrase = "Oxidate Lecture: Activate Hatchway."
	desc = "Commands a nearby hatchway to be locked or unlocked."

/datum/lecture/hearthcore/machines/lock_door/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/list/O = get_front(user)

	var/obj/machinery/door/bonfire/door = locate(/obj/machinery/door/bonfire) in O

	if(!door)
		fail("You fail to find a compatible door here.", user, C)
		return FALSE

	if(door.stat & (BROKEN))
		fail("[door] is off.", user, C)
		return FALSE

	door.locked ? door.unlock() : door.lock()
	return TRUE

/datum/lecture/hearthcore/forgemaster/repair_door
	name = "Repair Hatchway"
	phrase = "Oxidate Lecture: Repair Hatchway."
	desc = "Repairs a nearby hatchway at the cost of some carbon fiber."

/datum/lecture/hearthcore/forgemaster/repair_door/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/list/O = get_front(user)

	var/obj/machinery/door/bonfire/door = locate(/obj/machinery/door/bonfire) in O
	var/obj/item/stack/material/carbon_fiber/consumable

	if(!door)
		fail("You fail to find a compatible hatchway here.", user, C)
		return FALSE

	if(door.health == door.maxHealth)
		fail("This hatchway doesn\'t need repair.", user, C)
		return FALSE

	var/turf/target_turf = get_step(user, user.dir)
	var/turf/user_turf = get_turf(user)

	for(var/obj/item/stack/material/carbon_fiber/B in target_turf.contents)
		if(B.amount >= REPAIR_DOOR_AMOUNT)
			consumable = B
			break

	if(!consumable)
		for(var/obj/item/stack/material/carbon_fiber/B in user_turf.contents)
			if(B.amount >= REPAIR_DOOR_AMOUNT)
				consumable = B
				break

	if(consumable)
		consumable.use(REPAIR_DOOR_AMOUNT)
		var/obj/effect/overlay/knight_construction/effect = new(target_turf, 50)
		sleep(50)
		door.stat -= BROKEN
		door.health = door.maxHealth
		door.unlock()
		door.close()
		effect.success()
		return TRUE
	else
		fail("Not enough carbon fiber found to repair the hatchway, you need at least [REPAIR_DOOR_AMOUNT].", user, C)
		return FALSE

////////////////////////SCORCH MULTI MACHINES RITUALS

////////////////Bonfire commands

/datum/lecture/hearthcore/machines/bonfire
	name = "Bonfire command"

/datum/lecture/hearthcore/machines/bonfire/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C)
	var/obj/machinery/multistructure/bonfire_part/console/bonfire_screen = locate() in range(4, H)
	if(bonfire_screen && bonfire_screen.MS)
		var/datum/multistructure/bonfire/bonfire = bonfire_screen.MS
		//to prevent any copypaste
		//let's make it a bit better
		var/success = perform_command(bonfire)
		if(H.species?.reagent_tag != IS_SYNTHETIC)
			if(H.nutrition >= nutri_cost)
				H.nutrition -= nutri_cost
			else
				to_chat(H, SPAN_WARNING("You manage to cast the lecture at a cost. Your Hearthcore takes its toll in blood..."))
				H.vessel.remove_reagent("blood",blood_cost)
		return success

	fail("You should be near the bonfire metrics screen.", H, C)
	return FALSE

//There we perform any manipulations with the Bonfire
//Since console finder code is similar for both rituals
/datum/lecture/hearthcore/machines/bonfire/proc/perform_command(datum/multistructure/bonfire/bonfire)
	return

///////////////>bonfire pump solution ritual<//////////////////

/datum/lecture/hearthcore/machines/bonfire/solution
	name = "Solution Pumping"
	phrase = "Oxidate Lecture: Solution Pumping."
	desc = "This lecture pumps scorch solution in or out of the Bonfire. Requires you to be near its console."

/datum/lecture/hearthcore/machines/bonfire/solution/perform_command(datum/multistructure/bonfire/bonfire)
	if(!bonfire.chamber_closed)
		return FALSE
	bonfire.pump_solution()
	var/obj/machinery/multistructure/bonfire_part/console/bonfire_console = bonfire.metrics_screen
	bonfire_console.ping()
	bonfire_console.visible_message("The Bonfire produces an echoing click. The platforms pumps start buzzing.")
	return TRUE



///////////////>bonfire chamber opening song<////////////////

/datum/lecture/hearthcore/machines/bonfire/chamber_doors
	name = "Chamber Word"
	phrase = "Oxidate Lecture: Chamber Word."
	desc = "This lecture opens or closes the Bonfire's chamber. You should stay nearby its screen."
/datum/lecture/hearthcore/machines/bonfire/chamber_doors/perform_command(datum/multistructure/bonfire/bonfire)
	if(bonfire.chamber_solution)
		return FALSE
	bonfire.toggle_platform_door()
	var/obj/machinery/multistructure/bonfire_part/console/bonfire_console = bonfire.metrics_screen
	bonfire_console.ping()
	bonfire_console.visible_message("You hear a loud BANG. Then a pause... The chamber's door mechanism moves its position with a quiet grace.")
