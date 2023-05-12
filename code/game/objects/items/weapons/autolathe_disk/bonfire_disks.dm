// Disks formated as /designpath = pointcost , if no point cost is specified it defaults to 1.
// To make a design unprotect use -1
// Bonfire

/obj/item/computer_hardware/hard_drive/portable/design/nt
	disk_name = "Bonfire Armory"
	icon_state = "neotheology"
	license = -1

/obj/item/computer_hardware/hard_drive/portable/design/nt/forging
	disk_name = "Bonfire Forging & Molds"
	icon_state = "neotheology_testament"
	designs = list(
		/datum/design/bioprinter/hearth_lantern,
		/datum/design/autolathe/tool_upgrade/sanctifier,
		//molds
		/datum/design/bioprinter/weapon_mold,
		/datum/design/bioprinter/armor_mold,
		/datum/design/bioprinter/misc_mold,
		/datum/design/bioprinter/upgrade_mold,
		//mold_kits
		/datum/design/bioprinter/mold_kit/blacksmithing,
		/datum/design/bioprinter/mold_kit/tailoring,
		/datum/design/bioprinter/mold_kit/masonry,
		/datum/design/bioprinter/mold_kit/radiance_sigil,
	)

/obj/item/computer_hardware/hard_drive/portable/design/nt/textials
	disk_name = "Bonfire Textials"
	designs = list(
		//clothes
		/datum/design/bioprinter/custodian_clothes/firehelmet,
		/datum/design/bioprinter/custodian_clothes/firesuit,
		/datum/design/bioprinter/custodian_clothes/oathbound,
		/datum/design/bioprinter/custodian_clothes/enkindled,
		/datum/design/bioprinter/custodian_clothes/forgemaster,
		/datum/design/bioprinter/custodian_clothes/oathpledge,
		/datum/design/bioprinter/belt/utility/neotheology,
		/datum/design/bioprinter/custodian_clothes/custodian_boots,
		//backpacks
		/datum/design/bioprinter/leather/storage/backpack/satchel/custodian,
		/datum/design/bioprinter/leather/storage/backpack/custodian,
		/datum/design/bioprinter/leather/storage/backpack/sport/custodian,
		//pouches
		/datum/design/bioprinter/pouch/janitor_supply,
		/datum/design/bioprinter/pouch/medium_generic,
		/datum/design/bioprinter/pouch/large_generic,
		/datum/design/bioprinter/pouch/tubular,
		/datum/design/bioprinter/pouch/tubular/vial,
		//holsters
		/datum/design/bioprinter/leather/holster,
		/datum/design/bioprinter/leather/holster/armpit,
		/datum/design/bioprinter/leather/holster/waist,
		/datum/design/bioprinter/leather/holster/hip,
		/datum/design/bioprinter/leather/holster/leg,
		//pouches
		/datum/design/bioprinter/pouch/ammo,
		/datum/design/bioprinter/pouch/baton_holster,
		/datum/design/bioprinter/pouch/pistol_holster,
		/datum/design/bioprinter/pouch/pistol_double,
		/datum/design/bioprinter/pouch/kniferig,
		/datum/design/bioprinter/pouch/quiver,
		/datum/design/bioprinter/pouch/xbowquiver,
	)

/obj/item/computer_hardware/hard_drive/portable/design/nt/bioaugment
	disk_name = "Strange Disk"
	desc = "Now,where did this come from?"
	icon_state = "onestar"

	license = -1
	designs = list(
		/datum/design/bioprinter/bioimplant/osurgical,
		/datum/design/bioprinter/bioimplant/oengineering,
		/datum/design/bioprinter/bioimplant/oscythe,
		/datum/design/bioprinter/bioimplant/oarmor,
		/datum/design/bioprinter/bioimplant/omuscle,
		/datum/design/research/item/mechfab/modules/hud/welder_bio,
		/datum/design/research/item/mechfab/modules/hud/night_bio,
		/datum/design/research/item/mechfab/modules/hud/thermal_bio
	)
