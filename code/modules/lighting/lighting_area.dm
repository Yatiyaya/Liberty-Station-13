/area
	luminosity           = TRUE
	var/dynamic_lighting = TRUE

/area/New()
	. = ..()

	if(!dynamic_lighting && !GLOB.day_or_night["is_night"])
		if(!force_full_lighting)
			dynamic_lighting = TRUE

	if(dynamic_lighting)
		luminosity = FALSE