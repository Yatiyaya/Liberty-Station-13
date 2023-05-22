/datum/craft_recipe/pirs
	category = "PIRS"
	time = 100
	related_stats = list(STAT_COG)
	requiredPerk = PERK_SCIENCE

//Materal Craft ------------------
//bullets -----------------------------

/datum/craft_recipe/pirs/payload_arrow
	name = "bulk empty payload arrow"
	result = /obj/item/ammo_casing/arrow/empty_payload/bulk
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTEEL, "time" = 1),
		list(QUALITY_WELDING, 35, "time" = 5),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC, "time" = 1),
		list(QUALITY_CUTTING, 35, "time" = 5)
	)

//Armor mods ----------------------
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

//Robot Armor ----------------------

/datum/craft_recipe/pirs/robotmelee //Lots of steps
	name = "robot mark v armor plating"
	result = /obj/item/robot_parts/robot_component/armour/mkv
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL, "time" = 90),
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL, "time" = 30),
		list(QUALITY_WELDING, 35, "time" = 90),
		list(QUALITY_CUTTING, 30, "time" = 180),
		list(QUALITY_HAMMERING, 30, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 35, "time" = 90),
		list(QUALITY_BOLT_TURNING, 30, "time" = 120),
		list(QUALITY_SAWING, 30, "time" = 60)
	)

//Tools --------------------------

/datum/craft_recipe/pirs/combat_shovel
	name = "combat crovel"
	result = /obj/item/tool/shovel/combat
	steps = list(
		list(/obj/item/tool/shovel, 1),
		list(QUALITY_SAWING, 20, "time" = 40),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 30),
		list(/obj/item/tool_upgrade/augment/spikes, 1),
		list(QUALITY_BOLT_TURNING, 30, "time" = 10)
	)

//Weapons ------------------------
/* Kept as reference. These are literally terrible LOL
/datum/craft_recipe/pirs/nanopistol
	name = "MKI Forger compressed-matter pistol"
	result = /obj/item/gun/projectile/matter_gun
	steps = list(
		list(CRAFT_MATERIAL, 15, MATERIAL_PLASTEEL, "time" = 15),
		list(QUALITY_CUTTING, 30, "time" = 10),
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTIC, "time" = 15),
		list(QUALITY_BOLT_TURNING, 30, "time" = 20),
		list(/obj/item/cell/medium, 1, "time" = 5),
		list(/obj/item/computer_hardware/tesla_link, 1, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 35, "time" = 20),
		list(/obj/item/stack/cable_coil, 10, "time" = 15),
		list(QUALITY_WIRE_CUTTING, 40, "time" = 15),
		list(/obj/item/stock_parts/manipulator/nano, 1, "time" = 15),
		list(/obj/item/stock_parts/matter_bin/adv, 1, "time" = 5),
		list(QUALITY_SCREW_DRIVING, 35, "time" = 20),
	)

/datum/craft_recipe/pirs/nanoshotgun
	name = "MKII Forger compressed-matter shotgun"
	result = /obj/item/gun/projectile/matter_gun/shotgun
	steps = list(
		list(/obj/item/gun/projectile/matter_gun, 1, "time" = 15),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL, "time" = 15),
		list(QUALITY_CUTTING, 30, "time" = 10),
		list(CRAFT_MATERIAL, 12, MATERIAL_PLASTIC, "time" = 15),
		list(QUALITY_BOLT_TURNING, 30, "time" = 20),
		list(/obj/item/cell/large, 1, "time" = 5),
		list(/obj/item/computer_hardware/tesla_link, 1, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 35, "time" = 20),
		list(/obj/item/stack/cable_coil, 20, "time" = 15),
		list(QUALITY_WIRE_CUTTING, 40, "time" = 15),
		list(/obj/item/stock_parts/capacitor/handmade, 1, "time" = 10),
		list(/obj/item/stock_parts/micro_laser/handmade, 1, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 35, "time" = 20),
	)
*/
/* Kept for reference for now. Replacement soon (tm)
//An exspensive but powerful CQC weapon that also can be used as a flar gun
/datum/craft_recipe/pirs/abdicatorshotgun
	name ="abdicator energy shotgun"
	result = /obj/item/gun/energy/laser/railgun/abdicator
	steps = list(
		list(CRAFT_MATERIAL, 20, MATERIAL_PLASTEEL, "time" = 15),
		list(QUALITY_CUTTING, 30, "time" = 10),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASMA, "time" = 15),
		list(QUALITY_BOLT_TURNING, 30, "time" = 20),
		list(QUALITY_HAMMERING, 10, "time" = 20),
		list(/obj/item/stock_parts/smes_coil, 1, "time" = 5),
		list(QUALITY_WELDING, 35, "time" = 15),
		list(/obj/item/cell/large, 1, "time" = 5),
		list(QUALITY_SCREW_DRIVING, 35, "time" = 20),
		list(/obj/item/stack/cable_coil, 30, "time" = 15),
		list(QUALITY_WIRE_CUTTING, 40, "time" = 15),
		list(/obj/item/stock_parts/subspace/ansible, 1, "time" = 1),
		list(QUALITY_SCREW_DRIVING, 35, "time" = 20),
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD, "time" = 20),
		list(QUALITY_HAMMERING, 30, "time" = 20),
		list(CRAFT_MATERIAL, 6, MATERIAL_RGLASS, "time" = 10),
		list(/obj/item/stock_parts/capacitor/adv, 1, "time" = 10),
		list(/obj/item/stock_parts/micro_laser/high, 1, "time" = 10),
		list(/obj/item/computer_hardware/tesla_link, 1, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 35, "time" = 20),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASMAGLASS, "time" = 20),
		list(CRAFT_MATERIAL, 1, MATERIAL_URANIUM, "time" = 20),
		list(QUALITY_HAMMERING, 40, "time" = 30),
		list(CRAFT_MATERIAL, 15, MATERIAL_PLASTIC, "time" = 20),
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL, "time" = 5),
		list(QUALITY_SCREW_DRIVING, 35, "time" = 5)
	)
*/

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


