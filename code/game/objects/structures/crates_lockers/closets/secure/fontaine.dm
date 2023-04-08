
//Prospector gear, you'll notice it is immensely heavily randomized, this is intentional to add some replayibility to prospector starts.
//To anyone editing this, I advise using if statements over switch to better have control of what loot spawns, it rolls each in order of success so you can better set the odds.
//The lockers are set to personal to prevent prospectors from opening every locker in an effort to get the best gear rolls. -Kazkin
/obj/structure/closet/secure_closet/personal/prospector
	name = "shipbreaker locker"
	req_access = list(access_foreman)
	access_occupy = list(access_prospector)
	icon_state = "prospector" // Mixed dirt/jungle camo for the soul, since they usually brave the jungle a lot. - Seb
	var/main_weapon_cache
	var/side_arm_cache
	var/melee_cache
	var/bag_cache


/obj/structure/closet/secure_closet/personal/prospector/proc/gain_rng()
	main_weapon_cache = pickweight(list("SMG" = 18, "SHOTGUN" = 8, "RIFLE" = 6, "EGUN" = 8))
	side_arm_cache = pickweight(list("PISTOL" = 16, "REVOLVER" = 8, "EGUN_P" = 4))
	melee_cache = pickweight(list("MACHETE" = 18, "KATANA" = 6, "PHAMMER" = 4))
	bag_cache = pickweight(list("INDUSTRIAL" = 36, "DUFFEL" = 28, "MILI" = 16))

/obj/structure/closet/secure_closet/personal/prospector/populate_contents()
	gain_rng()

	new /obj/item/device/radio/headset/headset_pro(src)
	new /obj/item/clothing/accessory/cape/prospie(src)
	new /obj/item/clothing/mask/gas/fontaine(src)

	switch(bag_cache)
		if("INDUSTRIAL")
			if(prob(50))
				new /obj/item/storage/backpack/satchel/industrial(src)
			else
				new /obj/item/storage/backpack/industrial(src)
		if("DUFFEL")
			new /obj/item/storage/backpack/duffelbag(src)
		if("MILI")
			new /obj/item/storage/backpack/military(src)

	//longarms
	switch(main_weapon_cache)
		if("SMG")
			if(prob(50))
				new /obj/item/gun/projectile/automatic/broz(src)
				new /obj/item/ammo_magazine/smg_35(src)
				new /obj/item/ammo_magazine/smg_35(src)
			else
				new /obj/item/gun/projectile/automatic/umbani(src)
				new /obj/item/ammo_magazine/smg_magnum_40(src)
				new /obj/item/ammo_magazine/smg_magnum_40(src)
		if("SHOTGUN")
			new /obj/item/gun/projectile/shotgun/pump(src)
			new /obj/item/ammo_magazine/ammobox/shotgun/scrap_pellet(src)
			new /obj/item/ammo_magazine/speed_loader_shotgun/empty(src)
		if("RIFLE")
			new /obj/item/gun/projectile/automatic/ak47/makeshift(src)
			new /obj/item/ammo_magazine/rifle_75(src)
			new /obj/item/ammo_magazine/rifle_75(src)
			new /obj/item/ammo_magazine/rifle_75(src)
		if("EGUN")
			new /obj/item/gun/energy/laser/makeshift(src)
			new /obj/item/cell/medium(src)
			new /obj/item/cell/medium(src)
			new /obj/item/cell/medium(src)

	//pistols
	new /obj/item/gun/projectile/automatic/slaught_o_matic(src)

	switch(side_arm_cache)
		if("PISTOL")
			if(prob(50))
				new /obj/item/gun/projectile/colt(src)
				new /obj/item/ammo_magazine/magnum_40(src)
				new /obj/item/ammo_magazine/magnum_40(src)
			else
				new /obj/item/gun/projectile/liberty(src)
				new /obj/item/ammo_magazine/highcap_pistol_35(src)
				new /obj/item/ammo_magazine/highcap_pistol_35(src)
		if("REVOLVER")
			new /obj/item/gun/projectile/revolver/frontier(src)
			new /obj/item/ammo_magazine/speed_loader_pistol_35(src)
			new /obj/item/ammo_magazine/speed_loader_pistol_35(src)
		if("EGUN_P")
			new /obj/item/gun/energy/ntpistol(src)
			new /obj/random/powercell/small_safe_lonestar(src)
			new /obj/item/cell/small/high(src)

	//melee

	switch(melee_cache)
		if("MACHETE")
			new /obj/item/clothing/accessory/holster/saber/machete(src)
			new /obj/item/tool/sword/machete(src)
		if("KATANA")
			new /obj/item/tool/sword/katana(src)
			new /obj/item/clothing/accessory/holster/saber/saya(src)
		if("PHAMMER")
			new /obj/item/tool/hammer/powered_hammer(src)


	//Regular spawns
	new /obj/item/tool/knife/dagger(src)
	if(prob(50))
		new /obj/item/gun/projectile/boltgun/flare_gun(src)
		new /obj/item/ammo_casing/flare/blue/prespawn(src)
		new /obj/item/ammo_casing/flare/green/prespawn(src)
		new /obj/item/ammo_casing/flare/prespawn(src)
	else
		new /obj/item/device/lighting/glowstick/flare(src)
		new /obj/item/device/lighting/glowstick/flare(src)
	new /obj/item/device/radio/off(src)

	//Nades
	if(prob(25))
		new /obj/item/grenade/spawnergrenade/manhacks/junkbot(src)
	if(prob(15))
		new /obj/item/grenade/spawnergrenade/manhacks/junkbot(src)


