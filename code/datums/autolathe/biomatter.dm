/datum/design/bioprinter
	build_type = BIOPRINTER
	materials = list(MATERIAL_BIOMATTER = 6)

/datum/design/bioprinter/meat
	name = "Meat"
	build_path = /obj/item/reagent_containers/food/snacks/meat
	materials = list(MATERIAL_BIOMATTER = 5)

/datum/design/bioprinter/milk
	name = "Milk"
	build_path = /obj/item/reagent_containers/food/drinks/milk

/datum/design/bioprinter/soap
	name = "Soap"
	build_path = /obj/item/soap/church

//[NUTRIMENTS]
/datum/design/bioprinter/ez
	name = "EZ-Nutrient"
	build_path = /obj/item/reagent_containers/glass/fertilizer/ez
	materials = list(MATERIAL_BIOMATTER = 3)

/datum/design/bioprinter/l4z
	name = "Left4Zed"
	build_path = /obj/item/reagent_containers/glass/fertilizer/l4z

/datum/design/bioprinter/rh
	name = "Robust Harvest"
	build_path = /obj/item/reagent_containers/glass/fertilizer/rh
	materials = list(MATERIAL_BIOMATTER = 7.5)
//[/NUTRIMENTS]

//[CLOTHES, ARMOR AND ACCESORIES]
/*  //Commented out because broke.
/datum/design/bioprinter/cardboard
	name = "Cardboard"
	build_path = /obj/item/stack/material/cardboard/random // I guess it depends on the protein content.
*/

/* Getting replaced with something else
/datum/design/bioprinter/leather/holster/saber/greatsword/churchprint
	name = "Custodian Scabbard"
	build_path = /obj/item/clothing/accessory/holster/saber/greatsword/churchprint
	materials = list(MATERIAL_BIO_SILK = 0.1, MATERIAL_CARBON_FIBER = 0.2)
*/
/datum/design/bioprinter/wallet
	name = "Wallet"
	build_path = /obj/item/storage/wallet

/datum/design/bioprinter/botanic_leather
	name = "Botanical gloves"
	build_path = /obj/item/clothing/gloves/botanic_leather
	materials = list(MATERIAL_BIOMATTER = 15)

/datum/design/bioprinter/leather
	materials = list(MATERIAL_BIOMATTER = 20, MATERIAL_BIO_SILK = 1)

/datum/design/bioprinter/leather/satchel
	name = "Leather Satchel"
	build_path = /obj/item/storage/backpack/satchel

/datum/design/bioprinter/leather/storage/backpack/satchel/custodian
	name = "Cruciform  Satchel"
	build_path = /obj/item/storage/backpack/satchel/custodian

/datum/design/bioprinter/leather/storage/backpack/custodian
	name = "Cruciform Backpack"
	build_path = /obj/item/storage/backpack/custodian

/datum/design/bioprinter/leather/storage/backpack/sport/custodian
	name = "Cruciform Sport Backpack"
	build_path = /obj/item/storage/backpack/sport/custodian

/datum/design/bioprinter/leather/holster
	name = "shoulder holster"
	build_path = /obj/item/clothing/accessory/holster

/datum/design/bioprinter/leather/holster/armpit
	name = "armpit holster"
	build_path = /obj/item/clothing/accessory/holster/armpit

/datum/design/bioprinter/leather/holster/waist
	name = "waist holster"
	build_path = /obj/item/clothing/accessory/holster/waist

/datum/design/bioprinter/leather/holster/hip
	name = "hip holster"
	build_path = /obj/item/clothing/accessory/holster/hip

/datum/design/bioprinter/leather/holster/leg
	name = "leg holster"
	build_path = /obj/item/clothing/accessory/holster/leg

/datum/design/bioprinter/belt
	materials = list(MATERIAL_BIOMATTER = 20, MATERIAL_BIO_SILK = 1)

/datum/design/bioprinter/belt/utility/neotheology
	name = "Bonfire utility belt"
	build_path = /obj/item/storage/belt/utility/custodian
	materials = list(MATERIAL_BIO_SILK = 1, MATERIAL_CARBON_FIBER = 0.5)

/datum/design/bioprinter/belt/security/neotheology
	name = "Bonfire tactical belt"
	build_path = /obj/item/storage/belt/security/custodian
	materials = list(MATERIAL_BIO_SILK = 1, MATERIAL_CARBON_FIBER = 0.5)