//Wearables =========================

/datum/craft_recipe/pirs/sheet_stacker
	name = "advanced sheet snatcher"
	icon_state = "woodworking"
	result = /obj/item/storage/bag/sheetsnatcher/guild
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 35, "time" = 20),
		list(CRAFT_MATERIAL, 3, MATERIAL_STEEL, "time" = 60),
		list(QUALITY_ADHESIVE, 10, "time" = 60),
		list(/obj/item/stack/cable_coil, 30, "time" = 30),
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTEEL, "time" = 30),
	)

//Tool/Gun Mods ---------------------
//Reinforcement

/datum/craft_recipe/pirs/rubbermesh
	name = "Rubber Mesh"
	result = /obj/item/tool_upgrade/reinforcement/rubbermesh
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_WIRE_CUTTING, 20, "time" = 90)
	)

//Productivity
/datum/craft_recipe/pirs/booster
	name = "Booster"
	result = /obj/item/tool_upgrade/productivity/booster
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_STEEL, "time" = 30),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 25, "time" = 90),
		list(CRAFT_MATERIAL, 2, MATERIAL_GOLD, "time" = 30),
		list(QUALITY_BOLT_TURNING, 20, "time" = 40)
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

//Gun Mods
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
/*
//Traps
/datum/craft_recipe/pirs/guild_mine_trap
	name = "land mine trap"
	result = /obj/item/mine
	icon_state = "gun"
	steps = list(
		list(/obj/item/mine/improvised, 1, "time" = 120),
		list(QUALITY_SCREW_DRIVING, 10, 70),
		list(CRAFT_MATERIAL, 20, MATERIAL_STEEL),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(/obj/item/stack/cable_coil, 2, "time" = 10)
	)*/
//Machines & Mechs

