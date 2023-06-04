/obj/structure/closet/syndicate
	name = "armory closet"
	desc = "Why is this here?"
	icon_state = "syndicate"
	req_access = list(access_syndicate) //Stop people getting good stuff without access
	old_chance = -100
	old_lock_odds = -100
	locked = TRUE
	secure = TRUE

/obj/structure/closet/syndicate/personal
	desc = "It's a storage unit for operative gear."

/obj/structure/closet/syndicate/personal/populate_contents()
	new /obj/item/tank/jetpack/oxygen(src)
	new /obj/item/clothing/mask/gas/tactical(src)
	new /obj/item/clothing/gloves/thick/combat(src)
	new /obj/item/clothing/under/syndicate(src)
	new /obj/item/clothing/suit/space/void/merc(src)
	new /obj/item/tool/crowbar(src)
	new /obj/item/card/id/syndicate(src)
	new /obj/item/tool/multitool(src)
	new /obj/item/melee/energy/sword/sabre/dagger(src)
	new /obj/item/shield/buckler/energy(src)
	new /obj/item/gun/projectile/makarov/preloaded(src)
	new /obj/item/ammo_magazine/highcap_pistol_35(src)
	new /obj/item/ammo_magazine/highcap_pistol_35(src)
	new /obj/item/clothing/shoes/magboots(src)
	new /obj/item/storage/pouch/pistol_holster(src)
	new /obj/item/storage/pouch/ammo(src)


/obj/structure/closet/syndicate/suit
	desc = "It's a storage unit for voidsuits."

/obj/structure/closet/syndicate/suit/populate_contents()
	new /obj/item/tank/jetpack/oxygen(src)
	new /obj/item/clothing/shoes/magboots(src)
	new /obj/item/clothing/suit/space/void/merc(src)
	new /obj/item/clothing/mask/gas/tactical(src)


/obj/structure/closet/syndicate/nuclear
	desc = "It's a storage unit for high operative gear."

/obj/structure/closet/syndicate/nuclear/populate_contents()
	new /obj/item/storage/box/handcuffs(src)
	new /obj/item/storage/box/flashbangs(src)
	new /obj/item/gun/energy/firestorm(src)
	new /obj/item/cell/medium/hyper(src)
	new /obj/item/cell/medium/hyper(src)
	new /obj/item/cell/medium/hyper(src)
	new /obj/item/storage/pouch/tubular(src)
	new /obj/item/clothing/suit/space/void/merc(src)
	new /obj/item/shield/buckler/energy(src)
	new /obj/item/melee/energy/sword/sabre(src)
	new /obj/item/clothing/gloves/thick/combat(src)
	new /obj/item/clothing/mask/chameleon/voice(src)

	var/obj/item/device/radio/uplink/U = new(src)
	U.hidden_uplink.uses = 40
	return
