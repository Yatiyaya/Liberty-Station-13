/datum/gear/faction/capsa
	display_name = "winter coat, CAPSA research"
	path = /obj/item/clothing/suit/hooded/wintercoat/science
	allowed_roles = list("Research Provost","CAPSA Scientist","CAPSA Roboticist")
	slot = slot_wear_suit
	sort_category = "Faction: CAPSA"
	cost = 0

/datum/gear/faction/capsa/cloakmbo
	display_name = "cloak, biolab overseer"
	path = /obj/item/clothing/accessory/job/cape/mbo
	allowed_roles = list("Chief Biolab Overseer")
	slot = slot_wear_suit
	sort_category = "Faction: CAPSA"

/datum/gear/faction/capsa/cloakmedical
	display_name = "cloak, CAPSA medical"
	path = /obj/item/clothing/accessory/job/cape/medical
	allowed_roles = list("CAPSA Doctor","CAPSA Biolab Officer","CAPSA Lifeline Technician")
	slot = slot_wear_suit
	sort_category = "Faction: CAPSA"

/datum/gear/faction/capsa/si_bdu
	display_name = "recovery team bdu"
	path = /obj/item/clothing/under/rank/paramedic/bdu
	allowed_roles = list("CAPSA Doctor","Chief Biolab Overseer","CAPSA Lifeline Technician")
	slot = slot_wear_suit
	sort_category = "Faction: CAPSA"

/datum/gear/faction/capsa/gorka_crew_med
	display_name = "gorka jacket, CAPSA medical"
	path = /obj/item/clothing/suit/gorka/toggle/crew_med
	allowed_roles = list("CAPSA Doctor","Chief Biolab Overseer","CAPSA Lifeline Technician")
	slot = slot_wear_suit
	sort_category = "Faction: CAPSA"

/datum/gear/faction/capsa/gorkamoebiusmedical
	display_name = "gorka jumpsuit, CAPSA medical"
	path = /obj/item/clothing/under/rank/medical/gorka_crew_med
	allowed_roles = list("CAPSA Doctor","Chief Biolab Overseer","CAPSA Lifeline Technician")
	slot = slot_w_uniform
	sort_category = "Faction: CAPSA"

/datum/gear/faction/capsa/gorkapantsmedical
	display_name = "gorka pants, CAPSA medical"
	path = /obj/item/clothing/under/rank/medical/gorkapantscrewmed
	allowed_roles = list("CAPSA Doctor","Chief Biolab Overseer","CAPSA Lifeline Technician")
	slot = slot_w_uniform
	sort_category = "Faction: CAPSA"

/datum/gear/faction/capsa/medicalhud
	display_name = "medical HUD"
	path = /obj/item/clothing/glasses/hud/health
	allowed_roles = list(JOBS_MEDICAL)
	sort_category = "Faction: CAPSA"

/datum/gear/faction/capsa/medicalscouter
	display_name = "medical HUD, scouter"
	path = /obj/item/clothing/glasses/hud/health/scouter
	allowed_roles = list("Chief Biolab Overseer","CAPSA Doctor","CAPSA Lifeline Technician","Corpsman")
	sort_category = "Faction: CAPSA"

/datum/gear/faction/capsa/hudpatch
	display_name = "medical HUD, eyepatch"
	path = /obj/item/clothing/glasses/eyepatch/medpatch
	allowed_roles = list("Chief Biolab Overseer","CAPSA Doctor","CAPSA Lifeline Technician","Corpsman")
	sort_category = "Faction: CAPSA"

/datum/gear/faction/capsa/scrubs
	display_name = "scrubs selection"
	path = /obj/item/clothing/under/scrubs
	flags = GEAR_HAS_TYPE_SELECTION
	allowed_roles = list("CAPSA Psychiatrist","CAPSA Lifeline Technician","CAPSA Doctor","Chief Biolab Overseer")
	slot = slot_w_uniform
	sort_category = "Faction: CAPSA"

/datum/gear/faction/capsa/surgical
	display_name = "surgical cap selection"
	path = /obj/item/clothing/head/surgery/
	allowed_roles = list("CAPSA Psychiatrist","CAPSA Lifeline Technician","CAPSA Doctor","Chief Biolab Overseer")
	cost = 1
	slot = slot_head
	flags = GEAR_HAS_TYPE_SELECTION
	sort_category = "Faction: CAPSA"

/datum/gear/faction/capsa/snowsuitmedical
	display_name = "snowsuit, CAPSA medical"
	path = /obj/item/clothing/suit/storage/snowsuit/medical
	allowed_roles = list("CAPSA Psychiatrist","CAPSA Orderly","CAPSA Lifeline Technician","Chief Biolab Overseer")
	slot = slot_wear_suit
	sort_category = "Faction: CAPSA"

/datum/gear/faction/capsa/winterbootsmedical
	display_name = "winter boots, CAPSA medical"
	path = /obj/item/clothing/shoes/winter/medical
	allowed_roles = list("CAPSA Psychiatrist","CAPSA Lifeline Technician","CAPSA Doctor","Chief Biolab Overseer")
	slot = slot_shoes
	sort_category = "Faction: CAPSA"

/datum/gear/faction/capsa/wintercoatmedical
	display_name = "winter coat, CAPSA medical"
	path = /obj/item/clothing/suit/hooded/wintercoat/medical
	allowed_roles = list("CAPSA Psychiatrist","CAPSA Lifeline Technician","CAPSA Doctor","Chief Biolab Overseer")
	slot = slot_wear_suit
	sort_category = "Faction: CAPSA"

/datum/gear/faction/capsa/penlight
	display_name = "medical penlight"
	path = /obj/item/device/lighting/toggleable/flashlight/pen
	allowed_roles = list("CAPSA Lifeline Technician","CAPSA Doctor","Chief Biolab Overseer")
	slot = slot_r_ear
	sort_category = "Faction: CAPSA"
	cost = 0