/datum/design/bioprinter/belt/misc/champion
	name = "Champion belt"
	build_path = /obj/item/storage/belt/champion
	materials = list(MATERIAL_BIOMATTER = 50)

// This separates regular clothes designs from custodian clothes designs //
/datum/design/bioprinter/nt_clothes/oathbound
	name = "Oathbound Underarmor"
	build_path = /obj/item/clothing/under/custodian/oathbound
	materials = list(MATERIAL_BIO_SILK = 5)

/datum/design/bioprinter/nt_clothes/enkindled
	name = "Enkindled Underarmor"
	build_path = /obj/item/clothing/under/custodian/enkindled
	materials = list(MATERIAL_BIO_SILK = 5)

/datum/design/bioprinter/nt_clothes/forgemaster
	name = "Forgemaster Underarmor"
	build_path = /obj/item/clothing/under/custodian/forgemaster
	materials = list(MATERIAL_BIO_SILK = 5)

/datum/design/bioprinter/nt_clothes/oathpledge
	name = "Oathpledge Underarmor"
	build_path = /obj/item/clothing/under/custodian/oathpledge
	materials = list(MATERIAL_BIO_SILK = 5)

/datum/design/bioprinter/nt_clothes/custodian_boots
	name = "Custodian Boots"
	build_path = /obj/item/clothing/shoes/custodian
	materials = list(MATERIAL_BIO_SILK = 5)

/datum/design/bioprinter/nt_clothes/oathbound_armor
	name = "Oathbound Armor"
	build_path = /obj/item/clothing/suit/armor/custodian/oathbound
	materials = list(MATERIAL_BIO_SILK = 15, MATERIAL_CARBON_FIBER = 5)

/datum/design/bioprinter/nt_clothes/oathbound_helmet
	name = "Oathbound Helmet"
	build_path = /obj/item/clothing/head/helmet/custodian/oathbound
	materials = list(MATERIAL_BIO_SILK = 5, MATERIAL_CARBON_FIBER = 3)

/datum/design/bioprinter/nt_clothes/enkindled_armor
	name = "Enkindled Armor"
	build_path = /obj/item/clothing/suit/armor/custodian/enkindled
	materials = list(MATERIAL_BIO_SILK = 15, MATERIAL_CARBON_FIBER = 5)

/datum/design/bioprinter/nt_clothes/enkindled_helmet
	name = "Enkindled Helmet"
	build_path = /obj/item/clothing/head/helmet/custodian/enkindled
	materials = list(MATERIAL_BIO_SILK = 5, MATERIAL_CARBON_FIBER = 3)

/datum/design/bioprinter/nt_clothes/forgemaster_armor
	name = "Forgemaster Armor"
	build_path = /obj/item/clothing/suit/armor/custodian/forgemaster
	materials = list(MATERIAL_BIO_SILK = 15, MATERIAL_CARBON_FIBER = 5)

/datum/design/bioprinter/nt_clothes/forgemaster_helmet
	name = "Forgemaster Helmet"
	build_path = /obj/item/clothing/head/helmet/custodian/forgemaster
	materials = list(MATERIAL_BIO_SILK = 5, MATERIAL_CARBON_FIBER = 3)

/datum/design/bioprinter/nt_clothes/oathpledge_armor
	name = "Oathpledge Armor"
	build_path = /obj/item/clothing/suit/armor/custodian/oathpledge
	materials = list(MATERIAL_BIO_SILK = 25, MATERIAL_CARBON_FIBER = 10)

/datum/design/bioprinter/nt_clothes/oathpledge_helmet
	name = "Oathpledge Helmet"
	build_path = /obj/item/clothing/head/helmet/custodian/oathpledge
	materials = list(MATERIAL_BIO_SILK = 10, MATERIAL_CARBON_FIBER = 5)

/datum/design/bioprinter/nt_clothes/huscarl
	name = "Huscarl Voidsuit"
	build_path = /obj/item/clothing/suit/space/void/huscarl
	materials = list(MATERIAL_BIO_SILK = 18, MATERIAL_CARBON_FIBER = 18)

