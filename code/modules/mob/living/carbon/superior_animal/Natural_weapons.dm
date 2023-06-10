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
	force = 5
	armor_penetration = ARMOR_PEN_GRAZING
	sharp = FALSE
	edge = FALSE
	// Honestly, I don't know how this would conceptually work...
	// Set at your own risk.
	embed_mult = 0
	damtype = BRUTE
	canremove = FALSE
	flags = CONDUCT
	unacidable = 1
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
	return show_in_message ? ..() : FALSE

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
	hitsound = 'sound/weapons/spiderlunge.ogg'
	force = 14.5
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

/obj/item/natural_weapon/fang/tarantula/grosse_schmerzen
	force = 45
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
//*End of NOT-VOX

//PSI-THINGS
/obj/item/natural_weapon/psi_monster
	name = "???"
	hitsound = list('sound/xenomorph/alien_claw_flesh1.ogg','sound/xenomorph/alien_claw_flesh2.ogg',
								 'sound/xenomorph/alien_claw_flesh3.ogg', 'sound/xenomorph/alien_tail_attack.ogg')
	force = 12.5

/obj/item/natural_weapon/psi_monster/ponderous
	attack_verb = list("punched")
	force = 16.5
	armor_penetration = ARMOR_PEN_MASSIVE

/obj/item/natural_weapon/psi_monster/hovering_nightmare
	force = 22.5
	armor_penetration = ARMOR_PEN_EXTREME

/obj/item/natural_weapon/psi_monster/hovering_nightmare
	force = 16
	armor_penetration = 45

/obj/item/natural_weapon/psi_monster/memory
	armor_penetration = 15

/obj/item/natural_weapon/psi_monster/memory/attack(obj/item/I, mob/living/user, params)
	force = rand(12,31)
	. = ..()

/obj/item/natural_weapon/psi_monster/flesh_tower
	force = 7.5

/obj/item/natural_weapon/psi_monster/ploge
	force = WEAPON_FORCE_DANGEROUS
	armor_penetration = ARMOR_PEN_HALF

/obj/item/natural_weapon/psi_monster/flesh_behemoth
	hitsound = 'sound/xenomorph/alien_footstep_charge1.ogg'
	attack_verb = list("carved")
	force = 35
	armor_penetration = ARMOR_PEN_MODERATE

/obj/item/natural_weapon/psi_monster/mind_gazer
	attack_verb = list("rammed")
	force = 27.5
	armor_penetration = ARMOR_PEN_DEEP

/obj/item/natural_weapon/psi_monster/ash_wendigo
	force = 27.5
	armor_penetration = ARMOR_PEN_HALF

/obj/item/natural_weapon/psi_monster/cerebral_crusher
	hitsound = 'sound/xenomorph/alien_footstep_charge1.ogg'
	attack_verb = list("slammed")
	force = 35
	armor_penetration = 35

/obj/item/natural_weapon/psi_monster/wasonce
	hitsound = 'sound/xenomorph/alien_footstep_charge1.ogg'
	attack_verb = list("delivered a crushing blow to")
	force = 32.5

/obj/item/natural_weapon/psi_monster/wasonce/crimson_jelly
	armor_penetration = ARMOR_PEN_HALF

/obj/item/natural_weapon/psi_monster/wasonce/crimson_jelly/pitch_horror
	armor_penetration = 70

/obj/item/natural_weapon/psi_monster/Dreaming
	name = "???"
	hitsound = 'sound/xenomorph/alien_footstep_charge1.ogg'
	attack_verb = list("delivered a devastating blow to")
	force = 55
	armor_penetration = 65


/obj/item/natural_weapon/shell_hound
	name = "sharpened bone"
	attack_verb = list("carved")
	hitsound = 'sound/weapons/bigcut.ogg'
	force = 25
	armor_penetration = ARMOR_PEN_EXTREME

/obj/item/natural_weapon/daskvey_follower
	name = "deepblue blade"
	hitsound = 'sound/weapons/rapidslice.ogg'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	damtype = BURN
	force = 26
	armor_penetration = ARMOR_PEN_MODERATE
	sharp = TRUE
	edge = TRUE
	show_in_message = FALSE

