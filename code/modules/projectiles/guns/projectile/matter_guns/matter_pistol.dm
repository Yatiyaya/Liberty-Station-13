/*
Quirky Terra Therma weapon as requested by the department. Insert compressed matter from the Forge into this to fire it.
No more 1 shot guns but hey, at least you no longer need cells and can carry a fat-stack of compressed matter instead.
*/

/obj/item/gun/projectile/matter_gun
	name = "Mk I \"Forger\" compressed-matter pistol"
	desc = "An odd design where a compressed matter cartriage is loaded into the firearm's designated port, effectively producing bullet-like particals."
	icon = 'icons/obj/guns/nano/pistol.dmi'
	icon_state = "forger"
	item_state = "froger"
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_WOOD = 5)
	price_tag = 300
	fire_sound = 'sound/weapons/guns/fire/9mm_pistol.ogg'
	can_dual = TRUE
	damage_multiplier = 1.0
	init_recoil = HANDGUN_RECOIL(0.6)
	gun_tags = list(GUN_PROJECTILE)
	serial_type = "Terra"

	var/projectile_type	= /obj/item/projectile/bullet/pistol_35/nano

	var/max_stored_matter = 50
	var/projectile_cost = 5
	var/stored_matter = 0
	var/matter_type = MATERIAL_COMPRESSED_MATTER

	wield_delay = 0.3 SECOND
	wield_delay_factor = 0.2 // 20 vig

	init_firemodes = list(
		list(mode_name="9mm bullet", mode_desc="fires a 9mm pistol round", projectile_type=/obj/item/projectile/bullet/pistol_35/nano, icon="kill"),
		list(mode_name="flare-shot", mode_desc="fires an illuminating flare of variable colors", projectile_type=/obj/item/projectile/bullet/flare/choas, projectile_cost = 20, icon="grenade"),
	)

/obj/item/gun/projectile/matter_gun/attackby(obj/item/I, mob/user)

	if(!istype(I,/obj/item/stack/sheet))
		..()
	var/obj/item/stack/sheet/M = I
	if(istype(M) && M.name == matter_type)
		var/amount = min(M.get_amount(), round(max_stored_matter - stored_matter))
		if(M.use(amount))
			stored_matter += amount
			to_chat(usr, "You load [amount] [matter_type] into \the [src].")
	else
		return

/obj/item/gun/projectile/matter_gun/consume_next_projectile(mob/user)
	if(stored_matter < projectile_cost) return null
	if(!ispath(projectile_type)) return null

	stored_matter -= projectile_cost
	return new projectile_type(src)

/obj/item/gun/projectile/matter_gun/examine(user)
	. = ..()
	to_chat(user, "It holds [stored_matter]/[max_stored_matter] [matter_type].")


/obj/item/gun/projectile/matter_gun/shotgun
	name = "Mk II \"Forger\" compressed-matter pistol"
	desc = "An odd design where a compressed matter cartriage is loaded into the firearm's designated port, effectively producing bullet-like particals. \
			This version is far more bulkier than its pistol counterpart, but packs quite a punch. Able to fire projectiles that fragment on impact or incendiary rounds."
	icon = 'icons/obj/guns/nano/shotgun.dmi'
	icon_state = "railgun"
	item_state = "railngun"
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	matter = list(MATERIAL_PLASTEEL = 18, MATERIAL_PLASTIC = 6)
	price_tag = 650
	fire_sound = 'sound/weapons/energy/emitter2.ogg'
	can_dual = FALSE
	init_recoil = SHOTGUN_RECOIL(0.8)
	gun_tags = list(GUN_PROJECTILE)
	serial_type = "Terra"

	projectile_type	= /obj/item/projectile/bullet/shotgun/ceramic

	max_stored_matter = 100
	projectile_cost = 10
	stored_matter = 0
	matter_type = MATERIAL_COMPRESSED_MATTER

	wield_delay = 0.5 SECOND
	wield_delay_factor = 0.3 // 30 vig

	init_firemodes = list(
		list(mode_name="ceramic slug", mode_desc="fires a 12 gauge round", projectile_type=/obj/item/projectile/bullet/shotgun/ceramic, icon="kill"),
		list(mode_name="super-heated pellets", mode_desc="fires multiple super-heated pellets akin to buckshot", projectile_type=/obj/item/projectile/bullet/pellet/shotgun/energy, icon="grenade"),
	)
