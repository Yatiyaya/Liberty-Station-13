/*
// //==========//
DISCLAIMER: P.P. Plan (Personal Protection Plan)
Natural Weapons are used by superior_mobs inplace of melee_upper/lower damage variable
TLDR: They are capable of inhereting any /obj/ and /item/ proc and variable there is.
God help us.
//==========//
*/
/obj/item/natural_weapon
	name = "natural weapons"
	gender = PLURAL
	attack_verb = list("attacked")
	force = 0
	// Honestly, I don't know how this would conceptually work...
	// Set at your own risk.
	embed_mult = 0
	damtype = BRUTE
	canremove = FALSE
	flags = CONDUCT
	// whether should we show up in attack message, e.g. 'urist has been bit with teeth by carp' vs 'urist has been bit by carp'
	var/show_in_message
	var/mob/living/embedded
	//Here for the sake of Stat_modifier finding it... Sure, give whatever poison now//
	var/poison_per_bite = 0
	var/poison_type = ""

/obj/item/natural_weapon/New(var/mob/living/carbon/superior_animal/M)
	if(M && M.poison_type)
		poison_per_bite += M.poison_per_bite
		poison_type = M.poison_type

/obj/item/natural_weapon/attack_message_name()
	return show_in_message ? ..() : null

/obj/item/natural_weapon/on_embed(mob/user)
	embedded = user
	//Call first so you don't poison yourself.

/obj/item/natural_weapon/on_embed_removal(mob/living/user)
	//Call this last or so god help me.
	embedded = null
	if(!hud_actions)
		return
	for(var/action in hud_actions)
		user.client.screen -= action

/mob/living/carbon/superior_animal/UnarmedAttack(atom/A, proximity)
	. = ..()
	if(!.)
		return

	if(natural_weapon.poison_per_bite > 0)

		if(isliving(A))
			var/mob/living/L = A
			if(istype(L) && L.reagents)
				var/zone_armor =  L.getarmor(targeted_organ, ARMOR_MELEE)
				var/poison_injected = zone_armor ? natural_weapon.poison_per_bite * (-0.01 * zone_armor + 1) : natural_weapon.poison_per_bite
				L.reagents.add_reagent(natural_weapon.poison_type, poison_injected)

//SPIDERS//
/obj/item/natural_weapon/fang
	name = "fangs"
	attack_verb = list("bitten")
	hitsound = 'sound/weapons/bite.ogg'
	force = 14.5
	armor_penetration = 5
	sharp = TRUE

/obj/item/natural_weapon/fang/nurse
	force = 7.5

/obj/item/natural_weapon/fang/nurse/midwife
	force = 12.5

/obj/item/natural_weapon/fang/nurse/recluse
	force = 4
	armor_penetration = 70

/obj/item/natural_weapon/fang/hunter/viper
	force = 22.5

/obj/item/natural_weapon/fang/tarantula/pit
	force = 37.5

/obj/item/natural_weapon/fang/nurse/queen
	force = 25
	armor_penetration = 35

/obj/item/natural_weapon/fang/tarantula/emperor
	force = 25
	armor_penetration = 25
//END SPIDERS

//WURM
/obj/item/natural_weapon/wurm
	name = "teeth"
	attack_verb = list("chomped")
	hitsound = 'sound/weapons/bite.ogg'
	force = 25
	armor_penetration = 5
	sharp = TRUE

/obj/item/natural_weapon/wurm/low
	force = 15

/obj/item/natural_weapon/wurm/high
	force = 40

/obj/item/natural_weapon/wurm/ultra
	force = 55
//*end wurm

//NOT-VOX
/obj/item/natural_weapon/claws
	name = "claws"
	attack_verb = list("clawed", "scratched")
	force = 14
	sharp = TRUE
	edge = TRUE

/obj/item/natural_weapon/claws/strong
	force = 19
	attack_verb = list("mauled", "clawed", "slashed")

/obj/item/natural_weapon/claws/chad
	force = 26
	attack_verb = list("mauled", "clawed", "slashed")

/obj/item/natural_weapon/claws/bananaman
	force = 33.5
	attack_verb = list("mauled", "clawed", "slashed")

/obj/item/natural_weapon/bite
	name = "teeth"
	attack_verb = list("bitten")
	hitsound = 'sound/weapons/bite.ogg'
	force = 10
	armor_penetration = 5
	sharp = TRUE

/obj/item/natural_weapon/bite/weak
	force = 5
	attack_verb = list("bitten", "nipped")

/obj/item/natural_weapon/bite/mouse
	force = 1
	attack_verb = list("nibbled")
	hitsound = null

/obj/item/natural_weapon/claws/weak
	force = 5
	attack_verb = list("clawed", "scratched")

/obj/item/natural_weapon/hooves
	name = "hooves"
	attack_verb = list("kicked")
	force = 5

/obj/item/natural_weapon/pincers
	name = "pincers"
	force = 5
	attack_verb = list("snipped", "pinched")

/obj/item/natural_weapon/drone_slicer
	name = "sharpened leg"
	gender = NEUTER
	attack_verb = list("sliced")
	force = 5
	damtype = BRUTE
	edge = TRUE
	show_in_message = TRUE

/obj/item/natural_weapon/beak
	name = "beak"
	gender = NEUTER
	attack_verb = list("pecked", "jabbed", "poked")
	force = 5
	sharp = TRUE

/obj/item/natural_weapon/punch
	name = "fists"
	attack_verb = list("punched")
	force = 10

/obj/item/natural_weapon/punch/large
	force = 15

/obj/item/natural_weapon/punch/giant
	force = 30

/obj/item/natural_weapon/punch/mushroom
	name = "big fists"
	attack_verb = list("slammed")
	hitsound = 'sound/weapons/bite.ogg'
	force = 15

