GLOBAL_LIST_INIT(day_or_night, list(
	"is_night"						= FALSE))

/datum/controller/subsystem/ticker/proc/make_all_night()
	GLOB.day_or_night["is_night"] = TRUE

/area
	var/force_full_lighting = FALSE
