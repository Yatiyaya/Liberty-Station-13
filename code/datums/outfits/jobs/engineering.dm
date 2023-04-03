/decl/hierarchy/outfit/job/engineering
	hierarchy_type = /decl/hierarchy/outfit/job/engineering
	belt = /obj/item/storage/belt/utility/full/union
	l_ear = /obj/item/device/radio/headset/headset_eng
	r_ear = /obj/item/tool/screwdriver
	shoes = /obj/item/clothing/shoes/workboots
	gloves = /obj/item/clothing/gloves/insulated
	suit = /obj/item/clothing/suit/storage/hazardvest
	pda_slot = slot_l_store
	r_pocket = /obj/item/device/t_scanner
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL
	suit_store = /obj/item/gun/matter/launcher/breaker

/decl/hierarchy/outfit/job/engineering/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/engineering/chief
	name = OUTFIT_JOB_NAME("Terra-Therma - Union Chief")
	head = /obj/item/clothing/head/firefighter/chief
	uniform = /obj/item/clothing/under/rank/chief
	head = /obj/item/clothing/head/firefighter/chief
	l_ear = /obj/item/device/radio/headset/heads/ce
	gloves = /obj/item/clothing/gloves/insulated/union
	id_type = /obj/item/card/id/ce
	pda_type = /obj/item/modular_computer/pda/heads/ce

/decl/hierarchy/outfit/job/engineering/engineer
	name = OUTFIT_JOB_NAME("Terra-Therma - Engineer")
	head = /obj/item/clothing/head/hardhat
	uniform = /obj/item/clothing/under/rank/engineer
	id_type = /obj/item/card/id/engie
	pda_type = /obj/item/modular_computer/pda/engineering

/decl/hierarchy/outfit/job/engineering/engineer/void
	name = OUTFIT_JOB_NAME("Terra-Therma - Engineer Voidsuit")
	mask = /obj/item/clothing/mask/breath
	suit = /obj/item/clothing/suit/space/void/engineering

/decl/hierarchy/outfit/job/engineering/mining
	name = OUTFIT_JOB_NAME("Terra-Therma - Miner")
	uniform = /obj/item/clothing/under/rank/miner
	suit = /obj/item/clothing/suit/storage/hazardvest
	head = /obj/item/clothing/head/hardhat
	pda_type = /obj/item/modular_computer/pda/science/science
	backpack_contents = list(/obj/item/tool/crowbar = 1, /obj/item/storage/bag/ore = 1)
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/engineering/mining/void
	name = OUTFIT_JOB_NAME("Terra-Therma - Miner Voidsuit")
	mask = /obj/item/clothing/mask/breath
	suit = /obj/item/clothing/suit/space/void/mining
