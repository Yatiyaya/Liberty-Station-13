/decl/hierarchy/outfit/job/custodians
	l_ear = /obj/item/device/radio/headset/bonfire
	id_type = /obj/item/card/id/bonfire
	pda_type = /obj/item/modular_computer/pda/bonfire
	hierarchy_type = /decl/hierarchy/outfit/job/custodians
	backpack_contents = list(/obj/item/book/lectures/hearthlantern = 1)
	shoes = /obj/item/clothing/shoes/custodian
	gloves = /obj/item/clothing/gloves/thick

/decl/hierarchy/outfit/job/custodians/New()
	..()
	BACKPACK_OVERRIDE_BONFIRE

/decl/hierarchy/outfit/job/custodians/oathpledge
	name = OUTFIT_JOB_NAME("Custodians of Bonfire - Oathpledge")
	l_ear = /obj/item/device/radio/headset/heads/oathpledge
	id_type = /obj/item/card/id/oathpledge
	uniform = /obj/item/clothing/under/custodian/oathpledge
	suit = /obj/item/clothing/suit/storage/custodian/oathpledge
	head = /obj/item/clothing/head/custodian/oathpledge
	backpack_contents = list(/obj/item/book/lectures/hearthlantern/oathpledge = 1, /obj/item/forgesigil = 1, /obj/item/mold/oathpledge_neuron = 1)

/decl/hierarchy/outfit/job/custodians/forgemaster
	name = OUTFIT_JOB_NAME("Custodians of Bonfire - Forgemaster")
	uniform = /obj/item/clothing/under/custodian/forgemaster
	suit = /obj/item/clothing/suit/storage/custodian/forgemaster
	head = /obj/item/clothing/head/custodian/forgemaster
	backpack_contents = list(/obj/item/book/lectures/hearthlantern = 1, /obj/item/clothing/glasses/welding = 1)

/decl/hierarchy/outfit/job/custodians/enkindled
	name = OUTFIT_JOB_NAME("Custodians of Bonfire - Enkindled")
	uniform = /obj/item/clothing/under/custodian/enkindled
	suit = /obj/item/clothing/suit/storage/custodian/enkindled
	head = /obj/item/clothing/head/custodian/enkindled

/decl/hierarchy/outfit/job/custodians/oathbound
	name = OUTFIT_JOB_NAME("Custodians of Bonfire - Oathbound")
	uniform = /obj/item/clothing/under/custodian/oathbound
	suit = /obj/item/clothing/suit/storage/custodian/oathbound
	head = /obj/item/clothing/head/custodian/oathbound