/obj/item/natural_weapon/daskvey_follower/cleaver
	name = "solar eclipse"
	hitsound = 'sound/weapons/slice.ogg'
	force = 33

/obj/item/natural_weapon/daskvey_follower/gunner
	name = "\"Blue Moon\" psi-plasma rifle"
	hitsound = 'sound/weapons/blunthit.ogg'
	attack_verb = list("bashes", "butts", "thwacks")
	damtype = BRUTE
	force = 9
	sharp = FALSE
	edge = FALSE

/obj/item/natural_weapon/daskvey_follower/shielder
	name = "daskvey shield"
	hitsound = 'sound/weapons/blunthit.ogg'
	attack_verb = list("destablizes", "ruins", "wrecks")
	damtype = BRUTE
	force = 22.5

/obj/item/natural_weapon/daskvey_follower/halberd
	name = "daskvey halberd"
	hitsound = 'sound/weapons/slice.ogg'
	damtype = BRUTE
	force = 33
	armor_penetration = ARMOR_PEN_MASSIVE

/obj/item/natural_weapon/daskvey_follower/weakling
	name = "daskvey fists"
	hitsound = list('sound/weapons/punch1.ogg','sound/weapons/punch2.ogg','sound/weapons/punch3.ogg','sound/weapons/punch4.ogg'
					)
	force = 15
	sharp = FALSE
	edge = FALSE

/obj/item/natural_weapon/daskvey_follower/weakling/attack(mob/living/M, mob/living/user, target_zone)
	var/daskvey = pick(BRUTE, BURN)
	switch(daskvey)
		if(BURN)
			damtype = daskvey
			heat = force
			sharp = FALSE
		if(BRUTE)
			damtype = daskvey
			heat = 0
			sharp = TRUE
	return ..()

/obj/item/natural_weapon/daskvey
	name = "Daskvey's toe-beans"
	attack_verb = list("mauled", "clawed", "slashed", "slammed", "rended", "cleaved", "skewered")
	hitsound = 'sound/weapons/renderslash.ogg'
	force = 50
	armor_penetration = 35
	sharp = TRUE
	edge = TRUE
	show_in_message = FALSE
//*end Psi-Things

/*
#define TERMITE_DMG_LOW 15
#define TERMITE_DMG_MED 25
#define TERMITE_DMG_HIGH 40
#define TERMITE_DMG_ULTRA 55
*/
//TERMITE
/obj/item/natural_weapon/termite
	name = "mandibles"
	attack_verb = list("chomped")
	hitsound = 'sound/weapons/bite.ogg'
	force = 15 //much ouch, very pen.
	armor_penetration = 15
	sharp = TRUE
	edge = TRUE

/obj/item/natural_weapon/termite/medium
	force = 25

/obj/item/natural_weapon/termite/high
	force = 40
//*end TERMITE

//ROBOTS
/obj/item/natural_weapon/drone
	name = "sharpened leg"
	gender = NEUTER
	attack_verb = list("hit", "pierced", "sliced", "attacked")
	hitsound = 'sound/weapons/slice.ogg' //So we dont make bite sounds
	force = 7.5
	damtype = BRUTE
	edge = TRUE
	show_in_message = FALSE

//For build-a-drone... Maybe do something with it later
/obj/item/natural_weapon/drone/custom
	force = 12.5

//spanish inquisition
/obj/item/natural_weapon/church/bishop //Bonk them with the scorch
	name = "staff"
	gender = NEUTER
	attack_verb = list("slapped")
	hitsound = null
	force = 6.5
	armor_penetration = ARMOR_PEN_EXTREME
	damtype = BURN
	show_in_message = TRUE

/obj/item/natural_weapon/church/knight //uses the custodian shortsword. Inherits it's AP.
	name = "ulfberht"
	gender = NEUTER
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	force = 50
	armor_penetration = ARMOR_PEN_DEEP
	sharp = TRUE
	edge = TRUE
	show_in_message = TRUE

/obj/item/natural_weapon/church/pawn //knights have shortsword, so pawn has axe. Inherits it's AP.
	name = "horseman axe"
	gender = NEUTER
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	force = 35
	armor_penetration = ARMOR_PEN_EXTREME
	sharp = TRUE
	edge = TRUE
	show_in_message = TRUE

