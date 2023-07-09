/mob/living/carbon/superior_animal/liberty
	name = "mob template"
	desc = "You should not be seeing this. Scream at the top of your lungs if you do."
	icon = 'icons/mob/mobs-monster.dmi'
	speak_emote = list("clicks")
	icon_state = "ventrofacius"
	icon_dead = "ventrofacius_dead"
	attacktext = "chomped"
	attack_sound = 'sound/weapons/bite.ogg'
	faction = "fauna"
	wander = TRUE
	fire_verb = "shoots"
	see_in_dark = 10
	sanity_damage = 1
	destroy_surroundings = TRUE

	ranged = FALSE

	maxHealth = 100
	health = 100

	melee_damage_lower = 10
	melee_damage_upper = 15

	armor = list(melee = 30, bullet = 40, energy = 35, bomb = 25, bio = 100, rad = 100)

	//inherent_mutations = list(MUTATION_BLINDNESS, MUTATION_DWARFISM, MUTATION_NERVOUSNESS, MUTATION_DEAF, MUTATION_IMBECILE) - Cant be used so dont track these
	contaminant_immunity = TRUE
	cold_protection = 1000
	heat_protection = 100
	breath_required_type = 0
	breath_poison_type = 0
	min_breath_required_type = 0
	min_breath_poison_type = 0
	min_air_pressure = 0 //below this, brute damage is dealt
	max_air_pressure = 10000 //above this, brute damage is dealt
	min_bodytemperature = 0 //below this, burn damage is dealt
	max_bodytemperature = 10000 //above this, burn damage is dealt
	friendly_to_colony = FALSE
	/* Armor related variables - Soj edit we have are own
	var/melee = 0
	var/bullet = 0
	var/energy = 0
	var/bomb = 0
	var/bio = 0
	var/rad = 0

	 Damage multiplier when destroying surroundings*/
	var/surrounds_mult = 0.5

	// The ennemy of all wurmkind
	//var/obj/machinery/mining/drill/DD

	//Controller that spawned the wurm
	//var/datum/wurm_controller/controller

	range_telegraph = "starts to wobble at"

/mob/living/carbon/superior_animal/liberty/ventrofacius
	name = "vicious Ventrofacius"
	desc = "A strange creature looking akin to some sort of crustation being, sporting two discolored claws jutting from atop its odd fur-covered shell."
	icon_state = "ventrofacius"
	icon_dead = "ventrofacius_dead"
	melee_damage_lower = 15
	melee_damage_upper = 20
	maxHealth = 75 //Less health than a noraml person.
	health = 75
	move_to_delay = 3

/mob/living/carbon/superior_animal/liberty/magnibrachius
	name = "deranged Magnibrachius"
	desc = "A strange creature looking akin to some sort of crustation being, sporting a pair of 'legs' that appear to act more like hands, and arms it commonly walks on - while not attempting to smash a target, that is!"
	icon_state = "magnibrachius"
	icon_dead = "magnibrachius_dead"
	attacktext = "smashed"
	attack_sound = 'sound/weapons/blunthit.ogg'
	melee_damage_lower = 25
	melee_damage_upper = 30
	maxHealth = 175 //More health than a noraml person.
	health = 175
	move_to_delay = 7

/mob/living/carbon/superior_animal/liberty/oculamia
	name = "antagonized Oculamia"
	desc = "A strange serpentoid creature with three visible arms topped with curved hard tips, its fourth arm is broken off or otherwise malformed."
	icon_state = "oculamia"
	icon_dead = "oculamia_dead"

	ranged = TRUE
	ranged_cooldown = 1
	projectilesound = 'sound/effects/creatures/acid_spit.ogg'
	projectiletype = /obj/item/projectile/bullet/rock/ice
	rapid = FALSE
	comfy_range = 5

	melee_damage_lower = 10
	melee_damage_upper = 15
	maxHealth = 125 //More health than a noraml person.
	health = 125
	move_to_delay = 7

/mob/living/carbon/superior_animal/liberty/corrupted_pirs
	name = "corrupted PIRS Neurophyta"
	desc = "A strange amalgimation of flesh and machine, sporting pieces of what looks like an PIRS employee merged with one of their own scientific creations."
	icon_state = "neurophyta_pirs"
	icon_dead = "neurophyta_pirs_dead"
	attacktext = "slashed"
	attack_sound = 'sound/weapons/sharphit.ogg'
	melee_damage_lower = 25
	melee_damage_upper = 30
	move_to_delay = 4

	maxHealth = 125 //More health than a noraml person.
	health = 125

/mob/living/carbon/superior_animal/liberty/corrupted_watch
	name = "corrupted Watchman Neurophyta"
	desc = "A strange amalgimation of flesh, sporting pieces of what looks like an member of the colony's Watch. Albiet near bursting from its armor with the strange new flesh it sports."
	icon_state = "neurophyta_watch"
	icon_dead = "neurophyta_watch_dead"

	range_telegraph = "takes aim at"
	ranged = TRUE
	comfy_range = 7
	rapid = FALSE
	ranged_cooldown = 2
	projectiletype = /obj/item/projectile/bullet/rifle_75
	projectilesound = 'sound/weapons/guns/fire/lmg_fire.ogg'

/mob/living/carbon/superior_animal/liberty/corrupted_fontaine
	name = "corrupted Fontaine Neurophyta"
	desc = "A strange amalgimation of flesh, sporting pieces of what looks like an employee of Fontaine. Its right arm has grown massively in size while its left has become limp!"
	icon_state = "neurophyta_fontaine"
	icon_dead = "neurophyta_fontaine_dead"

	maxHealth = 75 //Less health than a noraml person.
	health = 75

	attacktext = "smashed"
	attack_sound = 'sound/weapons/blunthit.ogg'
	melee_damage_lower = 35
	melee_damage_upper = 40
	move_to_delay = 6

/mob/living/carbon/superior_animal/liberty/corrupted_custodian
	name = "corrupted Custodian turret"
	desc = "A strange amalgimation of flesh over atop a still burning Custodian turret. This mutated creature taking hold of the turret appears to let it move some; but more importatly re-program the turret!"
	icon_state = "neurophyta_custodianturret"
	icon_dead = "neurophyta_custodianturret_dead"

	range_telegraph = "takes aim at"
	ranged = TRUE
	comfy_range = 7
	rapid = FALSE
	ranged_cooldown = 3
	projectiletype = /obj/item/projectile/flamer_lob		//For funny burning
	projectilesound = 'sound/weapons/energy/vaporize.ogg'

	move_to_delay = 10000		//Someone needs to properly somehow set this thing as unable to move. Not sure how to do this off-hand in a rush like this.
