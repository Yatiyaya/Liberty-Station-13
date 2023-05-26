//Large rooms should be 21x21. Never do multiple Z levels.
//Make sure its saved TGM style. And it should have precursor area.

/*
/datum/map_template/precursor_template/large/example <---- This has to be unique. Its the unique identifier in code.
	name = "example" <--- Dosn't actually matter but its viewable in view variable.
	desc = "Example room for generation and testing." <--- Dosn't actually matter but its viewable in view variable.
	eidth = 21 <--- failsafe check to make sure the tileset is loading the right size.
	height = 21 <--- failsafe check to make sure the tileset is loading the right size.
	mappath = 'maps/submaps/precursor_rooms/large/example.dmm' <---- This has to be 1 for 1 exactly the path of the map your loading.
*/

/datum/map_template/precursor_template/large/flooded_core
	name = "flooded core"
	desc = "Large flooded room."
	width = 21
	height = 21
	mappath = 'maps/submaps/precursor_rooms/large/flooded_core.dmm'

/datum/map_template/precursor_template/large/overgrown_library
	name = "overgrown library"
	desc = "Large library filled with plants."
	width = 21
	height = 21
	mappath = 'maps/submaps/precursor_rooms/large/overgrown_library.dmm'

/datum/map_template/precursor_template/large/kitchen
	name = "large kitchen"
	desc = "Large kitchen with crab legs included."
	width = 21
	height = 21
	mappath = 'maps/submaps/precursor_rooms/large/kitchen.dmm'

/datum/map_template/precursor_template/large/rusty_labs
	name = "large rundown lab"
	desc = "Large rusty laboratory."
	width = 21
	height = 21
	mappath = 'maps/submaps/precursor_rooms/large/rusty_labs.dmm'

/datum/map_template/precursor_template/large/facility_rooms
	name = "large facility with rooms"
	desc = "Large scientific rooms."
	width = 21
	height = 21
	mappath = 'maps/submaps/precursor_rooms/large/facility_rooms.dmm'

/datum/map_template/precursor_template/large/hedge_maze
	name = "large hedge maze"
	desc = "Large area with a hedge inside."
	width = 21
	height = 21
	mappath = 'maps/submaps/precursor_rooms/large/hedge_maze.dmm'

/datum/map_template/precursor_template/large/holdout_fail
	name = "large holdout area"
	desc = "Large holdout room that was over run."
	width = 21
	height = 21
	mappath = 'maps/submaps/precursor_rooms/large/holdout_fail.dmm'

/datum/map_template/precursor_template/large/shuttles
	name = "large area with two shuttles"
	desc = "Large destroyed shuttles."
	width = 21
	height = 21
	mappath = 'maps/submaps/precursor_rooms/large/shuttles.dmm'

/datum/map_template/precursor_template/large/flooded_comms
	name = "large flooded t-coms"
	desc = "Large flooded room with comms devices."
	width = 21
	height = 21
	mappath = 'maps/submaps/precursor_rooms/large/flooded_comms.dmm'

/datum/map_template/precursor_template/large/artic_vault
	name = "large snow covered vault"
	desc = "Large room with frozen goodies."
	width = 21
	height = 21
	mappath = 'maps/submaps/precursor_rooms/large/artic_vault.dmm'

/datum/map_template/precursor_template/large/anomaly_study_chambers
	name = "large study chambers"
	desc = "Large room for studying xenoarch artifacts."
	width = 21
	height = 21
	mappath = 'maps/submaps/precursor_rooms/large/anomaly_study_chambers.dmm'