/obj/item/natural_weapon/church/rook
	name = "man hands"
	attack_verb = list("slammed")
	hitsound = list('sound/weapons/genhit1.ogg', 'sound/weapons/genhit2.ogg', 'sound/weapons/genhit3.ogg')
	force = 65
	sharp = FALSE
	edge = FALSE
	show_in_message = FALSE

/obj/item/natural_weapon/church/rook/apply_hit_effect(mob/living/target, mob/living/user, hit_zone, var/query = null, var/accelerant = 0)
	. = ..()
	//We don't trash the dead. First hit never crunches
	if(!(query == target))
		query = target
		accelerant = 0
	if(is_dead(target))
		accelerant = 0
	accelerant++
	if(prob(accelerant*5))
		if(accelerant >= 5)
			for(var/atom/movable/AM in target.loc)
				if(AM != src)
					AM.ex_act(accelerant/2)
			target.loc.ex_act(accelerant/5)
		target.fall_impact(0, accelerant)
		playsound(user, 'sound/xenomorph/alien_bite2.ogg',65,1)
		accelerant = 0



/obj/item/natural_weapon/mining_drill
	name = "diamond-point mining drill"
	attack_verb = list("hit", "pierced", "sliced", "attacked")
	hitsound = 'sound/weapons/sharphit.ogg'
	force = WEAPON_FORCE_DANGEROUS * 1.15
	armor_penetration = ARMOR_PEN_EXTREME
	sharp = TRUE
	edge = FALSE

/obj/item/natural_weapon/mining_drill/similacrum //mining drone's big brother
	hitsound = 'sound/mecha/mechdrill.ogg'
	force = 42.5

/obj/item/natural_weapon/similacrum/custodian
	name = "bucket"
	force = 9
	show_in_message = FALSE

/obj/item/natural_weapon/similacrum/allied
	name = "Problem Be-Goner"
	attack_verb = list("hit", "pierced", "sliced", "attacked")
	hitsound = 'sound/weapons/sharphit.ogg'
	force = 12.5
	armor_penetration = ARMOR_PEN_SHALLOW
	sharp = TRUE

/obj/item/natural_weapon/similacrum/phazon
	name = "power fist"
	attack_verb = list("slammed")
	hitsound = 'sound/xenomorph/alien_footstep_charge1.ogg'
	force = 52.5

/obj/item/natural_weapon/roomba/knife
	name = "sharp knife"
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/sharphit.ogg'
	force = 14.5
	armor_penetration = ARMOR_PEN_SHALLOW
	sharp = TRUE
	edge = TRUE
	structure_damage_factor = STRUCTURE_DAMAGE_BLADE

/obj/item/natural_weapon/roomba/baton
	name = "telescopic baton"
	attack_verb = list("smacked", "struck", "slapped")
	hitsound = 'sound/effects/woodhit.ogg'
	force = 9.5
	structure_damage_factor = STRUCTURE_DAMAGE_BLUNT
//*end ROBOTS

//ROACHEM
/obj/item/natural_weapon/bite/weak //sharp teeth enjoy armor
	name = "teeth"
	attack_verb = list("bitten")
	hitsound = 'sound/weapons/bite.ogg'
	force = 7.5
	armor_penetration = ARMOR_PEN_MODERATE
	sharp = TRUE

/obj/item/natural_weapon/bite/tazntz
	force = 10
	armor_penetration = 35

/obj/item/natural_weapon/bite/roachling
	force = 2
	armor_penetration = ARMOR_PEN_HALF
	attack_verb = list("nibbled")
	hitsound = null

/obj/item/natural_weapon/bite/medium
	force = 12.5

/obj/item/natural_weapon/bite/hunter
	force = WEAPON_FORCE_PAINFUL


/obj/item/natural_weapon/bite/bluespace
	force = 25
	armor_penetration = 100

/obj/item/natural_weapon/bite/fuhrer
	force = 27.5
	armor_penetration = ARMOR_PEN_EXTREME

/obj/item/natural_weapon/bite/kaiser
	force = 30
	armor = 75

///////////////////////////////////////////////////////////////////

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