/datum/craft_recipe/pirs/safety_clamp
	name = "Hydraulic clamp overclock: KILL CLAMP"
	result = /obj/item/mecha_parts/mecha_equipment/tool/safety_clamp
	steps = list(
		list(/obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp, 1, "time" = 60),
		list(QUALITY_BOLT_TURNING, 30, "time" = 40),
		list(/obj/item/tool_upgrade/productivity/motor, 1, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 10, 70),
		list(/obj/item/tool_upgrade/augment/hydraulic, 1, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 10, 70),
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTEEL),
		list(QUALITY_WELDING, 30, "time" = 40),
		list(/obj/item/tool_upgrade/augment/spikes, 1, "time" = 60)
	)

/datum/craft_recipe/pirs/tesla_energy_relay
	name = "Mech energy relay"
	result = /obj/item/mecha_parts/mecha_equipment/tesla_energy_relay
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL, "time" = 30),
		list(QUALITY_WELDING, 45, "time" = 40),
		list(QUALITY_BOLT_TURNING, 30, 70),
		list(/obj/item/computer_hardware/tesla_link, 2, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 35, 70),
		list(/obj/item/stack/cable_coil, 15, "time" = 90),
		list(QUALITY_WIRE_CUTTING, 25, "time" = 90),
		list(/obj/item/stock_parts/capacitor/super, 1, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 10, 70),
		list(CRAFT_MATERIAL, 1, MATERIAL_GOLD)
	)

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
		list(QUALITY_HAMMERING, 40),
		list(QUALITY_SAWING, 60)
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
		list(QUALITY_HAMMERING, 40),
		list(QUALITY_SAWING, 60)
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
		list(QUALITY_SAWING, 60)
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
		list(QUALITY_SAWING, 60)
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
		list(QUALITY_SAWING, 60)
	)
/*
/datum/craft_recipe/pirs/guild_manip_alt
	name = "Forged Manipulator Alt"
	result = /obj/item/stock_parts/manipulator/handmade
	steps = list(
		list(/obj/item/stock_parts/manipulator/nano, 2),
		list(QUALITY_SCREW_DRIVING, 35, 70),
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL),
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTIC),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 35),
		list(/obj/item/stack/cable_coil, 10),
		list(QUALITY_HAMMERING, 40),
		list(QUALITY_SAWING, 60)
	)

/datum/craft_recipe/pirs/guild_laser_alt
	name = "Perfected Micro-Laser Alt"
	result = /obj/item/stock_parts/micro_laser/handmade
	steps = list(
		list(/obj/item/stock_parts/micro_laser/high, 2),
		list(QUALITY_SCREW_DRIVING, 35, 70),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASMAGLASS),
		list(CRAFT_MATERIAL, 1, MATERIAL_RGLASS),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 35),
		list(QUALITY_SAWING, 60)
	)

/datum/craft_recipe/pirs/guild_scanner_alt
	name = "Perfected Scanning Module Alt"
	result = /obj/item/stock_parts/scanning_module/handmade
	steps = list(
		list(/obj/item/stock_parts/scanning_module/adv, 2),
		list(QUALITY_SCREW_DRIVING, 35, 70),
		list(CRAFT_MATERIAL, 2, MATERIAL_GOLD),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 35),
		list(CRAFT_MATERIAL, 2, MATERIAL_SILVER),
		list(QUALITY_SAWING, 60)
	)

/datum/craft_recipe/pirs/guild_capacitor_alt
	name = "Crafted Ultra Capacitor Alt"
	result = /obj/item/stock_parts/capacitor/handmade
	steps = list(
		list(/obj/item/stock_parts/capacitor/adv, 2),
		list(QUALITY_SCREW_DRIVING, 35, 70),
		list(CRAFT_MATERIAL, 2, MATERIAL_GOLD),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 35),
		list(CRAFT_MATERIAL, 2, MATERIAL_SILVER),
		list(QUALITY_SAWING, 60)
	)
*/
// Fixes a matdupe here. Please ensure these are never cheaper to make than anything else.
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
