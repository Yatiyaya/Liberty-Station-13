/datum/craft_recipe/pirs
	category = "PIRS"
	time = 100
	related_stats = list(STAT_COG)
	requiredPerk = PERK_SCIENCE // Todo, make a Science_Armorer perk or something so the CAPSA Overseers aren't omnicrafters


//Shields and Armor Mods | Gonna be expanded on later
/datum/craft_recipe/pirs/melee
	name = "melee plating"
	result = /obj/item/tool_upgrade/armor/melee
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 30, MATERIAL_STEEL, "time" = 60),
		list(QUALITY_WELDING, 35, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 180),
		list(QUALITY_HAMMERING, 30, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 35, "time" = 90),
		list(/obj/item/tool_upgrade/reinforcement/rubbermesh, 1),
		list(QUALITY_BOLT_TURNING, 30, "time" = 120),
		list(QUALITY_SAWING, 30, "time" = 60)
	)

/datum/craft_recipe/pirs/bullet
	name = "ballistic plating"
	result = /obj/item/tool_upgrade/armor/bullet
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL, "time" = 20),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTIC , "time" = 20),
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL, "time" = 20),
		list(QUALITY_WELDING, 35, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 180),
		list(QUALITY_HAMMERING, 30, "time" = 180),
		list(/obj/item/tool_upgrade/reinforcement/rubbermesh, 1),
		list(QUALITY_SCREW_DRIVING, 35, "time" = 90),
		list(QUALITY_BOLT_TURNING, 30, "time" = 120),
		list(QUALITY_SAWING, 30, "time" = 60)
	)

/datum/craft_recipe/pirs/energy
	name = "energy plating"
	result = /obj/item/tool_upgrade/armor/energy
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_PLATINUM, "time" = 30),
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTIC , "time" = 30),
		list(QUALITY_WELDING, 35, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 180),
		list(QUALITY_HAMMERING, 30, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 35, "time" = 90),
		list(/obj/item/tool_upgrade/reinforcement/rubbermesh, 1),
		list(QUALITY_BOLT_TURNING, 30, "time" = 120),
		list(QUALITY_SAWING, 30, "time" = 60)
	)

/datum/craft_recipe/pirs/bomb
	name = "bomb proofing"
	result = /obj/item/tool_upgrade/armor/bomb
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL, "time" = 60),
		list(CRAFT_MATERIAL, 30, MATERIAL_STEEL, "time" = 60),
		list(QUALITY_WELDING, 35, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 180),
		list(QUALITY_HAMMERING, 30, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 35, "time" = 90),
		list(/obj/item/tool_upgrade/reinforcement/rubbermesh, 1),
		list(QUALITY_BOLT_TURNING, 30, "time" = 120),
		list(QUALITY_SAWING, 30, "time" = 60)
	)

/datum/craft_recipe/pirs/bastion
	name = "Bastion Shield"
	result = /obj/item/shield/riot/bastion
	steps = list(
	list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL, "time" = 30),
	list(QUALITY_SAWING, 30, "time" = 60),
	list(CRAFT_MATERIAL, 2, MATERIAL_STEEL, "time" = 30),
	list(QUALITY_WELDING, 35, "time"= 60),
	list(/obj/item/shield/riot, 1, "time" = 30),
	list(QUALITY_HAMMERING, 45, "time" = 40),
	list(CRAFT_MATERIAL, 1, MATERIAL_PLASMAGLASS, "time" = 30)
	)
//Gun Mods
/datum/craft_recipe/pirs/weintraub
	name = "\"Hurricane\" full auto kit"
	result = /obj/item/gun_upgrade/mechanism/weintraub
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 35, "time" = 40),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 25, "time" = 90)
	)

/datum/craft_recipe/pirs/overshooter
	name = "\"Overshooter\" internal magazine kit"
	result = /obj/item/gun_upgrade/mechanism/overshooter
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 35, "time" = 40),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 25, "time" = 90)
	)

/datum/craft_recipe/pirs/dangerzone
	name = "\"Danger Zone\" Trigger"
	result = /obj/item/gun_upgrade/trigger/dangerzone
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 35, "time" = 40),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_BOLT_TURNING, 25, "time" = 90)
	)

/datum/craft_recipe/pirs/forged
	name = "Reinforced Barrel"
	result = /obj/item/gun_upgrade/barrel/forged
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 35, "time" = 40),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_BOLT_TURNING, 25, "time" = 90)
	)

/datum/craft_recipe/pirs/heavy_barrel
	name = "Heavy barrel"
	result = /obj/item/gun_upgrade/barrel/bore
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 35, "time" = 40),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_BOLT_TURNING, 25, "time" = 90),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 35, "time" = 40),
		list(QUALITY_DRILLING, 60, "time" = 90),
		list(/obj/item/tool_upgrade/refinement/ported_barrel, 1, "time" = 30),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_BOLT_TURNING, 25, "time" = 90)
	)

/datum/craft_recipe/pirs/silencer
	name = "Silencer"
	result = /obj/item/gun_upgrade/muzzle/silencer
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 35, "time" = 40),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_CUTTING, 25, "time" = 90)
	)

/datum/craft_recipe/pirs/watchman
	name = "PIRS \"All Seeing\" scope"
	result = /obj/item/gun_upgrade/scope/watchman
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 35, "time" = 40),
		list(CRAFT_MATERIAL, 2, MATERIAL_GLASS, "time" = 30),
		list(QUALITY_CUTTING, 25, "time" = 90)
	)

