//Reworked version of deepmaints generation file thats feed into the JP generator to make dungeons.
//Meant to be able to be run over again to generate additional dungeons.

var/global/list/precursor_room_templates = list()

var/global/list/starter_precursor_room_templates = list()

/proc/populatePrecursorMapLists()
	if(starter_precursor_room_templates.len || precursor_room_templates.len)
		return
	for(var/item in subtypesof(/datum/map_template/precursor_template/room))
		var/datum/map_template/precursor_template/submap = item
		var/datum/map_template/precursor_template/S = new submap()
		precursor_room_templates += S

	for(var/item in subtypesof(/datum/map_template/precursor_template/starter))
		var/datum/map_template/precursor_template/submap = item
		var/datum/map_template/precursor_template/S = new submap()
		starter_precursor_room_templates += S

/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor
	name = "precursor room"

/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/New()
	..()
	my_map = pick(precursor_room_templates)

/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/starter
	name = "precursor starter room"

/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/starter/New()
	..()
	my_map = pick(starter_precursor_room_templates)

/obj/procedural/jp_DungeonGenerator/precursor
	name = "Precursor Procedural Generator"
	regen_specific = TRUE
	regen_light = /obj/machinery/light/small/autoattach


/obj/procedural/dungenerator/precursor
	name = "Precursor Gen"

//DO NOT REMOVE ELSE, it becomes unreachable
#if defined(UNIT_TESTS) || defined(SPACEMAN_DMM)
/obj/procedural/dungenerator/precursor/New()
	log_test("Skipping precursor generation for unit tests")
	return
#else
/obj/procedural/dungenerator/precursor/New() //just a object placed on the map to generate it the first time.
	while(1)
		if(Master.current_runlevel)
			populatePrecursorMapLists() //It's not a hook because mapping subsystem has to intialize first
			break
		else
			sleep(150)
	spawn()
		//testing_variable(start, REALTIMEOFDAY)
		var/obj/procedural/jp_DungeonGenerator/precursor/generate = new /obj/procedural/jp_DungeonGenerator/precursor(src)
		testing("Beginning procedural generation of [name] -  Z-level [z].")
		generate.name = name
		generate.setArea(locate(60, 60, z), locate(100, 100, z)) //closer to the center
		generate.setWallType(/turf/simulated/wall)
		generate.setFloorType(/turf/simulated/floor/asteroid)
		generate.setAllowedRooms(list(/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/starter))
		generate.setNumRooms(1) //creates the single starter room they enter other rooms from.
		generate.setRoomMinSize(5)
		generate.setRoomMaxSize(5)
		generate.setExtraPaths(3)
		generate.setMinPathLength(1)
		generate.setMaxPathLength(65)
		generate.setMinLongPathLength(5)
		generate.setLongPathChance(10)
		generate.setPathEndChance(80)
		generate.setPathWidth(3)
		generate.generate()

		sleep(90)

		generate.setArea(locate(10, 30, z), locate(165, 165, z)) //not up against the walls. And only in the area we want to generate in.
		generate.setAllowedRooms(list(/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor))
		generate.setNumRooms(30) // 30 or so smaller rooms
		generate.setRoomMinSize(5)
		generate.setRoomMaxSize(5)
		generate.setExtraPaths(3)
		generate.setMinPathLength(1)
		generate.setMaxPathLength(65)
		generate.setMinLongPathLength(5)
		generate.setLongPathChance(10)
		generate.setPathEndChance(80)
		generate.setPathWidth(3)
		generate.setUsePreexistingRegions(TRUE)
		generate.setDoAccurateRoomPlacementCheck(TRUE)
		generate.generate()
		testing("Finished procedural generation of [name]. [generate.errString(generate.out_error)] -  Z-level [z], in [(REALTIMEOFDAY - start) / 10] seconds.")
#endif
