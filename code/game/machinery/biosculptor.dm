
/obj/machinery/biosculptor
	name = "biosculptor" //biomatter sheet generation machine due to church being nuked
	desc = "A machine that takes in slabs of meat and grinds them into a paste to melt together. After an intensely odorous chemical process, the raw flesh is melded into thick sheets of bio-material for use in machinery and fabrication."
	description_info = "Leave slabs of meat on the north turf and activate the machine to use. Component upgrades have no effect."
	icon = 'icons/obj/machines/biosculptor.dmi'
	icon_state = "biosculptor"
	density = 1
	anchored = 1
	circuit = /obj/item/circuitboard/biosculptor
	use_power = IDLE_POWER_USE
	idle_power_usage = 15
	active_power_usage = 100
	var/input_side = NORTH //inputs come from the turf directly north
	var/progress = 0 //how far along we are when eating meat
	var/eating = FALSE //are we eating meat
	var/active = FALSE //are we running
	var/eating_speed = 25 //how many Process() ticks until one meat is processed
	var/output_amount = 10 //how many sheets per meat?
	var/last_time_used = 0 //used to not let the user toggle the machine super fast

/obj/machinery/biosculptor/Process()
	if(stat & BROKEN || stat & NOPOWER)
		progress = 0
		return
	if(active)
		if(eating)
			use_power(ACTIVE_POWER_USE)
			progress += eating_speed
			if(progress >= 100)
				output_sheets()
				grab_meat()
		else
			grab_meat()

/obj/machinery/biosculptor/attack_hand(mob/user)
	if(world.time >= last_time_used + 2 SECONDS)
		last_time_used = world.time
		active = !active
		to_chat(user, SPAN_NOTICE("You [active ? "turn [src] on" : "turn [src] off"]."))
		playsound(src, 'sound/machines/click.ogg', 80, 1)


/obj/machinery/biosculptor/proc/grab_meat()
	if(!locate(/obj/item/reagent_containers/food/snacks/meat) in get_step(src, input_side)) //if we find no meat, cancel
		state("No suitable material identified on input side.")
		ping()
		active = FALSE
		eating = FALSE

	else //meat was located
		for(var/obj/item/reagent_containers/food/snacks/meat/target_item in get_step(src, input_side)) //delete that meat, turn on the "I am Eating" var, then return to not grab more than one
			qdel(target_item)
			eating = TRUE
			return


/obj/machinery/biosculptor/proc/output_sheets()
	var/obj/item/stack/material/biomatter/current_stack
	//if there any stacks here, let's check them
	if(locate(/obj/item/stack/material/biomatter) in loc)
		for(var/obj/item/stack/material/biomatter/stack_on_my_loc in loc)
			//if this isn't full, we use that stack(current)
			if(stack_on_my_loc.amount < stack_on_my_loc.max_amount)
				current_stack = stack_on_my_loc
				break

	if(current_stack)
		current_stack.add(output_amount)
		if(current_stack.amount == current_stack.max_amount)
			state("Stack is ready.")
			ping()
	else
		current_stack = new(loc,output_amount)