/* Pending Custodian IRR sprites later
/datum/design/bioprinter/nt_clothes/knight_rig
	name = "Knight Hardsuit Module"
	materials = list(MATERIAL_BIOMATTER = 100, MATERIAL_GOLD = 10, MATERIAL_SILVER = 10, MATERIAL_PLASTEEL = 100, MATERIAL_BIO_SILK = 40, MATERIAL_CARBON_FIBER = 28)
	build_path = /obj/item/rig/combat/knight
*/

//[MELEE]
/datum/design/autolathe/sword/custodian_sword
	name = "Ulfberth"
	build_path = /obj/item/tool/sword/custodian/shortsword
	materials = list(MATERIAL_BIO_SILK = 1, MATERIAL_CARBON_FIBER = 8)

/datum/design/autolathe/sword/custodian_longsword
	name = "Horseman Axe"
	build_path = /obj/item/tool/sword/custodian/horseaxe
	materials = list(MATERIAL_BIO_SILK = 1, MATERIAL_CARBON_FIBER = 12)

/datum/design/autolathe/sword/custodian_dagger
	name = "Custodian Seax"
	build_path = /obj/item/tool/knife/dagger/custodian
	materials = list(MATERIAL_BIO_SILK = 1, MATERIAL_CARBON_FIBER = 3)

/datum/design/autolathe/sword/custodian_halberd
	name = "Custodian Atgeir"
	build_path = /obj/item/tool/spear/atgeir
	materials = list(MATERIAL_BIO_SILK = 1, MATERIAL_CARBON_FIBER = 18)

/datum/design/autolathe/sword/custodian_spear
	name = "Custodian Francisca"
	build_path = /obj/item/tool/sword/custodian/throwaxe
	materials = list(MATERIAL_BIO_SILK = 1, MATERIAL_CARBON_FIBER = 4)

/datum/design/autolathe/sword/custodian_scourge
	name = "Custodian Nagaika"
	build_path = /obj/item/tool/sword/custodian/whip
	materials = list(MATERIAL_BIO_SILK = 10, MATERIAL_CARBON_FIBER = 18)

/datum/design/autolathe/shield/nt_shield
	name = "Custodian Scutum Shield"
	build_path = /obj/item/shield/riot/custodian
	materials = list(MATERIAL_BIO_SILK = 3, MATERIAL_CARBON_FIBER = 21)

/datum/design/autolathe/nt/shield/nt_buckler
	name = "Custodian Heater Shield"
	build_path = /obj/item/shield/buckler/custodian
	materials = list(MATERIAL_BIO_SILK = 2, MATERIAL_CARBON_FIBER = 12)

/datum/design/autolathe/tool_upgrade/sanctifier
	name = "NT Sanctifier"
	build_path = /obj/item/tool_upgrade/augment/sanctifier
	materials = list(MATERIAL_CARBON_FIBER = 3)

/datum/design/autolathe/sword/custodian_flanged
	name = "Emberblaze Warhammer"
	build_path = /obj/item/tool/sword/custodian/warhammer
	materials = list(MATERIAL_BIO_SILK = 1, MATERIAL_CARBON_FIBER = 16)

//[ARMOR UPGRADES]
/datum/design/autolathe/armor_upgrade
	name = "base item, not seen in-game"
	materials = list(MATERIAL_BIO_SILK = 10, MATERIAL_CARBON_FIBER = 5)

/datum/design/autolathe/armor_upgrade/melee
	name = "Melee Armor Upgrade"
	build_path = /obj/item/tool_upgrade/armor/melee

/datum/design/autolathe/armor_upgrade/bullet
	name = "Bullet Armor Upgrade"
	build_path = /obj/item/tool_upgrade/armor/bullet

/datum/design/autolathe/armor_upgrade/energy
	name = "Energy Armor Upgrade"
	build_path = /obj/item/tool_upgrade/armor/energy

/datum/design/autolathe/armor_upgrade/bomb
	name = "Bomb Armor Upgrade"
	build_path = /obj/item/tool_upgrade/armor/bomb

//[/IMPLANTS]

/datum/design/bioprinter/bioimplant
	materials = list(MATERIAL_BIOMATTER = 50)

/datum/design/bioprinter/bioimplant/oscythe
	name = "Organic arm scythe implant"
	build_path = /obj/item/biogoop/armscythe

/datum/design/bioprinter/bioimplant/osurgical
	name = "Organic surgery omnitool implant"
	build_path = /obj/item/biogoop/surgical

/datum/design/bioprinter/bioimplant/oengineering
	name = "Organic engineering omnitool implant"
	build_path = /obj/item/biogoop/engineer