//Salvager lockers have less potential combat power by capped potential while still balancing with the most likely to spawn gear.
//In return they get tools and medical supplies depending on luck with the potential of getting some seriously good spawns. -Kaz
/obj/structure/closet/secure_closet/personal/salvager
	name = "trapper locker"
	req_access = list(access_foreman)
	access_occupy = list(access_prospector)
	icon_state = "oldstyle" // Placeholder for lack of a better salvage-oriented looking locker.
	var/main_weapon_cache
	var/side_arm_cache
	var/melee_cache
	var/bag_cache


/obj/structure/closet/secure_closet/personal/salvager/proc/gain_rng()
	main_weapon_cache = pickweight(list("CROSSBOW" = 12, "SHOTGUN" = 8, "RIFLE" = 6, "EGUN" = 4))
	side_arm_cache = pickweight(list("PISTOL" = 6, "REVOLVER" = 12))
	melee_cache = pickweight(list("MACHETE" = 12, "KATANA" = 8))
	bag_cache = pickweight(list("INDUSTRIAL" = 24, "DUFFEL" = 16, "MILI" = 8))

/obj/structure/closet/secure_closet/personal/salvager/populate_contents()
	gain_rng()

	new /obj/item/device/radio/headset/headset_pro(src)
	new /obj/item/clothing/accessory/cape/prospie(src)
	new /obj/item/clothing/mask/gas/fontaine(src)

	switch(bag_cache)
		if("INDUSTRIAL")
			if(prob(50))
				new /obj/item/storage/backpack/satchel/industrial(src)
			else
				new /obj/item/storage/backpack/industrial(src)
		if("DUFFEL")
			new /obj/item/storage/backpack/duffelbag(src)
		if("MILI")
			new /obj/item/storage/backpack/military(src)

	//longarms
	switch(main_weapon_cache)
		if("CROSSBOW")
			new /obj/item/gun/projectile/shotgun/pump/hunter_crossbow(src)
			new /obj/item/ammo_casing/crossbow_bolts/bulk(src)
			new /obj/item/ammo_casing/crossbow_bolts/bulk(src)
		if("SHOTGUN")
			new /obj/item/gun/projectile/boltgun/lever/shotgun(src)
			new /obj/item/ammo_magazine/ammobox/shotgun/scrap_pellet(src)
			new /obj/item/ammo_magazine/speed_loader_shotgun/empty(src)
		if("RIFLE")
			if(prob(50))
				new /obj/item/gun/projectile/boltgun/rosefield(src)
				new /obj/item/ammo_magazine/speed_loader_light_rifle_257(src)
				new /obj/item/ammo_magazine/speed_loader_light_rifle_257(src)
				new /obj/item/ammo_magazine/speed_loader_light_rifle_257(src)
				new /obj/item/gun_upgrade/scope/acog(src)	//Not great but OK scope.
			else
				new /obj/item/gun/projectile/boltgun(src)
				new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
				new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
				new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
				new /obj/item/gun_upgrade/scope/acog(src)	//Not great but OK scope.
		if("EGUN")
			new /obj/item/gun/energy/cog(src)
			new /obj/random/powercell/medium_safe_lonestar(src)
			new /obj/item/cell/medium(src)


	//pistols
	new /obj/item/gun/projectile/automatic/slaught_o_matic(src)

	switch(side_arm_cache)
		if("PISTOL")
			if(prob(50))
				new /obj/item/gun/projectile/colt(src)
				new /obj/item/ammo_magazine/magnum_40(src)
				new /obj/item/ammo_magazine/magnum_40(src)
			else
				new /obj/item/gun/projectile/liberty(src)
				new /obj/item/ammo_magazine/highcap_pistol_35(src)
				new /obj/item/ammo_magazine/highcap_pistol_35(src)
		if("REVOLVER")
			new /obj/item/gun/projectile/revolver/frontier(src)
			new /obj/item/ammo_magazine/speed_loader_pistol_35(src)
			new /obj/item/ammo_magazine/speed_loader_pistol_35(src)

	//melee
	switch(melee_cache)
		if("MACHETE")
			new /obj/item/clothing/accessory/holster/saber/machete(src)
			new /obj/item/tool/sword/machete(src)
		if("KATANA")
			new /obj/item/tool/sword/katana(src)
			new /obj/item/clothing/accessory/holster/saber/saya(src)

	//Regular Spawns
	new /obj/item/device/radio/headset/headset_pro(src)
	new /obj/item/tool/knife/dagger(src)
	if(prob(50))
		new /obj/item/gun/projectile/boltgun/flare_gun(src)
		new /obj/item/ammo_casing/flare/blue/prespawn(src)
		new /obj/item/ammo_casing/flare/green/prespawn(src)
		new /obj/item/ammo_casing/flare/prespawn(src)
	else
		new /obj/item/device/lighting/glowstick/flare(src)
		new /obj/item/device/lighting/glowstick/flare(src)
	new /obj/item/device/radio/off(src)
	new /obj/item/grenade/spawnergrenade/manhacks/junkbot(src)
	if(prob(50))
		new /obj/item/grenade/spawnergrenade/manhacks/junkbot(src)
	if(prob(20))
		new /obj/item/grenade/spawnergrenade/manhacks/junkbot(src)


