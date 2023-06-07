/datum/technology/SR_Cog_alt
	name = "Simulacrum Robotics Alternative Laser Carbine Designs"
	desc = "Further changes made to the already successful Cog design."
	tech_type = RESEARCH_SIMULACRUM

	x = 0.1 //Top left corner
	y = 0.9
	icon = "cog_alt" //cog

	required_technologies = list(/datum/technology/laser_weaponry)
	required_tech_levels = list(RESEARCH_COMBAT = 14, RESEARCH_POWERSTORAGE = 5, RESEARCH_ILLEGAL = 2)
	cost = 1000

	unlocks_designs = list(/datum/design/research/item/simulacrum/cog)

/datum/technology/SR_roomba
	name = "Simulacrum Robotics Roomba Creation"
	desc = "Small deployable kits for deploying Roomba's and SR FPBs."
	tech_type = RESEARCH_SIMULACRUM

	x = 0.2 //Top left corner
	y = 0.9
	icon = "roomba_kit"

	required_technologies = list(/datum/technology/SR_Cog_alt)
	required_tech_levels = list(RESEARCH_ROBOTICS = 8)
	cost = 1875

	unlocks_designs = list(/datum/design/research/item/simulacrum/manhacks_roomba,
						   /datum/design/research/item/simulacrum/manhacks_roomba_tripper,
						   /datum/design/research/item/simulacrum/manhacks_roomba_gunne,
						   /datum/design/research/item/simulacrum/manhacks_roomba_fbp
						   )

/datum/technology/SR_stockparts
	name = "Simulacrum Robotics Stock Parts"
	desc = "SR Manipulator, Laser, Matter Bin, Scanner and Capacitor"
	tech_type = RESEARCH_SIMULACRUM

	x = 0.1 //Top left corner
	y = 0.8
	icon = "similacrumstockparts"

	required_technologies = list(/datum/technology/advanced_biotech,
								 /datum/technology/super_power) // no cheating past level 3s
	required_tech_levels = list(RESEARCH_ENGINEERING = 22)
	cost = 5625

	unlocks_designs = list(/datum/design/research/item/part/simulacrum_laser,
						   /datum/design/research/item/part/simulacrum_matter,
						   /datum/design/research/item/part/simulacrum_module,
						   /datum/design/research/item/part/simulacrum_capacitor,
						   /datum/design/research/item/part/simulacrum_manipulator)

/datum/technology/SR_cells
	name = "Simulacrum Robotics Cells"
	desc = "A mix of old cell manufacturing with a SR characteristics."
	tech_type = RESEARCH_SIMULACRUM

	x = 0.2 //Top left corner
	y = 0.8
	icon = "similacrumcells"

	required_technologies = list(/datum/technology/atom_power, /datum/technology/SR_stockparts)
	required_tech_levels = list(RESEARCH_POWERSTORAGE = 10)
	cost = 5625

	unlocks_designs = list(
						/datum/design/research/item/powercell/large/simulacrum,
						/datum/design/research/item/powercell/medium/simulacrum,
						/datum/design/research/item/powercell/small/simulacrum
						   )


/datum/technology/SR_robotics
	name = "Simulacrum Robotics prosthetics"
	desc = "SR Robotic lims."
	tech_type = RESEARCH_SIMULACRUM

	x = 0.1 //top left
	y = 0.7
	icon = "similacrumroboticleg"

	required_technologies = list(/datum/technology/prosthetic_organs)
	required_tech_levels = list(RESEARCH_BIOTECH = 10, RESEARCH_ROBOTICS = 8) //Max bio and good robotics

	unlocks_designs = list(/datum/design/research/item/mechfab/prosthesis_simulacrum/r_arm,
						   /datum/design/research/item/mechfab/prosthesis_simulacrum/l_arm,
						   /datum/design/research/item/mechfab/prosthesis_simulacrum/r_leg,
						   /datum/design/research/item/mechfab/prosthesis_simulacrum/l_leg)

	cost = 5625