//STOCK PARTS | PIRS and Union can both craft T3 and T4, but PIRS gets the bulk T4 craft.

/datum/craft_recipe/pirs/guild_bin
	name = "Hand Giga Matter Bin"
	result = /obj/item/stock_parts/matter_bin/handmade
	steps = list(
		list(/obj/item/stock_parts/matter_bin/super, 1),
		list(QUALITY_SCREW_DRIVING, 10, 70),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTEEL), //Quite useless in most cases so were cheaper
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASMAGLASS),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 35),
		list(QUALITY_HAMMERING, 30),
		list(QUALITY_SAWING, 30)
	)

/datum/craft_recipe/pirs/guild_manip
	name = "Perfected Flexi-Pico Manipulator"
	result = /obj/item/stock_parts/manipulator/handmade
	steps = list(
		list(/obj/item/stock_parts/manipulator/pico, 1),
		list(QUALITY_SCREW_DRIVING, 35, 70),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTEEL), //Are main thing were exspensive do to being the main crafted item
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 35),
		list(/obj/item/stack/cable_coil, 10),
		list(QUALITY_HAMMERING, 30),
		list(QUALITY_SAWING, 30)
	)

/datum/craft_recipe/pirs/guild_laser
	name = "Handmade Perfected Ultra High Power Micro-Lasers"
	result = /obj/item/stock_parts/micro_laser/handmade
	steps = list(
		list(/obj/item/stock_parts/micro_laser/ultra, 1),
		list(QUALITY_SCREW_DRIVING, 35, 70),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASMAGLASS),
		list(CRAFT_MATERIAL, 1, MATERIAL_RGLASS),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 35),
		list(QUALITY_SAWING, 30)
	)

/datum/craft_recipe/pirs/guild_scanner
	name = "Overtuned Scanning Module"
	result = /obj/item/stock_parts/scanning_module/handmade
	steps = list(
		list(/obj/item/stock_parts/scanning_module/phasic, 1),
		list(QUALITY_SCREW_DRIVING, 35, 70),
		list(CRAFT_MATERIAL, 1, MATERIAL_GOLD),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 35),
		list(CRAFT_MATERIAL, 1, MATERIAL_SILVER),
		list(QUALITY_SAWING, 30)
	)

/datum/craft_recipe/pirs/guild_capacitor
	name = "Crafted Experimental Capacitor"
	result = /obj/item/stock_parts/capacitor/handmade
	steps = list(
		list(/obj/item/stock_parts/capacitor/super, 1),
		list(QUALITY_SCREW_DRIVING, 35, 70),
		list(CRAFT_MATERIAL, 1, MATERIAL_GOLD),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 35),
		list(CRAFT_MATERIAL, 1, MATERIAL_SILVER),
		list(QUALITY_SAWING, 30)
	)

/datum/craft_recipe/pirs/guild_bin_box
	name = "Box of Giga Matter Bins"
	result = /obj/item/storage/box/guild_bin
	steps = list(
		list(/obj/item/stock_parts/matter_bin/super, 4),
		list(QUALITY_SCREW_DRIVING, 10, 70),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTEEL),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASMAGLASS),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 35),
		list(QUALITY_HAMMERING, 40),
		list(QUALITY_SAWING, 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD)
	)

/datum/craft_recipe/pirs/guild_manip_box
	name = "Box of Flexi-Pico Manipulators"
	result = /obj/item/storage/box/guild_manip
	steps = list(
		list(/obj/item/stock_parts/manipulator/pico, 4),
		list(QUALITY_SCREW_DRIVING, 35, 70),
		list(CRAFT_MATERIAL, 8, MATERIAL_PLASTEEL),
		list(CRAFT_MATERIAL, 8, MATERIAL_PLASTIC),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 35),
		list(/obj/item/stack/cable_coil, 10),
		list(QUALITY_HAMMERING, 40),
		list(QUALITY_SAWING, 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD)
	)

/datum/craft_recipe/pirs/guild_laser_box
	name = "Box of Perfected Ultra High Power Micro-Lasers"
	result = /obj/item/storage/box/guild_laser
	steps = list(
		list(/obj/item/stock_parts/micro_laser/ultra, 4),
		list(QUALITY_SCREW_DRIVING, 35, 70),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASMAGLASS),
		list(CRAFT_MATERIAL, 4, MATERIAL_RGLASS),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 35),
		list(QUALITY_SAWING, 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD)
	)

/datum/craft_recipe/pirs/guild_scanner_box
	name = "Box of Over-Tuned Scanning Modules"
	result = /obj/item/storage/box/guild_scanner
	steps = list(
		list(/obj/item/stock_parts/scanning_module/phasic, 4),
		list(QUALITY_SCREW_DRIVING, 35, 70),
		list(CRAFT_MATERIAL, 4, MATERIAL_GOLD),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 35),
		list(CRAFT_MATERIAL, 4, MATERIAL_SILVER),
		list(QUALITY_SAWING, 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD)
	)

/datum/craft_recipe/pirs/guild_capacitor_box
	name = "Box of Crafted Experimental Capacitors"
	result = /obj/item/storage/box/guild_capacitor
	steps = list(
		list(/obj/item/stock_parts/capacitor/super, 4),
		list(QUALITY_SCREW_DRIVING, 35, 70),
		list(CRAFT_MATERIAL, 4, MATERIAL_GOLD),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 35),
		list(CRAFT_MATERIAL, 4, MATERIAL_SILVER),
		list(QUALITY_SAWING, 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD)
	)
