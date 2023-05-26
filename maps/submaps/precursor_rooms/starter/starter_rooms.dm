//Starter rooms should be 11x11. Never do multiple Z levels.
//Make sure its saved TGM style. And it should have precursor area.
//They HAVE to have a precursor jump pads. If you do not have a jump pad you will not connect the portals.

/*
/datum/map_template/precursor_template/starter/example <---- This has to be unique. Its the unique identifier in code.
	name = "example" <--- Dosn't actually matter but its viewable in view variable.
	desc = "Example room for generation and testing." <--- Dosn't actually matter but its viewable in view variable.
	mappath = 'maps/submaps/precursor_rooms/starter/example.dmm' <---- This has to be 1 for 1 exactly the path of the map your loading.
*/

/datum/map_template/precursor_template/starter/starter1
	name = "pruin starter1"
	desc = "Used in precursor generation"
	mappath = 'maps/submaps/precursor_rooms/starter/starter1.dmm'

/datum/map_template/precursor_template/starter/starter2
	name = "pruin starter2"
	desc = "Used in precursor generation"
	mappath = 'maps/submaps/precursor_rooms/starter/starter2.dmm'

/datum/map_template/precursor_template/starter/starter3
	name = "pruin starter3"
	desc = "Used in precursor generation"
	mappath = 'maps/submaps/precursor_rooms/starter/starter3.dmm'
