//Bioreactor loader
//This part will take little objects (items) and put it into the chamber
//Useful, if you work with conveyor or just want to put things in process


/obj/machinery/multistructure/bonfire_part/loader
	name = "bonfire input"
	desc = "A sorting machine that takes all kinds of filtered objects from its left side, and process them inside the platforms to be melted into scorch."
	icon_state = "loader"
	idle_power_usage = 120
	active_power_usage = 300
	pixel_x = -8
	layer = LOW_OBJ_LAYER
	var/dir_input = WEST
	var/dir_output = NORTH


/obj/machinery/multistructure/bonfire_part/loader/Initialize()
	. = ..()
	set_light(1, 1, COLOR_LIGHTING_BLUE_MACHINERY)


/obj/machinery/multistructure/bonfire_part/loader/Destroy()
	if(contents.len)
		for(var/obj/object_inside_me in contents)
			object_inside_me.forceMove(get_turf(src))
	return ..()


/obj/machinery/multistructure/bonfire_part/loader/Process()
	if(!MS || !MS_bioreactor.is_operational() || !MS_bioreactor.chamber_solution)
		use_power(1)
		return
	use_power(2)
	if(contents.len)
		for(var/obj/object in contents)
			var/obj/machinery/multistructure/bonfire_part/platform/empty_platform = MS_bioreactor.get_unoccupied_platform()
			if(empty_platform)
				object.forceMove(get_step(src, dir_output))
	else
		grab()


/obj/machinery/multistructure/bonfire_part/loader/proc/grab()
	var/obj/item/target = locate() in get_step(src, dir_input)
	if(target && !target.anchored && contents.len <= 10)
		target.forceMove(loc)
		spawn(1)
			target.forceMove(src)
			flick("loader_take", src)
