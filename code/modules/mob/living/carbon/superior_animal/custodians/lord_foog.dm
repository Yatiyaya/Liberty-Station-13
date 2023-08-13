// Lord Foog The Third, departmental pet of the Custodians of Bonfire.

/mob/living/carbon/superior_animal/lord_foog
	name = "Lord Foog"
	desc = "Lord Foog the Third. A silver-coated hunting dog hailing from a cherished breed by the Custodians, \
			belonging to a family of noble Borzois. This slender behemoth possesses a bite force almost twice \
			as strong as a pitbull terrier, all while being trained as proficiently as a Custodian knight."
	icon = 'icons/mob/lord_foog.dmi'
	icon_state = "lordfoog"
	icon_living = "lordfoog"
	icon_dead = "lordfoog_dead"
	attack_sound = 'sound/weapons/bite.ogg' // Chomp!
	gender = "male"
	mob_size = MOB_MEDIUM // GIGANTIC BORZOI
	move_to_delay = 2
	follow_distance = 2
	target_dummy = TRUE
	can_burrow = FALSE // Testing with this off has been hilarious, but no.
	see_in_dark = 10
	maxHealth = 400
	health = 400
	melee_damage_lower = 30
	melee_damage_upper = 40
	stop_automated_movement_when_pulled = TRUE
	sanity_damage = -5 // As with every aspect of Custodians, boosts morale and calms insanity.
	obey_friends = TRUE // We only respond to the Oathpledge.
	friendly_to_colony = TRUE
	colony_friend = TRUE
	cold_protection = TRUE // Long hair, tundra dog
	reagent_immune = TRUE
	known_languages = list(LANGUAGE_COMMON) // Sanity purposes
	mob_classification = CLASSIFICATION_ORGANIC // Does this even modify anything?
	meat_type = /obj/item/reagent_containers/food/snacks/meat
	var/list/true_boss = list() // The only one who can assign new followers
	var/mob/living/carbon/human/owner // Holder of the human friend mob
	var/befriend_job = "Oathpledge" // The title of the job we can befriend. From simplemob code.

/mob/living/carbon/superior_animal/lord_foog/Life()
	..()
	if(owner)
		check_owner_health()

/mob/living/carbon/superior_animal/lord_foog/doTargetMessage()
	. = ..()
	visible_emote("growls sharply in warning!")
	playsound(src, 'sound/effects/creatures/foog_growl.ogg', 50, 0, -3)

/mob/living/carbon/superior_animal/lord_foog/UnarmedAttack(atom/A, proximity)
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && !L.weakened && prob(30))
			if(L.stats.getPerk(PERK_ASS_OF_CONCRETE) || L.stats.getPerk(PERK_BRAWN))
				return
			L.Weaken(3)
			L.visible_message(SPAN_DANGER("[src] performs a takedown bite on \the [L]!"))

	. = ..()

/mob/living/carbon/superior_animal/lord_foog/attackby(obj/item/I, mob/living/user, params)
	..()
	if(istype(I, /obj/item/dog_armor))
		var/old_friends = src.friends.Copy()
		var/old_owner = src.owner
		var/the_boss = list(src.true_boss)
		var/old_health = src.health // If he was hurt before this, carry over the previous Foog's CURRENT health value
		to_chat(user, SPAN_NOTICE("You apply \the [I] to [src]. He huffs in approval, clutching the blade on his muzzle."))
		var/mob/living/carbon/superior_animal/lord_foog/editme = new /mob/living/carbon/superior_animal/lord_foog/armored(src.loc)
		editme.friends += old_friends // Carry over our friends list
		editme.owner = old_owner // Respect our previous owner
		editme.true_boss = the_boss // He is the true (Big) Boss.
		editme.health = old_health
		qdel(src)
		qdel(I)

/mob/living/carbon/superior_animal/lord_foog/proc/check_owner_health()
	if(get_dist(src, owner) >= 2)
		return
	if(owner.stat >= DEAD || owner.health <= HEALTH_THRESHOLD_SOFTCRIT)
		if(prob((owner.stat < DEAD)? 50 : 15))
			var/verb = pick("howls", "whines", "bawls")
			visible_emote(pick("[verb] in distress.", "[verb] anxiously."))
			playsound(loc, 'sound/effects/creatures/death_whine.ogg', 50, 1)
			return


		if(prob(5))
			var/msg5 = (pick("nuzzles [owner], demanding cuddles",
							   "randomly licks [owner]'s hand",
							   "rests their head on top of [owner]'s feet",
							   "wags their tail, panting and looking expectantly at [owner]"))
			src.visible_message("<span class='name'>[src]</span> [msg5].")

	if(owner.health <= 50)
		if(prob(15))
			var/verb = pick("barks", "yaps", "woofs")
			visible_emote("[verb] anxiously.")
			playsound(loc, 'sound/effects/creatures/barking.ogg', 50, 1)

// He will cry if you die. Fluff pet behavior.
// Also assigns the Oathpledge as the one that can make Foog obey others.
/mob/living/carbon/superior_animal/lord_foog/verb/befriend()
	set name = "Become Friends"
	set category = "IC"
	set src in view(1)

	if(true_boss && usr == owner) // If we're already friends, don't put us twice on the list.
		set_dir(get_dir(src, owner))
		visible_emote("barks! He has already recognised you as his master!")
		playsound(loc, 'sound/voice/bark2.ogg', 50, 1)
		return

	if(ishuman(usr))
		var/mob/living/carbon/human/H = usr
		if(H.job == befriend_job && H.get_core_implant(/obj/item/implant/core_implant/cruciform)) // Needs a functional hearthcore installed, no cheesing
			friends += usr // We are part of the list, required for him to obey our commands
			owner = usr // We are the one they cling to emotionally
			true_boss += usr // Acknowledge us as the one that can assign more friends for the dog to follow
			set_dir(get_dir(src, owner))
			visible_emote("barks! He looks at you with eyes of undying loyalty now.")
			playsound(loc, 'sound/voice/bark2.ogg', 50, 1)
			return

	to_chat(usr, SPAN_NOTICE("[src] tilts his head to the side, totally ignoring your unworthiness."))
	return

/mob/living/carbon/superior_animal/lord_foog/armored
	desc = "A dark-silver armored hunting dog hailing from a cherished breed by the Custodians. \
			The true menace of maintenance, protector of colonists and the true warden of the Stronghold, \
			glorifying the Foog family with might and fluffiness."
	icon_state = "lordfoog_armored"
	icon_living = "lordfoog_armored"
	icon_dead = "lordfoog_armored_dead"
	maxHealth = 500
	health = 500
	melee_damage_lower = 40
	melee_damage_upper = 50 // Sharp knife on his mouth
	armor = list(melee = 30, bullet = 20, energy = 30, bomb = 10, bio = 100, rad = 100) // Armored doggo!
	cold_protection = TRUE
	heat_protection = TRUE // Fireproof armor
	attacktext = "slashed"

