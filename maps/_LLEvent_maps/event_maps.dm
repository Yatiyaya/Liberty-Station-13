//#include "map/_event_map_engi.dmm"

/obj/map_data/event_map_engi
	name = "rebuildable outpost map_data"
	is_player_level = TRUE
	is_contact_level = TRUE
	is_accessable_level = TRUE
	height = 2

/obj/effect/shuttle_landmark/engi_outpost
	name = "Project Landing zone"
	icon_state = "shuttle-green"
	landmark_tag = "nav_engi_outpost"
	base_area = /area/event_engi
	base_turf = /turf/simulated/floor/asteroid

/area/event_engi
	dynamic_lighting = FALSE
	name = "Outpost Outdoors"
	icon_state = "hammerblue"

/area/event_engi/building_main
	dynamic_lighting = TRUE
	name = "Outpost Main"
	icon_state = "hammerblue"

/area/event_engi/building_upper
	dynamic_lighting = TRUE
	name = "Outpost Upper Area"
	icon_state = "hammerblue"

/area/event_engi/building_medical
	dynamic_lighting = TRUE
	name = "Outpost Upper Medical"
	icon_state = "hammerblue"

/area/event_engi/rooms
	dynamic_lighting = TRUE
	name = "Outpost Dormitory"
	icon_state = "hammerblue"

/area/event_engi/fud
	dynamic_lighting = TRUE
	name = "Outpost Kitchen"
	icon_state = "hammerblue"

/area/event_engi/bathroom
	dynamic_lighting = TRUE
	name = "Outpost Restrooms"
	icon_state = "hammerblue"

/area/event_engi/supply
	name = "Outpost Supply"
	icon_state = "hammerblue"
	requires_power = FALSE

/area/event_engi/trash
	name = "Outpost Trash Area"
	icon_state = "hammerblue"
	requires_power = FALSE

//////////////////////////////////////////////////////////

//#include "map/_event_map_bridge.dmm"


/obj/map_data/event_map_bridge
	name = "event bridge map"
	is_player_level = TRUE
	is_contact_level = TRUE
	is_accessable_level = TRUE
	height = 1

/obj/effect/shuttle_landmark/event_map_bridge
	name = "Project Landing zone"
	icon_state = "shuttle-green"
	landmark_tag = "nav_brige_outpost"
	base_area = /area/event_bridge
	base_turf = /turf/simulated/floor/asteroid

/area/event_bridge
	dynamic_lighting = FALSE
	name = "Roadblocked Bridge"
	icon_state = "hammerblue"

/area/event_bridge/merc_outpost
	name = "Hostile Outpost"
	icon_state = "hammerblue"

/area/event_bridge/misc
	name = "Hostile Wildlands"
	icon_state = "hammerblue"

///////////////////////////////////////////////////////////

#include "map/_event_games.dmm"

/obj/map_data/event_map_games
	name = "games map_data"
	is_player_level = TRUE
	is_contact_level = TRUE
	is_accessable_level = TRUE
	height = 2

/obj/effect/shuttle_landmark/games_outpost
	name = "Games Landing zone"
	icon_state = "shuttle-green"
	landmark_tag = "nav_games"
	base_area = /area/event_games/outside
	base_turf = /turf/simulated/floor/tiled/dark/cargo

/area/event_games
	dynamic_lighting = TRUE
	name = "Away Area"
	icon_state = "hammerblue"

/area/event_games/outside
	dynamic_lighting = FALSE
	name = "Outside Area"
	icon_state = "hammerblue"

/area/event_games/inside
	name = "Inside Area"
	icon_state = "hammerblue"

/area/event_games/underground
	dynamic_lighting = FALSE
	name = "Unground Area"
	icon_state = "hammerblue"