// Lord Foog The Third, departmental pet of the Custodians of Bonfire and loyal pet of the Oathpledge.

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
	can_burrow = FALSE // I forgot to assign this and it was hilarious on testing, but no.
	see_in_dark = 10
	maxHealth = 400
	health = 400
	melee_damage_lower = 30
	melee_damage_upper = 40
	stop_automated_movement_when_pulled = TRUE
	sanity_damage = -5 // As with every aspect of Custodians, boosts morale and keeps insanity at bay.
	obey_friends = TRUE // We only respond to the Oathpledge, and those they ordain to.
	friendly_to_colony = TRUE
	colony_friend = TRUE
	cold_protection = TRUE // Long hair, tundra dog
	reagent_immune = TRUE
	pixel_x = 0
	pixel_y = 0
	default_pixel_x = 0
	default_pixel_y = 0
	known_languages = list(LANGUAGE_COMMON) // Sanity purposes
	mob_classification = CLASSIFICATION_ORGANIC // Does this even modify anything?
	follow_message = "perks up his ears and starts following you."
	stop_message = "huffs, stopping in place."
	deathmessage = "whimpers in agony, its knees trembling before falling to the ground, quiet and lifeless."
	meat_type = /obj/item/reagent_containers/food/snacks/meat
	holder_type = /obj/item/holder/lord_foog
	var/list/true_boss = list() // The only one who can assign new followers
	var/mob/living/carbon/human/owner // Holder of the human friend mob
	var/befriend_job = "Oathpledge" // The title of the job we can befriend. From simplemob code.
	var/weapon = null // Used when armored so that it drops the sword it holds on its maw.
	var/deathsound = 'sound/effects/creatures/foog_death.ogg' // The sound we make once dead. Used only once then nulled, hence the need for the var.

/mob/living/carbon/superior_animal/lord_foog/New(loc)
	..(loc)
	pixel_x = 0
	pixel_y = 0
	default_pixel_x = 0
	default_pixel_y = 0
	stats.addPerk(PERK_TERRIBLE_FATE) // His death is demoralizing to all Custodians. Or people with feelings.

/mob/living/carbon/superior_animal/lord_foog/Life()
	..()
	if(owner)
		check_owner_health()

/mob/living/carbon/superior_animal/lord_foog/death()
	..()
	if(deathsound)
		playsound(loc, deathsound, 50, 1) // Pain peko
		deathsound = null // So that it doesn't cry again, while dead, when gibbed/butchered
	if(weapon)
		new weapon (src.loc)
		weapon = null // So that butchering him doesn't dupe a sword.

/mob/living/carbon/superior_animal/lord_foog/doTargetMessage()
	. = ..()
	visible_emote("growls sharply in warning!")
	playsound(src, 'sound/effects/creatures/foog_growl.ogg', 50, 0, -3)

/mob/living/carbon/superior_animal/lord_foog/examine(mob/user)
	..()
	// Display a very necessary tooltip so that people don't have to codedive for this
	to_chat(user, SPAN_NOTICE("Say \"Obey\" followed by a character's name to have him obey that person's \"Follow\" and \"Stop\" commands \
								or \"Ignore\" (name) to remove them from the list of people he obeys. You must first use the \
								\"Become Friends\" verb via right click for him to obey you. Only Oathpledge can use said verb."))

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
		if(stat != DEAD)
			var/old_friends = src.friends.Copy()
			var/old_owner = src.owner
			var/the_boss = list(src.true_boss)
			var/old_health_perc = round((src.health * 100) / src.maxHealth, 1) // If he was hurt before this, carry over the previous Foog's CURRENT health percentage...
			to_chat(user, SPAN_NOTICE("You apply the [I] to [src]. He huffs in approval, clutching the blade on his muzzle."))
			var/mob/living/carbon/superior_animal/lord_foog/editme = new /mob/living/carbon/superior_animal/lord_foog/armored(src.loc)
			editme.stats.addPerk(PERK_TERRIBLE_FATE)
			editme.pixel_x = 0
			editme.pixel_y = 0
			editme.default_pixel_x = 0 // I hate this but for some reason, the dog starts at x-7 and some extra so just to make sure
			editme.default_pixel_y = 0
			editme.friends += old_friends // Carry over our friends list
			editme.owner = old_owner // Respect our previous owner
			editme.true_boss = the_boss // He is the true (Big) Boss.
			editme.adjustBruteLoss(round(editme.maxHealth - (editme.maxHealth * (old_health_perc / 100)))) // ...And apply the same total health percentage as BRUTE DAMAGE to our current health.
			editme.updatehealth() // This is for examine text purposes.
			qdel(src)
			qdel(I)
		else
			to_chat(user, SPAN_WARNING("He is not a Cid. It is pointless to don the armor on a dead dog."))
			return

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
		if(H.job == befriend_job && H.get_core_implant(/obj/item/implant/core_implant/hearthcore)) // Needs a functional hearthcore installed, no cheesing
			friends += usr // We are part of the list, required for him to obey our commands
			owner = usr // We are the one they cling to emotionally
			true_boss += usr // Acknowledge us as the one that can assign more friends for the dog to follow
			set_dir(get_dir(src, owner))
			visible_emote("barks! He looks at you with eyes of undying loyalty now.")
			playsound(loc, 'sound/voice/bark2.ogg', 50, 1)
			return

	to_chat(usr, SPAN_NOTICE("[src] snubs at you, turning his muzzle away, ignoring your unworthiness."))
	return

/obj/item/holder/lord_foog
	name = "Lord Foog"
	desc = "He looks so afraid... maybe he's acrophobic?"
	icon = 'icons/mob/lord_foog.dmi'
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_holder.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_holder.dmi',
		slot_back_str = 'icons/inventory/back/mob.dmi',
	)
	item_state_slots = list(
		slot_back_str = "lordfoog", slot_l_hand_str = "lordfoog", slot_r_hand_str = "lordfoog"
		)
	icon_state = "lordfoog_holder"
	icon_state_dead = "lordfoog_dead"
	item_state = "lordfoog"
	w_class = ITEM_SIZE_HUGE // NO PUTTING HIM ON BACKPACKS, HE'S MASSIVE.
	slot_flags = SLOT_BACK

/obj/item/holder/lord_foog/armored
	desc = "Ouch oof, heavy doggo made even heavier by armor!"
	icon_state = "lordfoog_holder_armor"
	icon_state_dead = "lordfoog_armored_dead"
	item_state_slots = list(
		slot_back_str = "lordfoog_armored", slot_l_hand_str = "lordfoog_armored", slot_r_hand_str = "lordfoog_armored"
		)
	slowdown_hold = 1.5 // Gigantic ARMORED Borzoi
	slowdown = 0.5 // Carrying him on your back is comfier for you.

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
	armor = list(melee = 50, bullet = 20, energy = 30, bomb = 10, bio = 100, rad = 100) // Armored doggo!
	cold_protection = TRUE
	heat_protection = TRUE // Fireproof armor, custodian artifice
	attacktext = "slashed"
	attack_sound = 'sound/weapons/renderslash.ogg' // Sword on his mouth.
	weapon = /obj/item/tool/sword/custodian/shortsword // If he dies, it will fall off his mouth.
	holder_type = /obj/item/holder/lord_foog/armored // I feel sorry for the back of whoever carries this dog.

