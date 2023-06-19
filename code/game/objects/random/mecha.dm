/obj/random/mecha
	name = "random mecha"
	icon_state = "machine-red"
	spawn_nothing_percentage = 20
	var/list/randsuits = list(
		/obj/mecha/working/hoverpod = 5,
		/obj/mecha/working/hoverpod/combatpod = 0.5,//Comes with weapons
		/obj/mecha/working/hoverpod/shuttlepod = 6,
		/obj/mecha/working/ripley = 5,
		/obj/mecha/working/ripley/firefighter = 6,
		/obj/mecha/working/ripley/deathripley = 2,//well armored
		/obj/mecha/working/ripley/mining = 4,
		/obj/mecha/medical/odysseus = 6,
		/obj/mecha/medical/odysseus/loaded = 5,
		/obj/mecha/combat/durand = 1.5,//comes unarmed
		/obj/mecha/combat/gygax = 1,//comes unarmed
		/obj/mecha/combat/juggernaut = 0.1,
		/obj/mecha/combat/phazon = 0.1)

/obj/random/mecha/item_to_spawn()
	return pickweight(randsuits)

/obj/random/mecha/low_chance
	name = "low chance random mecha"
	icon_state = "machine-red-low"
	spawn_nothing_percentage = 90

/obj/random/mecha/damaged
	name = "random damaged mecha"
	icon_state = "machine-red"
	has_postspawn = TRUE
	spawn_nothing_percentage = 20

/obj/random/mecha/damaged/post_spawn(var/list/things)
	for (var/obj/a in things)
		a.make_old()

/obj/random/mecha/damaged/low_chance
	name = "low chance random damaged mecha"
	icon_state = "machine-red-low"
	spawn_nothing_percentage = 90


// Mecha equipment below


/obj/random/mecha_utility
	name = "random mecha utilitary equipment"
	icon_state = "tool-grey"

/obj/random/mecha_utility/item_to_spawn()
	return pickweight(list(/obj/item/mecha_parts/mecha_equipment/tool/sleeper,
		/obj/item/mecha_parts/mecha_equipment/tool/cable_layer,
		/obj/item/mecha_parts/mecha_equipment/tool/syringe_gun,
		/obj/item/mecha_parts/mecha_equipment/thruster = 2,
		/obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp = 2,
	 	/obj/item/mecha_parts/mecha_equipment/tool/drill = 2,
	 	/obj/item/mecha_parts/mecha_equipment/tool/drill/diamonddrill = 0.8,
	 	/obj/item/mecha_parts/mecha_equipment/tool/extinguisher,
	 	/obj/item/mecha_parts/mecha_equipment/tool/rcd = 0.8,
	 	/obj/item/mecha_parts/mecha_equipment/teleporter = 0.5,
		/obj/item/mecha_parts/mecha_equipment/wormhole_generator = 0.5,
		/obj/item/mecha_parts/mecha_equipment/gravcatapult = 0.5,
		/obj/item/mecha_parts/mecha_equipment/tesla_energy_relay,
		/obj/item/mecha_parts/mecha_equipment/mech_gen,
		/obj/item/mecha_parts/mecha_equipment/mech_gen/nuclear = 0.5,
		/obj/item/mecha_parts/mecha_equipment/tool/passenger)
		)

/obj/random/mecha_utility/low_chance
	name = "low chance random mecha util equipment"
	icon_state = "tool-grey-low"
	spawn_nothing_percentage = 80

/obj/random/mecha_weapon
	name = "random mecha weapon module"
	icon_state = "gun-grey"

/obj/random/mecha_weapon/item_to_spawn()
	return pickweight(list(
		/obj/item/mecha_parts/mecha_equipment/melee_weapon/sword = 2,
		/obj/item/mecha_parts/mecha_equipment/tool/safety_clamp = 2, // Counts more as a weapon than a clamp tbh
		/obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/laser = 2,
		/obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/laser/heavy,
		/obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/ion,
		/obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/ppc = 0.5,
		/obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/pulse = 0.5,
		/obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/taser = 2,
		/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/cannon/loaded = 2,
		/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/flak/loaded = 2,
		/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/hmg/loaded = 2,
		/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/cannon/military/loaded,
		/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/ultracannon/loaded,
		/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/scattershot/loaded,
		/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/flare = 2,
		/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/explosive = 0.5,
		/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/flashbang = 2)
		)

/obj/random/mecha_weapon/low_chance
	name = "low chance random mecha weapon"
	icon_state = "gun-grey-low"
	spawn_nothing_percentage = 80

/obj/random/mecha_armor
	name = "random mecha armor upgrade"
	icon_state = "tech-grey"

/obj/random/mecha_armor/item_to_spawn()
	return pickweight(list(
		/obj/item/mecha_parts/mecha_equipment/armor_booster = 2,
		/obj/item/mecha_parts/mecha_equipment/armor_booster/anticcw_armor_booster,
		/obj/item/mecha_parts/mecha_equipment/armor_booster/antiproj_armor_booster)
	)

/obj/random/mecha_armor/low_chance
	name = "low chance random mech armor"
	icon_state = "tech-grey-low"
	spawn_nothing_percentage = 80

/obj/random/mecha_ammo
	name = "random mech ammo"
	icon_state = "ammo-grey"

/obj/random/mecha_ammo/item_to_spawn()
	return pickweight(list(
		/obj/item/mech_ammo_box/cannon,
		/obj/item/mech_ammo_box/scattershot,
		/obj/item/mech_ammo_box/hmg,
		/obj/item/mech_ammo_box/ultracannon)
	)

/obj/random/mecha_ammo/low_chance
	name = "low chance random mech ammo"
	icon_state = "ammo-grey-low"
	spawn_nothing_percentage = 80

