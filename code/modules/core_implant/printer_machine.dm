/*
===============================================================================================================================================
CAPSA Implant Printer

A machine used by CAPSA to make various types of implants. This machine, just like the cloning vats, is intended to be for CAPSA production only.
This machine allows implants that are either Liberty Group brand, CAPSA brand, or reverse-engineered tech to be produced here.

These implants include the following types:
- Death Alarms, alerts medical and security channels to dead people(s). If none of said jobs are on, it will alert general channels. These are incompatible with other implants.
- Conciousness Backups, allows a person to be cloned via cloning vat found in CAPSA. Normally a timer of 20 minutes exists for those who need to be defibbed. This bypasses the timer, allowing cloning at any time. post-defib experation.
- Psionic Flesh, allows a person to become psionic. Needs to be changed to an organ-type instead of implant at some point.

PLANNED FEATURES
- Cybernetics Handlers, allows the user to be modified with advanced cybernetics; using nanites to aid in control of said enhancements.
===============================================================================================================================================
*/

#define LOAD "load"
#define WORK "work"
#define DONE "done"

/obj/machinery/neotheology/implantprinter
	name = "Implant Fabricator"
	desc = "This unique piece of technology can be fed biomatter, plasteel, silver, and gold in order to print various implants. \
			All implants produced by this machine are licenced or produced by CAPSA or Liberty Group. \
			Due to this machines complexity, only technitians in CAPSA and PIRS are trained in its usage."
	icon = 'icons/obj/neotheology_machinery.dmi'
	icon_state = "cruciforge"

	density = TRUE
	anchored = TRUE
	layer = 2.8

	var/power_cost = 250

	var/working = FALSE
	var/start_working
	var/work_time = 30 SECONDS
	var/storage_capacity = 50
	var/list/stored_material = list()
	var/list/needed_material = list(MATERIAL_BIOMATTER = 10, MATERIAL_PLASTEEL = 5, MATERIAL_GOLD = 2, MTERIAL_SILVER = 3)
	var/spawn_type = /obj/item/implant/conback

	// A vis_contents hack for materials loading animation.
	var/tmp/obj/effect/flick_light_overlay/image_load

/obj/machinery/neotheology/implantprinter/Initialize()
	. = ..()

	image_load = new(src)

	for(var/_material in needed_material)
		stored_material[_material] = rand(1, 10)

/obj/machinery/neotheology/implantprinter/examine(user)
	. = ..()

	var/list/matter_count_need = list()
	for(var/_material in needed_material)
		matter_count_need += "[needed_material[_material]] [_material]"

	var/list/matter_count = list()
	for(var/_material in stored_material)
		matter_count += " [stored_material[_material]] [_material]"

	to_chat(user, SPAN_NOTICE("Materials required: [english_list(matter_count_need)].\nIt contains: [english_list(matter_count)]."))

/obj/machinery/neotheology/implantprinter/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/stack))
		eat(user, I)
		return
	. = ..()

/obj/machinery/neotheology/implantprinter/proc/produce()
	for(var/_material in needed_material)
		stored_material[_material] -= needed_material[_material]

	use_power(power_cost)
	working = TRUE
	start_working = world.time
	flick_anim(WORK)
	START_PROCESSING(SSmachines, src)

/obj/machinery/neotheology/implantprinter/Process()
	if(!working)
		STOP_PROCESSING(SSmachines, src)
		return

	if(world.time >= (start_working + work_time))
		flick_anim(DONE)
		new spawn_type(get_turf(src))
		working = FALSE
		STOP_PROCESSING(SSmachines, src)

/obj/machinery/neotheology/implantprinter/proc/eat(mob/living/user, obj/item/eating)

	if(!eating && istype(user))
		eating = user.get_active_hand()

	if(!istype(eating))
		return FALSE

	if(stat)
		return FALSE

	if(!Adjacent(user) && !Adjacent(eating))
		return FALSE

	if(is_robot_module(eating))
		return FALSE

	if(!istype(eating, /obj/item/stack/material))
		to_chat(user, SPAN_WARNING("[src] does not support this type of recycling."))
		return FALSE

	if(!length(eating.get_matter()))
		to_chat(user, SPAN_WARNING("\The [eating] does not contain significant amounts of useful materials and cannot be accepted."))
		return FALSE

	var/total_used = 0     // Amount of material used.
	var/obj/item/stack/material/stack = eating
	var/material = stack.default_type

	if(!(material in needed_material))
		to_chat(user, SPAN_WARNING("[src] does not support [material] recycle."))
		return FALSE

	if(stored_material[material] >= storage_capacity)
		to_chat(user, SPAN_WARNING("The [src] are full of [material]."))
		return FALSE

	if(stored_material[material] + stack.amount > storage_capacity)
		total_used = storage_capacity - stored_material[material]

	else
		total_used = stack.amount


	stored_material[material] += total_used

	if(!stack.use(total_used))
		qdel(stack)	// Protects against weirdness

	flick_anim(LOAD) // Play insertion animation.

	to_chat(user, SPAN_NOTICE("You add [total_used] of [stack]\s to \the [src]."))


/obj/machinery/neotheology/implantprinter/proc/flick_anim(var/animation)

	if(animation == WORK)
		flick("[initial(icon_state)]_start", src)
		icon_state = "[initial(icon_state)]_work"
		update_icon()

	if(animation == LOAD)
		flick("[initial(icon_state)]_load", image_load)
		return

	if(animation == DONE)
		flick("[initial(icon_state)]_finish", src)
		icon_state = "[initial(icon_state)]"
		update_icon()

#undef WORK
#undef LOAD
#undef DONE