/datum/design/bioprinter/bioimplant/oarmor
	name = "Organic exoskeleton implant"
	build_path = /obj/item/biogoop/armor

/datum/design/bioprinter/bioimplant/omuscle
	name = "Organic muscle implant"
	build_path = /obj/item/biogoop/muscle

//[/CRUCIFORM UPGRAED]

/datum/design/autolathe/cruciform_upgrade
	build_path = /obj/item/cruciform_upgrade
	materials = list(MATERIAL_CARBON_FIBER = 24)

/datum/design/autolathe/cruciform_upgrade/natures_blessing
	name = "Natures blessing"
	build_path = /obj/item/cruciform_upgrade/natures_blessing

/datum/design/autolathe/cruciform_upgrade/faiths_shield
	name = "Faiths shield"
	build_path = /obj/item/cruciform_upgrade/faiths_shield

/datum/design/autolathe/cruciform_upgrade/cleansing_presence
	name = "Cleansing presence"
	build_path = /obj/item/cruciform_upgrade/cleansing_presence

/datum/design/autolathe/cruciform_upgrade/martyr_gift
	name = "Martyr gift"
	build_path = /obj/item/cruciform_upgrade/martyr_gift

/datum/design/autolathe/cruciform_upgrade/wrath_of_god
	name = "Wrath of god"
	build_path = /obj/item/cruciform_upgrade/wrath_of_god

/datum/design/autolathe/cruciform_upgrade/speed_of_the_chosen
	name = "Speed of the chosen"
	build_path = /obj/item/cruciform_upgrade/speed_of_the_chosen

//[/POUCHES]
/datum/design/bioprinter/pouch
	materials = list(MATERIAL_BIO_SILK = 6)

/datum/design/bioprinter/pouch/ammo
	name = "Ammo pouch"
	build_path = /obj/item/storage/pouch/ammo

/datum/design/bioprinter/pouch/baton_holster
	name = "Baton holster"
	build_path = /obj/item/storage/pouch/baton_holster

/datum/design/bioprinter/pouch/pistol_holster
	name = "Pistol holster"
	build_path = /obj/item/storage/pouch/pistol_holster

/datum/design/bioprinter/pouch/pistol_double
	name = "Belt pistol holster"
	build_path = /obj/item/storage/pouch/pistol_holster/cowboy

/datum/design/bioprinter/pouch/kniferig
	name = "Throwing knives scabbard"
	build_path = /obj/item/storage/pouch/kniferig

/datum/design/bioprinter/pouch/quiver
	name = "arrows quiver"
	build_path = /obj/item/storage/pouch/quiver
	materials = list(MATERIAL_BIO_SILK = 8)

/datum/design/bioprinter/pouch/xbowquiver
	name = "crossbow bolts quiver"
	build_path = /obj/item/storage/pouch/bolts
	materials = list(MATERIAL_BIO_SILK = 8)

/datum/design/bioprinter/pouch/janitor_supply
	name = "Janitor supplies pouch"
	build_path = /obj/item/storage/pouch/janitor_supply

/datum/design/bioprinter/pouch/medium_generic
	name = "Medium generic pouch"
	build_path = /obj/item/storage/pouch/medium_generic
	materials = list(MATERIAL_BIO_SILK = 8)

/datum/design/bioprinter/pouch/large_generic
	name = "Large generic pouch"
	build_path = /obj/item/storage/pouch/large_generic
	materials = list(MATERIAL_BIO_SILK = 16)

/datum/design/bioprinter/pouch/tubular
	name = "Tubular pouch"
	build_path = /obj/item/storage/pouch/tubular

/datum/design/bioprinter/pouch/tubular/vial
	name = "Tubular vial pouch"
	build_path = /obj/item/storage/pouch/tubular/vial

/datum/design/bioprinter/sling
	name = "Universal sling"
	build_path = /obj/item/clothing/suit/sling

/datum/design/autolathe/gun_upgrade/barrel/excruciator
	name = "New Testament \"EXCRUCIATOR\" giga lens"
	build_path = /obj/item/gun_upgrade/barrel/excruciator

/datum/design/bioprinter/holyvacuum
	name = "\"Tersus\" Vacuum Cleaner"
	build_path = /obj/item/holyvacuum
	materials = list(MATERIAL_BIO_SILK = 2)

