//Reworked version of deepmaints generation file thats feed into the JP generator to make dungeons.
//Meant to be able to be run over again to generate additional dungeons.

var/global/list/precursor_normal_room_templates = list()
var/global/list/precursor_end_room_templates = list()
var/global/list/precursor_large_room_templates = list()
var/global/list/starter_precursor_room_templates = list()

/proc/populatePrecursorMapLists()
	if(starter_precursor_room_templates.len || precursor_normal_room_templates.len || precursor_end_room_templates.len || precursor_large_room_templates.len)
		return
	for(var/item in subtypesof(/datum/map_template/precursor_template/normal))
		var/datum/map_template/precursor_template/submap = item
		var/datum/map_template/precursor_template/S = new submap()
		precursor_normal_room_templates += S

	for(var/item in subtypesof(/datum/map_template/precursor_template/starter))
		var/datum/map_template/precursor_template/submap = item
		var/datum/map_template/precursor_template/S = new submap()
		starter_precursor_room_templates += S

	for(var/item in subtypesof(/datum/map_template/precursor_template/large))
		var/datum/map_template/precursor_template/submap = item
		var/datum/map_template/precursor_template/S = new submap()
		precursor_large_room_templates += S

	for(var/item in subtypesof(/datum/map_template/precursor_template/end))
		var/datum/map_template/precursor_template/submap = item
		var/datum/map_template/precursor_template/S = new submap()
		precursor_end_room_templates += S

/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/normal
	name = "precursor room"

/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/normal/New()
	..()
	my_map = pick(precursor_normal_room_templates)

/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/large
	name = "large precursor room"

/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/large/New()
	..()
	my_map = pick(precursor_large_room_templates)

/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/end
	name = "precursor end room"

/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/end/New()
	..()
	my_map = pick(precursor_end_room_templates)

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

/obj/procedural/dungenerator/precursor/proc/make_me_dungeon()
	spawn()
		//testing_variable(start, REALTIMEOFDAY)
		var/obj/procedural/jp_DungeonGenerator/precursor/generate = new /obj/procedural/jp_DungeonGenerator/precursor(src)
		testing("Beginning procedural generation of [name] -  Z-level [z].")
		generate.name = name
		generate.setArea(locate(145, 26, z), locate(171, 45, z)) //bottom right corner
		generate.setWallType(/turf/simulated/wall)
		generate.setFloorType(/turf/simulated/floor/rock/manmade/ruin2)
		generate.setAllowedRooms(list(/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/starter))
		generate.setNumRooms(1) //creates the single starter room they enter other rooms from.
		generate.setRoomMinSize(5)
		generate.setRoomMaxSize(5)
		generate.setExtraPaths(1)
		generate.setMinPathLength(1)
		generate.setMaxPathLength(1)
		generate.setMinLongPathLength(1)
		generate.setLongPathChance(1)
		generate.setPathEndChance(80)
		generate.setPathWidth(1)
		generate.generate()

		sleep(90)

		generate.setArea(locate(05, 140, z), locate(30, 170, z)) //upper left for the final room. 21 by 21 space for it. just short of the impassible.
		generate.setAllowedRooms(list(/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/end))
		generate.setNumRooms(1) // just the one
		generate.setRoomMinSize(10)
		generate.setRoomMaxSize(10)
		generate.setExtraPaths(0)
		generate.setMinPathLength(0)
		generate.setMaxPathLength(0)
		generate.setMinLongPathLength(0)
		generate.setLongPathChance(0)
		generate.setPathEndChance(0)
		generate.setPathWidth(0)
		generate.setUsePreexistingRegions(TRUE)
		generate.setDoAccurateRoomPlacementCheck(TRUE)
		generate.generate()

		sleep(90)

		generate.setArea(locate(05, 26, z), locate(171, 171, z)) //actual dungeon area.
		generate.setAllowedRooms(list(/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/large))
		generate.setNumRooms(6) // 6 main rooms that we don't duplicate. Need miniumum of 6 before I can finish the pull code.
		generate.setRoomMinSize(10)
		generate.setRoomMaxSize(10)
		generate.setExtraPaths(0)
		generate.setMinPathLength(0)
		generate.setMaxPathLength(0)
		generate.setMinLongPathLength(0)
		generate.setLongPathChance(0)
		generate.setPathEndChance(0)
		generate.setPathWidth(0)
		generate.setUsePreexistingRegions(TRUE)
		generate.setDoAccurateRoomPlacementCheck(TRUE)
		generate.generate()

		sleep(90)

		generate.setArea(locate(05, 26, z), locate(171, 171, z)) //actual dungeon area.
		generate.setAllowedRooms(list(/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/normal))
		generate.setNumRooms(30) // whole buncha rooms!
		generate.setRoomMinSize(5)
		generate.setRoomMaxSize(5)
		generate.setExtraPaths(3)
		generate.setMinPathLength(1)
		generate.setMaxPathLength(65)
		generate.setMinLongPathLength(1)
		generate.setLongPathChance(10)
		generate.setPathEndChance(80)
		generate.setPathWidth(2)
		generate.setUsePreexistingRegions(TRUE)
		generate.setDoAccurateRoomPlacementCheck(TRUE)
		generate.generate()

		//testing("Finished procedural generation of [name]. [generate.errString(generate.out_error)] -  Z-level [z], in [(REALTIMEOFDAY - start) / 10] seconds.")

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
	src.make_me_dungeon()
	qdel()
#endif