//Foremans can technically do the jobs of both prospectors and salvagers (but not as well) and as such have better odds on the gear they start with.
//Still based on proability but hey, at least you get it all. -Kaz
/obj/structure/closet/secure_closet/reinforced/foreman
	name = "field shepherds' locker"
	req_access = list(access_foreman)
	icon_state = "foreman"

//Small note from Trilby: Forman loot picks are basically just the BEST versons of the scav lockers so theirs no doble coin flip
//Also dosnt have a side arm loot spawn but still has the vars for one if someone wants to mirrow it or do something like that in furchture

	var/main_weapon_cache
	var/side_arm_cache
	var/melee_cache
	var/bag_cache

/obj/structure/closet/secure_closet/reinforced/foreman/proc/gain_rng()
	main_weapon_cache = pickweight(list("SMG" = 12, "GOOD_SMG" = 10, "SHOTGUN" = 8, "RIFLE" = 6, "EGUN" = 4))
	side_arm_cache = pickweight(list("PISTOL" = 12, "REVOLVER" = 4, "GOOD_PISTOL" = 10, "HEAVY_PISTOL" = 2, "EGUN_P" = 4))
	bag_cache = pickweight(list("INDUSTRIAL" = 24, "DUFFEL" = 16, "MILI" = 8, "BLUESPACE" = 1))

/obj/structure/closet/secure_closet/reinforced/foreman/populate_contents()
	gain_rng()

	new /obj/item/device/radio/headset/heads/foreman(src)
	new /obj/item/clothing/accessory/cape/prospie(src)
	new /obj/item/clothing/accessory/halfcape/foreman(src)
	new /obj/item/computer_hardware/hard_drive/portable/design/scav/forman(src)
	switch(bag_cache)
		if("INDUSTRIAL")
			if(prob(80))
				new /obj/item/storage/backpack/satchel/industrial(src)
			else
				new /obj/item/storage/backpack/industrial(src)
		if("DUFFEL")
			new /obj/item/storage/backpack/duffelbag(src)
		if("MILI")
			new /obj/item/storage/backpack/military(src)
		if("BLUESPACE")
			new /obj/item/storage/backpack/holding(src)

	//longarms
	switch(main_weapon_cache)
		if("SMG")
			new /obj/item/gun/projectile/automatic/specialist(src)
			new /obj/item/ammo_magazine/smg_35(src)
			new /obj/item/ammo_magazine/smg_35(src)
		if("SHOTGUN")
			new /obj/item/gun/projectile/shotgun/judge(src)
			new /obj/item/ammo_magazine/ammobox/shotgun/scrap_pellet(src)
			new /obj/item/ammo_magazine/speed_loader_shotgun/empty(src)
		if("GOOD_SMG")
			new /obj/item/gun/projectile/automatic/tactical(src)
			new /obj/item/ammo_magazine/smg_magnum_40(src)
			new /obj/item/ammo_magazine/smg_magnum_40(src)
		if("RIFLE")
			new /obj/item/gun/projectile/boltgun/gamer(src)
			new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
			new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
			new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		if("EGUN")
			new /obj/item/gun/energy/cog(src)
			new /obj/random/powercell/medium_safe_lonestar(src)
			new /obj/item/cell/medium(src)
			new /obj/item/cell/medium(src)
	//pistols
	new /obj/item/gun/projectile/automatic/slaught_o_matic(src) //has silver eye


	//Regular spawns
	new /obj/item/tool/knife/dagger(src)
	if(prob(70))
		new /obj/item/gun/projectile/boltgun/flare_gun(src)
		new /obj/item/ammo_casing/flare/blue/prespawn(src)
		new /obj/item/ammo_casing/flare/green/prespawn(src)
		new /obj/item/ammo_casing/flare/prespawn(src)
	else
		new /obj/item/device/lighting/glowstick/flare(src)
		new /obj/item/device/lighting/glowstick/flare(src)
	new /obj/item/device/radio/off(src)
	//Salvager improved
	new /obj/item/storage/belt/utility/full(src)
	new /obj/item/storage/firstaid/regular(src)
	if(prob(70))
		new /obj/item/storage/firstaid/ifak(src)
	else
		new /obj/item/storage/firstaid/combat(src)
	if(prob(40))
		new /obj/item/grenade/spawnergrenade/manhacks/junkbot(src)
	if(prob(20))
		new /obj/item/grenade/spawnergrenade/manhacks/junkbot(src)
