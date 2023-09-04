//Bioreactor port
//Most lazy part of whole machine, cause it do nothing, except it's power drain
//Used by biomatter tank


/obj/machinery/multistructure/bonfire_part/port
	name = "scorch slag tank port"
	desc = "The port to which the scorch slag tank is connected to a canister beneath it."
	icon_state = "port"
	layer = LOW_OBJ_LAYER
	density = FALSE
	idle_power_usage = 50 // It's just a port let's not get out of hand here

/obj/machinery/multistructure/bonfire_part/port/examine(mob/user)
	..()
	to_chat(user, SPAN_NOTICE("The scorch canister is meant to be placed on top of this port."))
