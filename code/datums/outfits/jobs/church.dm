/decl/hierarchy/outfit/job/church
	l_ear = /obj/item/device/radio/headset/church
	id_type = /obj/item/card/id/church
	pda_type = /obj/item/modular_computer/pda/church
	hierarchy_type = /decl/hierarchy/outfit/job/church
	backpack_contents = list(/obj/item/book/ritual/cruciform = 1)

/decl/hierarchy/outfit/job/church/New()
	..()
	BACKPACK_OVERRIDE_NEOTHEOLOGY

/decl/hierarchy/outfit/job/church/oathpledge
	name = OUTFIT_JOB_NAME("Custodians of Bonfires - Oathpledge")
	l_ear = /obj/item/device/radio/headset/heads/preacher
	id_type = /obj/item/card/id/chaplain
	uniform = /obj/item/clothing/under/rank/preacher
	suit = /obj/item/clothing/suit/storage/chaplain/coat
	head = /obj/item/clothing/head/preacher
	shoes = /obj/item/clothing/shoes/reinforced
	gloves = /obj/item/clothing/gloves/thick
	backpack_contents = list(/obj/item/book/ritual/cruciform/priest = 1, /obj/item/clothing/accessory/cross = 1)

/decl/hierarchy/outfit/job/church/forgemaster
	name = OUTFIT_JOB_NAME("Custodians of Bonfires - Forgemaster")
	uniform = /obj/item/clothing/under/rank/artist
	suit = /obj/item/clothing/suit/artist
	shoes = /obj/item/clothing/shoes/artist_shoes
	head = /obj/item/clothing/head/beret/artist
	glasses = /obj/item/clothing/glasses/artist
	mask = /obj/item/clothing/mask/gas/artist_hat
	l_pocket = /obj/item/bikehorn
	backpack_contents = list(/obj/item/storage/hcases/scrap/job_artist = 1)

/decl/hierarchy/outfit/job/church/enkindled
	name = OUTFIT_JOB_NAME("Custodians of Bonfires - Enkindled")
	uniform = /obj/item/clothing/under/rank/acolyte
	shoes = /obj/item/clothing/shoes/reinforced
	gloves = /obj/item/clothing/gloves/thick

/decl/hierarchy/outfit/job/church/oathbound
	name = OUTFIT_JOB_NAME("Custodians of Bonfires - Oathbound")
	uniform = /obj/item/clothing/under/rank/acolyte
	shoes = /obj/item/clothing/shoes/reinforced
	gloves = /obj/item/clothing/gloves/thick
