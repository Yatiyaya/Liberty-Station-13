//End rooms should be 21 x 21. Never do multiple Z levels.
//Make sure its saved TGM style. And it should have precursor area.
//Dont forget your precursor scan cube in each map so they can reset the dungeon for completing the last room.

/*
/datum/map_template/precursor_template/end/example <---- This has to be unique. Its the unique identifier in code.
	name = "example" <--- Dosn't actually matter but its viewable in view variable.
	desc = "Example room for generation and testing." <--- Dosn't actually matter but its viewable in view variable.
	eidth = 21 <--- failsafe check to make sure the tileset is loading the right size.
	height = 21 <--- failsafe check to make sure the tileset is loading the right size.
	mappath = 'maps/submaps/precursor_rooms/end/example.dmm' <---- This has to be 1 for 1 exactly the path of the map your loading.
*/

/datum/map_template/precursor_template/end/pruin_end1
	name = "pruin end1"
	desc = "The final room in a precursor dungeon."
	width = 21
	height = 21
	mappath = 'maps/submaps/precursor_rooms/end/pruin_end1.dmm'
