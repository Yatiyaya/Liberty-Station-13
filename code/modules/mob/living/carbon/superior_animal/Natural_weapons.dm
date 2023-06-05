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
	// Maybe set the natural weapon to make a new one when it embeds?
	embed_mult = 0
	damtype = BRUTE
	canremove = FALSE
	siemens_coefficient = 1
	permeability_coefficient = 0.05
	// whether should we show up in attack message, e.g. 'urist has been bit with teeth by carp' vs 'urist has been bit by carp'
	var/show_in_message

/obj/item/natural_weapon/New(loc, ...)
	. = ..()
	//average of 0.5, somewhat better than regular gloves' 0.75
	siemens_coefficient = pick(0,0.1,0.3,0.5,0.5,0.75,1.35)

/obj/item/natural_weapon/attack_message_name()
	return show_in_message ? ..() : null
/*
/obj/item/natural_weapon/can_embed()
	return FALSE
*/
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

/obj/item/natural_weapon/bite/strong
	force = 20

/obj/item/natural_weapon/bite/painful
	force = 35

/obj/item/natural_weapon/bite/grosse_schmerzen
	force = 50

/obj/item/natural_weapon/claws
	name = "claws"
	attack_verb = list("mauled", "clawed", "slashed")
	force = 10
	sharp = TRUE
	edge = TRUE

/obj/item/natural_weapon/claws/strong
	force = 25

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

