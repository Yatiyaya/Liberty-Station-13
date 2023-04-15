/datum/technology/SR_Cog_alt
	name = "Similacrum Robotics Alternative Laser Carbine Designs"
	desc = "Further changes made to the already successful Cog design."
	tech_type = RESEARCH_SIMILACRUM

	x = 0.1 //Top left corner
	y = 0.9
	icon = "cog_alt" //cog

	required_technologies = list(/datum/technology/laser_weaponry)
	required_tech_levels = list(RESEARCH_COMBAT = 3, RESEARCH_POWERSTORAGE = 5, RESEARCH_ILLEGAL = 2)
	cost = 1000

	unlocks_designs = list(/datum/design/research/item/similacrum/cog)

/datum/technology/SR_roomba
	name = "Similacrum Robotics Roomba Creation"
	desc = "Small deployable kits for deploying Roomba's and SR FPBs."
	tech_type = RESEARCH_SIMILACRUM

	x = 0.2 //Top left corner
	y = 0.9
	icon = "roomba_kit"

	required_technologies = list(/datum/technology/SR_Cog_alt)
	required_tech_levels = list(RESEARCH_COMBAT = 5, RESEARCH_ROBOTICS = 10)
	cost = 1875

	unlocks_designs = list(/datum/design/research/item/similacrum/manhacks_roomba,
						   /datum/design/research/item/similacrum/manhacks_roomba_tripper,
						   /datum/design/research/item/similacrum/manhacks_roomba_gunne,
						   /datum/design/research/item/similacrum/manhacks_roomba_fbp
						   )

/datum/technology/SR_stockparts
	name = "Similacrum Robotics Stock Parts"
	desc = "SR Manipulator, Laser, Matter Bin, Scanner and Capacitor"
	tech_type = RESEARCH_SIMILACRUM

	x = 0.1 //Top left corner
	y = 0.7
	icon = "similacrumstockparts"

	required_technologies = list(/datum/technology/advanced_biotech,
								 /datum/technology/super_power) // no cheating past level 3s
	required_tech_levels = list(RESEARCH_ENGINEERING = 20)
	cost = 5625

	unlocks_designs = list(/datum/design/research/item/part/similacrum_laser,
						   /datum/design/research/item/part/similacrum_matter,
						   /datum/design/research/item/part/similacrum_module,
						   /datum/design/research/item/part/similacrum_capacitor,
						   /datum/design/research/item/part/similacrum_manipulator)

/datum/technology/SR_robotics
	name = "Similacrum Robotics Positronics"
	desc = "SR Robotic lims."
	tech_type = RESEARCH_SIMILACRUM

	x = 0.2 //top right
	y = 0.7
	icon = "similacrumroboticleg"

	required_technologies = list()
	required_tech_levels = list(RESEARCH_BIOTECH = 13, RESEARCH_ROBOTICS = 15) //Max bio and good robotics

	unlocks_designs = list(/datum/design/research/item/mechfab/prosthesis_similacrum/r_arm,
						   /datum/design/research/item/mechfab/prosthesis_similacrum/l_arm,
						   /datum/design/research/item/mechfab/prosthesis_similacrum/r_leg,
						   /datum/design/research/item/mechfab/prosthesis_similacrum/l_leg)

	cost = 5625
