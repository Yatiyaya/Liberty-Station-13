#define REPAIR_COST 25

//////////////////////////////////////////////////
/////////         OATHBOUND             /////////
//////////////////////////////////////////////////

/datum/ritual/cruciform/oathbound
	name = "cruciform"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform
	category = "Oathbound"
	ignore_stuttering = TRUE

/datum/ritual/targeted/cruciform/oathbound
	name = "cruciform targeted"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform
	category = "Oathbound"
	ignore_stuttering = TRUE

datum/ritual/cruciform/oathbound/fireball
	name = "Manifestation of Flames"
	phrase = "Oxidate Lecture: Manifestation of Flames"
	desc = "Create a launchable fireball on a free hand."
	power = 35

/datum/ritual/cruciform/oathbound/fireball/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/obj/item/gun/custodian_fireball/flame = new /obj/item/gun/custodian_fireball(src, lecturer)
	lecturer.visible_message(
		"As [lecturer] speaks, their hand is covered in a fierce blue fireball.",
		"A blue fireball completely covers one of your hands."
		)
	playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
	usr.put_in_hands(flame)
	return TRUE

/obj/item/gun/custodian_fireball
	name = "radiant fireball"
	desc = "A summoned fireball that dissapears if dropped."
	icon = 'icons/obj/guns/projectile/fireball.dmi'
	icon_state = "fireball_lecture"
	item_state = "fireball_lecture"
	origin_tech = list()
	fire_sound = 'sound/weapons/wave.ogg'
	fire_sound_text = "fireball"
	max_upgrades = 0
	slot_flags = null
	w_class = ITEM_SIZE_HUGE
	var/projectile_type = /obj/item/projectile/custodian_fireball // What does it shoot
	var/use_amount = 1 // How many times can it be used
	var/mob/living/carbon/holder // Used to delete when dropped
	serial_shown = FALSE
	safety = FALSE

/obj/item/gun/custodian_fireball/New(var/loc, var/mob/living/carbon/lecturer)
	..()
	holder = lecturer
	START_PROCESSING(SSobj, src)

/obj/item/gun/custodian_fireball/consume_next_projectile()
	if(!ispath(projectile_type)) // Do we actually shoot something?
		return null
	if(use_amount <= 0) //Are we out of charges?
		return null
	use_amount -= 1
	return new projectile_type(src)

/obj/item/gun/custodian_fireball/Process()
	if(loc != holder || (use_amount <= 0)) // We're no longer in the lecturer's hand or we're out of charges.
		visible_message("The [src] fades into nothingness.")
		STOP_PROCESSING(SSobj, src)
		qdel(src)
		return

/obj/item/projectile/custodian_fireball
	name = "fireball"
	icon_state = "fireball_lecture"
	damage_types = list(BURN = WEAPON_FORCE_NORMAL)

/obj/item/projectile/custodian_fireball/on_impact(atom/target)
	biomatter_attack(target, 20)
	return TRUE

/* might exist eventually, might not

/obj/item/gun/custodian_fireball/explosion
	projectile_type = /obj/item/projectile/custodian_bigfireball

/obj/item/projectile/custodian_bigfireball
	name = "fireball"
	icon_state = "fireball_lecture"
	var/list/explosion_values = list(0, 1, 2, 4) // Explosions strengths, same value as a regular missile.

/obj/item/projectile/custodian_bigfireball/on_impact(atom/target)
	explosion(loc, explosion_values[1], explosion_values[2], explosion_values[3], explosion_values[4])
	return TRUE

datum/ritual/cruciform/oathbound/fireball_big
	name = "Manifestation of Inferno"
	phrase = "Oxidate Lecture: Manifestation of Inferno"
	desc = "Create a launchable exploding fireball on a free hand."
	power = 25

/datum/ritual/cruciform/oathbound/fireball_big/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/obj/item/gun/custodian_fireball/explosion/flame = new /obj/item/gun/custodian_fireball/explosion(src, lecturer)
	lecturer.visible_message(
		"As [lecturer] speaks, their hand is covered in a fierce blue fireball.",
		"A blue fireball completely covers one of your hands."
		)
	playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
	usr.put_in_hands(flame)
	return TRUE
*/

/datum/ritual/cruciform/oathbound/eyeflare
	name = "Eyeflare"
	phrase = "Oxidate Lecture: Eyeflare"
	desc = "This lecture causes a bright flash in a short radius around the user."
	power = 30

/datum/ritual/cruciform/oathbound/eyeflare/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C)
	for(var/mob/living/carbon/M in view(2, H))
		if(issuperioranimal(M))
			M.Weaken(10)
		var/safety = M.eyecheck()
		if(safety < FLASH_PROTECTION_MINOR)
			M.flash(3, FALSE, FALSE, TRUE)
	H.visible_message("A flash of light flares out of [H]!")
	return TRUE

/datum/ritual/cruciform/oathbound/radiance_neural
	name = "Radiance Neural Expression"
	phrase = "Oxidate Lecture: Radiance Neural Expression"
	desc = "You impart a portion of your inner peace on another, gifting them with insight beyond what they are normally capable of. In doing so, you sacrifice some of your own. Requires thirty minutes between uses."
	cooldown = TRUE
	cooldown_time = 30 MINUTES
	cooldown_category = "radiance_neural"
	power = 65

/datum/ritual/cruciform/oathbound/radiance_neural/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/T = get_front_human_in_range(user, 1)
	if(!T)
		fail("No target in front of you.", user, C)
		return FALSE
	to_chat(T, SPAN_NOTICE("You feel slightly better as your pain eases."))
	to_chat(user, SPAN_NOTICE("You ease the pain of [T.name]."))

	if(user.sanity.insight >= 25 && user.species?.reagent_tag != IS_SYNTHETIC && T.species?.reagent_tag != IS_SYNTHETIC)
		user.sanity.insight -= 25
		T.sanity.insight += 50
		to_chat(user, "<span class='info'>You offer your insight to [T.name], your meditation boosting another, allowing them a glimpse at your perceptions.</span>")
		to_chat(T, "<span class='info'>You feel inspired, a new perspective offered by another, showing you the same picture from a different angle.</span>")
		set_personal_cooldown(user)
	else
		to_chat(user, SPAN_WARNING("You lack the personal insight to impart more to another, time and meditation will allow you to try again."))
		return FALSE
	return TRUE


/datum/ritual/cruciform/oathbound/searing_of_torment
	name = "Searing of Torment"
	phrase = "Oxidate Lecture: Searing of Torment"
	desc = "A short lecture that removes all pain and heals some damage, requires fifteen minutes between uses."
	power = 50
	cooldown = TRUE
	cooldown_time = 15 MINUTES
	cooldown_category = "searing"

/datum/ritual/cruciform/oathbound/searing_of_torment/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C)
	H.reagents.add_reagent("nepenthe", 10)
	H.adjustBruteLoss(-10)
	H.adjustFireLoss(-10)
	H.adjustOxyLoss(-20)
	H.adjustBrainLoss(-5)
	H.updatehealth()
	set_personal_cooldown(H)
	return TRUE

/datum/ritual/cruciform/oathbound/scorching_shell
	name = "Scorching Shell"
	phrase = "Oxidate Lecture: Scorching Shell"
	desc = "A lecture fashioned after the idea that body and mind can be a fixed point. For five minutes, the speaker slows down drastically, but reduces all damage they \
	may recieve by half, letting them remain as they are for longer."
	cooldown = TRUE
	cooldown_time = 30 MINUTES
	cooldown_category = "scorching_shell"
	effect_time = 5 MINUTES
	power = 90
	var/brute_mod_oathbound
	var/burn_mod_oathbound
	var/toxin_mod_oathbound
	var/oxygen_mod_oathbound

/datum/ritual/cruciform/oathbound/scorching_shell/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	brute_mod_oathbound = (user.brute_mod_perk * 0.5)
	user.brute_mod_perk -= brute_mod_oathbound

	burn_mod_oathbound = (user.burn_mod_perk * 0.5)
	user.burn_mod_perk -= burn_mod_oathbound

	toxin_mod_oathbound = (user.toxin_mod_perk * 0.5)
	user.toxin_mod_perk -= toxin_mod_oathbound

	oxygen_mod_oathbound = (user.oxy_mod_perk * 0.5)
	user.oxy_mod_perk -= oxygen_mod_oathbound

	user.slowdown += 1

	to_chat(user, SPAN_NOTICE("You feel your body stiffening, your stout refusal to change slowing down the world around you as you remain at a fixed point."))
	set_personal_cooldown(user)
	addtimer(CALLBACK(src, .proc/discard_effect, user), src.effect_time)
	return TRUE

/datum/ritual/cruciform/oathbound/scorching_shell/proc/discard_effect(mob/living/carbon/human/user, amount)
	user.brute_mod_perk += brute_mod_oathbound
	user.burn_mod_perk += burn_mod_oathbound
	user.toxin_mod_perk += toxin_mod_oathbound
	user.oxy_mod_perk += oxygen_mod_oathbound
	user.slowdown -= 1
	to_chat(user, SPAN_NOTICE("Your body feels lighter, weaker, you've returned to normal."))

/datum/ritual/cruciform/oathbound/scorching_smite
	name = "Scorching Smite"
	phrase = "Oxidate Lecture: Scorching Smite"
	desc = "A short lecture activated in the middle of battle, empowers the user's melee strikes for thirty seconds. Takes five minutes to recharge."
	cooldown = TRUE
	cooldown_time = 5 MINUTES
	cooldown_category = "scorching_smite"
	effect_time = 30 SECONDS
	power = 25
	var/wrath_damage = 0.2

/datum/ritual/cruciform/oathbound/scorching_smite/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	user.damage_multiplier += wrath_damage
	to_chat(user, SPAN_NOTICE("You feel righteous wrath empowering you with immense but fleeting strength!"))
	set_personal_cooldown(user)
	addtimer(CALLBACK(src, .proc/discard_effect, user), src.effect_time)
	return TRUE

/datum/ritual/cruciform/oathbound/scorching_smite/proc/discard_effect(mob/living/carbon/human/user, amount)
	user.damage_multiplier -= wrath_damage
	to_chat(user, SPAN_NOTICE("Your wrath subsides"))

/datum/ritual/cruciform/oathbound/restraint_conflagration
	name = "Restraint Conflagration"
	phrase = "Oxidate Lecture: Restraint Conflagration"
	desc = "A lecture that emboldens the body and muscles for fifteen minutes. Requires thirty minutes between uses."
	cooldown = TRUE
	cooldown_time = 30 MINUTES
	cooldown_category = "restraint_conflagration"
	effect_time = 15 MINUTES
	power = 90

/datum/ritual/cruciform/oathbound/restraint_conflagration/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	user.stats.changeStat(STAT_TGH, 10)
	user.stats.changeStat(STAT_ROB, 10)
	to_chat(user, SPAN_NOTICE("You feel emboldened, your body growing in strength and fortitude."))
	set_personal_cooldown(user)
	addtimer(CALLBACK(src, .proc/discard_effect, user), src.effect_time)
	return TRUE

/datum/ritual/cruciform/oathbound/restraint_conflagration/proc/discard_effect(mob/living/carbon/human/user, amount)
	user.stats.changeStat(STAT_TGH, -10)
	user.stats.changeStat(STAT_ROB, -10)
	to_chat(user, SPAN_NOTICE("You no longer feel emboldened."))

/datum/ritual/cruciform/oathbound/ignite_flesh
	name = "Ignite Flesh"
	phrase = "Oxidate Lecture: Ignite Flesh"
	desc = "Recite the lecture to ignite the surrounding bodies of those without a Hearthcore."
	power = 60

/datum/ritual/cruciform/oathbound/ignite_flesh/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	for(var/mob/living/carbon/M in view(2, user))
		if(!M.get_core_implant(/obj/item/implant/core_implant/cruciform))
			biomatter_attack(M, 10)
	user.visible_message("A wave of flame radiates out from [user]!")
	return TRUE

//////////////////////////////////////////////////
/////////         ENKINDLED             /////////
//////////////////////////////////////////////////

/datum/ritual/cruciform/enkindled
	name = "cruciform"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform
	category = "Enkindled"
	ignore_stuttering = TRUE

/datum/ritual/targeted/cruciform/enkindled
	name = "cruciform targeted"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform
	category = "Enkindled"
	ignore_stuttering = TRUE

/datum/ritual/cruciform/enkindled/succour
	name = "Succour"
	phrase = "Oxidate Lecture: Succour"
	desc = "Heal a nearby Hearthcore user. Has a five minute cooldown"
	cooldown = TRUE
	cooldown_time = 5 MINUTES
	cooldown_category = "succour"
	power = 35

/datum/ritual/cruciform/enkindled/succour/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform)

	if(!CI || !CI.active || !CI.wearer)
		fail("Hearthcore not found.", user, C)
		return FALSE

	var/mob/living/carbon/human/H = CI.wearer

	if(!istype(H))
		fail("Target not found.",user,C,targets)
		return FALSE

	//Checking turfs allows this to be done in unusual circumstances, like if both are inside the same mecha
	var/turf/T = get_turf(user)
	if (!(T.Adjacent(get_turf(H))))
		to_chat(user, SPAN_DANGER("[H] is beyond your reach.."))
		return FALSE

	user.visible_message("[user] places their hands upon [H]", "You lay your hands upon [H]")
	if (do_after(user, 40, H, TRUE))
		T = get_turf(user)
		if (!(T.Adjacent(get_turf(H))))
			to_chat(user, SPAN_DANGER("[H] is beyond your reach.."))
			return FALSE
		log_and_message_admins(" healed [CI.wearer] with the Succour lecture")
		to_chat(H, "<span class='info'>A sensation of relief bathes you, washing away your pain</span>")
		H.add_chemical_effect(CE_PAINKILLER, 20)
		H.adjustBruteLoss(-30)
		H.adjustFireLoss(-30)
		H.updatehealth()
		set_personal_cooldown(user)
		return TRUE

/datum/ritual/cruciform/enkindled/convalescence
	name = "Convalescence"
	phrase = "Oxidate Lecture: Convalescence"
	desc = "Recover from the ravages of wounds and pain, has a five minute cooldown."
	cooldown = TRUE
	cooldown_time = 5 MINUTES
	cooldown_category = "convalescence"
	power = 25 //Healing yourself is slightly easier than healing someone else

/datum/ritual/cruciform/enkindled/convalescence/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C,list/targets)
	if(H.species?.reagent_tag == IS_SYNTHETIC)
		to_chat(H, SPAN_WARNING("You fail to cast the litany due to your non-organic body..."))
		return FALSE
	to_chat(H, "<span class='info'>A sensation of relief bathes you, washing away your pain.</span>")
	H.reagents.add_reagent("laudanum", 5)
	H.adjustBruteLoss(-15)
	H.adjustFireLoss(-15)
	H.adjustOxyLoss(-20)
	H.sanity.changeLevel(10)
	H.updatehealth()
	set_personal_cooldown(H)
	return TRUE

/datum/ritual/cruciform/enkindled/graceful_repose
	name = "Graceful Repose"
	phrase = "Oxidate Lecture: Graceful Repose"
	desc = "A tricky litany that heals the mind and body of those around you from esoteric maladies such as genetic malignance or brain damage. Has a fifteen minute cooldown."
	cooldown = TRUE
	cooldown_time = 15 MINUTES
	cooldown_category = "grepose"
	power = 50

/datum/ritual/cruciform/enkindled/graceful_repose/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/list/people_around = list()
	for(var/mob/living/carbon/human/H in view(user))
		people_around.Add(H)

	if(people_around.len > 0)
		to_chat(user, SPAN_NOTICE("Your feel the air thrum with an inaudible vibration."))
		playsound(user.loc, 'sound/machines/signal.ogg', 50, 1)
		for(var/mob/living/carbon/human/participant in people_around)
			to_chat(participant, SPAN_NOTICE("You hear a silent signal..."))
			heal_other(participant)
			add_effect(participant, FILTER_HOLY_GLOW, 25)
		set_personal_cooldown(user)
		return TRUE
	else
		fail("Your Hearthcore sings, alone, unto the void.", user, C)
		return FALSE

/datum/ritual/cruciform/enkindled/graceful_repose/proc/heal_other(mob/living/carbon/human/participant)
		to_chat(participant, "<span class='info'>A sensation of relief bathes you, washing away your most of your pain in body and mind</span>")
		participant.reagents.add_reagent("anodyne", 10)
		participant.adjustCloneLoss(-20)
		participant.adjustBrainLoss(-20)
		participant.updatehealth()

/datum/ritual/cruciform/enkindled/healing_word
	name = "Healing Word"
	phrase = "Oxidate Lecture: Healing Word"
	desc = "Heal every person you can see for a fair amount. This lecture has a cooldown of 15 minutes."
	cooldown = TRUE
	power = 50
	cooldown_time = 15 MINUTES
	cooldown_category = "healingword" //Shares a cooldown because with the future tiered lecture system this should replace cauterization hymn

/datum/ritual/cruciform/enkindled/healing_word/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/list/people_around = list()
	for(var/mob/living/carbon/human/H in view(user))
		people_around.Add(H)

	if(people_around.len > 0)
		to_chat(user, SPAN_NOTICE("Your feel the air thrum with an inaudible vibration."))
		playsound(user.loc, 'sound/machines/signal.ogg', 50, 1)
		for(var/mob/living/carbon/human/participant in people_around)
			to_chat(participant, SPAN_NOTICE("You hear a silent signal..."))
			heal_other(participant)
			add_effect(participant, FILTER_HOLY_GLOW, 25)
		set_personal_cooldown(user)
		return TRUE
	else
		fail("Your Hearthcore finds nobody to help.", user, C)
		return FALSE

/datum/ritual/cruciform/enkindled/healing_word/proc/heal_other(mob/living/carbon/human/participant)
		to_chat(participant, "<span class='info'>A sensation of relief bathes you, washing away your some of your pain</span>")
		participant.reagents.add_reagent("laudanum", 10)
		participant.adjustBruteLoss(-20)
		participant.adjustFireLoss(-20)
		participant.adjustOxyLoss(-40)
		participant.adjustBrainLoss(-5)
		participant.updatehealth()

/datum/ritual/cruciform/enkindled/realignment
	name = "Realignment"
	phrase = "Oxidate Lecture: Realignment"
	desc = "Heals all toxins and liver damage, purges all toxic chemical reagents and stimulants in the blood stream, and slows down anyone in front of you while curing all addictions. Has a fifteen minute cooldown."
	power = 50
	cooldown = TRUE
	cooldown_time = 15 MINUTES
	cooldown_category = "realignment"

/datum/ritual/cruciform/enkindled/realignment/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/T = get_front_human_in_range(user, 1)
	if(!T)
		fail("No target in front of you.", user, C)
		return FALSE
	to_chat(T, SPAN_NOTICE("You feel yourself growing more focused with each passing second."))
	to_chat(user, SPAN_NOTICE("You grant [T.name] cleansing."))

	T.reagents.add_reagent("alignitol", 10)
	set_personal_cooldown(user)

	return TRUE

//datum/ritual/cruciform/enkindled/blood_transmuting NOT FOR NOW

/datum/ritual/cruciform/enkindled/revival_lecture
	name = "Revival"
	phrase = "Oxidate Lecture: Revival"
	desc = "Consume parts of a Hearthcore to jumpstart a deceased user's life functions, mending any present neural degeneration. Has a thirty minute cooldown."
	power = 100
	cooldown = TRUE
	cooldown_time = 30 MINUTES
	cooldown_category = "revival"

/datum/ritual/cruciform/enkindled/revival_lecture/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/M = get_victim(user)
	var/obj/item/implant/core_implant/cruciform/CI = M.get_core_implant(/obj/item/implant/core_implant/cruciform, FALSE)

	if (!CI)
		fail("[M] doesn't have a Hearthcore installed.", user, C)
		return FALSE

	if (CI.get_module(CRUCIFORM_DAMAGED))
		fail("[M]'s Hearthcore is damaged from a previous Revival lecture.", user, C)
		return FALSE

	if(!M.client && !M.teleop)
		for(var/mob/observer/ghost/ghost in GLOB.player_list)
			if(ghost.mind == M.mind)
				to_chat(ghost, "<b><font color = #330033><font size = 3>Someone is attempting to resuscitate you. Re-enter your body if you want to be revived!</b> (Verbs -> Ghost -> Re-enter corpse)</font></font>")
		fail("[M]'s mind does not respond, continued attempts may bear fruit.", user, C)
		return FALSE

	GLOB.dead_mob_list.Remove(M)
	GLOB.living_mob_list += M

	M.adjustOxyLoss(-10) //Same as a regular defib
	M.timeofdeath = 0
	M.stat = UNCONSCIOUS //Life() can bring them back to consciousness if it needs to.
	M.failed_last_breath = 0 //So mobs that died of oxyloss don't revive and have perpetual out of breath.

	M.emote("gasp")
	M.Weaken(rand(10,25))
	M.updatehealth()

	var/rngStatRemoved
	switch(M.stats.getStat(STAT_MEC))
		if(0 to 40)
			rngStatRemoved = pick(1,2,3,4,5,6,7,8)
			M.stats.changeStat(STAT_MEC, -rngStatRemoved)
		if(40 to 60)
			rngStatRemoved = pick(8,9,10,11,12)
			M.stats.changeStat(STAT_MEC, -rngStatRemoved)
		if(60 to INFINITY)
			rngStatRemoved = pick(12,13,14,15,16,17,18,19,20)
			M.stats.changeStat(STAT_MEC, -rngStatRemoved)
	log_and_message_admins("Removed [-rngStatRemoved] to the MEC stat of [M]")
	switch(M.stats.getStat(STAT_BIO))
		if(0 to 40)
			rngStatRemoved = pick(1,2,3,4,5,6,7,8)
			M.stats.changeStat(STAT_BIO, -rngStatRemoved)
		if(40 to 60)
			rngStatRemoved = pick(8,9,10,11,12)
			M.stats.changeStat(STAT_BIO, -rngStatRemoved)
		if(60 to INFINITY)
			rngStatRemoved = pick(12,13,14,15,16,17,18,19,20)
			M.stats.changeStat(STAT_BIO, -rngStatRemoved)
	log_and_message_admins("Removed [-rngStatRemoved] to the BIO stat of [M]")
	switch(M.stats.getStat(STAT_COG))
		if(0 to 40)
			rngStatRemoved = pick(1,2,3,4,5,6,7,8)
			M.stats.changeStat(STAT_COG, -rngStatRemoved)
		if(40 to 60)
			rngStatRemoved = pick(8,9,10,11,12)
			M.stats.changeStat(STAT_COG, -rngStatRemoved)
		if(60 to INFINITY)
			rngStatRemoved = pick(12,13,14,15,16,17,18,19,20)
			M.stats.changeStat(STAT_COG, -rngStatRemoved)
	log_and_message_admins("Removed [-rngStatRemoved] to the COG stat of [M]")
	switch(M.stats.getStat(STAT_ROB))
		if(0 to 40)
			rngStatRemoved = pick(1,2,3,4,5,6,7,8)
			M.stats.changeStat(STAT_ROB, -rngStatRemoved)
		if(40 to 60)
			rngStatRemoved = pick(8,9,10,11,12)
			M.stats.changeStat(STAT_ROB, -rngStatRemoved)
		if(60 to INFINITY)
			rngStatRemoved = pick(12,13,14,15,16,17,18,19,20)
			M.stats.changeStat(STAT_ROB, -rngStatRemoved)
	log_and_message_admins("Removed [-rngStatRemoved] to the ROB stat of [M]")
	switch(M.stats.getStat(STAT_TGH))
		if(0 to 40)
			rngStatRemoved = pick(1,2,3,4,5,6,7,8)
			M.stats.changeStat(STAT_TGH, -rngStatRemoved)
		if(40 to 60)
			rngStatRemoved = pick(8,9,10,11,12)
			M.stats.changeStat(STAT_TGH, -rngStatRemoved)
		if(60 to INFINITY)
			rngStatRemoved = pick(12,13,14,15,16,17,18,19,20)
			M.stats.changeStat(STAT_TGH, -rngStatRemoved)
	log_and_message_admins("Removed [-rngStatRemoved] to the TGH stat of [M]")
	switch(M.stats.getStat(STAT_VIG))
		if(0 to 40)
			rngStatRemoved = pick(1,2,3,4,5,6,7,8)
			M.stats.changeStat(STAT_VIG, -rngStatRemoved)
		if(40 to 60)
			rngStatRemoved = pick(8,9,10,11,12)
			M.stats.changeStat(STAT_VIG, -rngStatRemoved)
		if(60 to INFINITY)
			rngStatRemoved = pick(12,13,14,15,16,17,18,19,20)
			M.stats.changeStat(STAT_VIG, -rngStatRemoved)
	log_and_message_admins("Removed [-rngStatRemoved] to the VIG stat of [M]")

	switch(M.stats.getStat(STAT_TGH)) //no advanced pads here, hit them with the harsh code
		if(-200 to 40)
			M.stats.addPerk(PERK_REZ_SICKNESS_FATAL)
			log_and_message_admins("Added fatal rez sickness to [M].")
		if(40 to 60)
			M.stats.addPerk(PERK_REZ_SICKNESS_SEVERE)
			log_and_message_admins("Added severe rez sickness to [M].")
		if(60 to INFINITY)
			M.stats.addPerk(PERK_REZ_SICKNESS)
			log_and_message_admins("Added mild rez sickness to [M].")

	CI.add_module(new CRUCIFORM_DAMAGED) //CRUCIFORM_DAMAGED is a module used to prevent using Revival on a person more than once without repairing the Hearthcore

	return TRUE

//////////////////////////////////////////////////
/////////         FORGEMASTER             /////////
//////////////////////////////////////////////////

/datum/ritual/cruciform/forgemaster
	name = "cruciform"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform
	category = "Forgemaster"
	ignore_stuttering = TRUE

/datum/ritual/targeted/cruciform/forgemaster
	name = "cruciform targeted"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform
	category = "Forgemaster"
	ignore_stuttering = TRUE

/datum/ritual/cruciform/forgemaster/empowering_flames
	name = "Empowering Flames"
	desc = "Consume some Radiance to charge a power cell you are holding."
	phrase = "Oxidate Lecture: Empowering Flames"
	cooldown = TRUE
	cooldown_time = 0 MINUTES
	cooldown_category = "charging"
	power = 0 // Do not use the power in one shot
	var/charge_used = 10 // Amount of cruciform energy used.
	var/charge_rate = 20 // The delay between each charge? The number is in deciseconds, so 30 is equal to 3 seconds

/datum/ritual/cruciform/forgemaster/empowering_flames/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	set_personal_cooldown(user)
	var/inhand = user.get_active_hand()
	if(istype(inhand, /obj/item/cell))
		var/obj/item/cell/P = inhand
		if(P.max_chargerate == 0) // Can we even charge the damn thing.
			fail("This type of cell cannot be charged.", user, C)
			return
		to_chat(user, "You start charging the [P.name].")
		while(C.power >= charge_used) // Keep going until we run out of power
			if(!istype(user.get_active_hand(), /obj/item/cell)) // Check if we're still holding a cell. Because rigged cell explode when charging.
				break
			if(P.fully_charged()) // Leave the loop if the cell is charged.
				break
			if(do_after(user, charge_rate)) // Small delay where the user must stand still
				C.power -= charge_used // We use some juicy cruciform power
				P.give(charge_used * 10) // Charge the power cell
			else
				break // Leave the loop if we interrupt.
		to_chat(user, "You finish charging the [P.name]. It is now [P.percent()]% charged.")
	else
		fail("You need a power cell in your active hand to charge it.", user, C)

/datum/ritual/cruciform/forgemaster/tools_of_bonfire
	name = "Tools of Bonfire"
	phrase = "Oxidate Lecture: Tools of Bonfire"
	desc = "Channels the power of your Hearthcore into an incorporeal omnitool."
	power = 40
	cooldown = TRUE
	cooldown_time = 2 MINUTES
	cooldown_category = "omnitool_litany"
	success_message = "Your hand glows with radiant light, and you feel more in tune with the machinery around you."

/datum/ritual/cruciform/forgemaster/tools_of_bonfire/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/obj/item/tool/factorial_omni/tool = new /obj/item/tool/factorial_omni(src, user)
	usr.put_in_active_hand(tool)
	set_personal_cooldown(user)
	return TRUE

//datum/ritual/cruciform/forgemaster/flame_guidance - Refer to code\modules\core_implant\cruciform\rituals\construction.dm

//datum/ritual/cruciform/forgemaster/weak_manifestation - Refer to code\modules\core_implant\cruciform\rituals\construction.dm

/datum/ritual/cruciform/forgemaster/nerve_learning
	name = "Nerve Learning"
	phrase = "Oxidate Lecture: Nerve Learning"
	desc = "This lecture will command a Hearthcore upgrade to attach to a person's Hearthcore. They must lie on a Board of Opposites with the upgrade near them."
	power = 20

/datum/ritual/cruciform/forgemaster/nerve_learning/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/H = get_victim(user)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform)
	if(!H)
		fail("No target.", user, C)
		return FALSE

	if(!CI)
		fail("[H] doesn't have a Hearthcore installed.", user, C)
		return FALSE
	if(CI.upgrade)
		fail("Hearthcore already has an upgrade installed.", user, C)
		return FALSE

	var/list/L = get_front(user)

	var/obj/item/cruciform_upgrade/CU = locate(/obj/item/cruciform_upgrade) in L

	if(!CU)
		fail("There is no Hearthcore upgrade nearby.", user, C)
		return FALSE

	if(!(H in L))
		fail("Hearthcore upgrade is too far from [H].", user, C)
		return FALSE

	if(CU.active)
		fail("Hearthcore upgrade is already active.", user, C)
		return FALSE

	if(!H.lying || !locate(/obj/machinery/optable/altar) in L)
		fail("[H] must lie on the Board.", user, C)
		return FALSE

	if(!CU.install(H, CI) || CU.wearer != H)
		fail("Commitment failed.", user, C)
		return FALSE

	return TRUE

/datum/ritual/cruciform/forgemaster/greater_empower
	name = "Greater Empower"
	phrase = "Oxidate Lecture: Greater Empower"
	desc = "This lecture transfers Radiance from your own Hearthcore to another Hearthcore user, draining 20 Radiance to grant the same amount."
	power = 20

/datum/ritual/cruciform/forgemaster/greater_empower/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform)
	var/mob/living/carbon/human/H = get_victim(user)

	if(!H)
		fail("Target not found.",user,C,targets)
		return FALSE

	if(!CI || !CI.active || !CI.wearer)
		fail("Hearthcore not found.", user, C)
		return FALSE

	user.visible_message("[user] places their hands upon [H]", "You lay your hands upon [H]")
	if (do_after(user, 40, H, TRUE))
		var/turf/T = get_turf(user)
		if (!(T.Adjacent(get_turf(H))))
			to_chat(user, SPAN_DANGER("[H] is beyond your reach.."))
			return FALSE
		to_chat(H, "<span class='info'>Your cruciform sings a small tune as it gets charged.</span>")

		CI.restore_power(20)

		return TRUE

/datum/ritual/cruciform/forgemaster/iron_will
	name = "Lecture of Iron Will"
	phrase = "Oxidate Lecture: Lecture of Iron Will"
	desc = "Repair a person's mechanical organs and limbs or a mechanical creature in front of you."
	power = 75

/datum/ritual/cruciform/forgemaster/iron_will/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/target = get_victim(user)
	var/synth = FALSE

	if(!target)
		fail("There's nothing there.",user,C)
		return FALSE

	if(issilicon(target))
		target.adjustBruteLoss(-30)
		add_effect(target, FILTER_HOLY_GLOW, 25) // Make them glow.
		return TRUE

	for(var/obj/item/organ/augmentic in target) // Run this loop for every organ the person has
		if(augmentic.nature == MODIFICATION_SILICON) // Are the organ made of metal?
			synth = TRUE
			augmentic.heal_damage(20)
			to_chat(target, "Your [augmentic.name] repairs itself!")

	if(!synth)
		fail("No mechanical organs or limbs found.",user,C)
		return FALSE

	add_effect(target, FILTER_HOLY_GLOW, 25)
	return TRUE

//datum/ritual/cruciform/forgemaster/medium_manifestation - Refer to code\modules\core_implant\cruciform\rituals\construction.dm

//datum/ritual/cruciform/forgemaster/strong_manifestation - Refer to code\modules\core_implant\cruciform\rituals\construction.dm

//////////////////////////////////////////////////
/////////         OATHPLEDGE             /////////
//////////////////////////////////////////////////

/datum/ritual/cruciform/oathpledge
	name = "cruciform"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform
	category = "Oathpledge"
	ignore_stuttering = TRUE

/datum/ritual/targeted/cruciform/oathpledge
	name = "cruciform targeted"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform
	category = "Oathpledge"
	ignore_stuttering = TRUE

/datum/ritual/cruciform/oathpledge/scrying
	name = "Scrying"
	phrase = "Oxidate Lecture: Scrying"
	desc = "Look into the world from the eyes of another Hearthcore user. Can only be maintained for half a minute and the target will sense they are being watched, but not by whom."
	power = 100

/datum/ritual/cruciform/oathpledge/scrying/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	if(!user.client)
		return FALSE

	var/mob/living/M = pick_disciple_global(user, TRUE)
	if (!M)
		return FALSE

	if(user == M)
		fail("You feel stupid.",user,C,targets)
		return FALSE

	var/obj/item/implant/core_implant/cruciform/target = M.get_core_implant(/obj/item/implant/core_implant/cruciform)
	if (target.get_module(CRUCIFORM_ANTI_SCRYING))
		to_chat(user, SPAN_NOTICE("That Hearthcore user has blocked Scrying attempts."))
		return FALSE

	to_chat(user, SPAN_NOTICE("Your vision shifts."))
	to_chat(M, SPAN_NOTICE("You feel an odd presence in the back of your mind. A lingering sense that someone is watching you..."))

	var/mob/observer/eye/god/eye = new/mob/observer/eye/god(M)
	eye.target = M
	eye.owner_mob = user
	eye.owner_loc = user.loc
	eye.owner = eye
	user.reset_view(eye)

	//After 30 seconds, your view is forced back to yourself
	addtimer(CALLBACK(user, .mob/proc/reset_view, user), 300)

	return TRUE

/datum/ritual/cruciform/oathpledge/reimagining //re-named convalescence to give it to Enkindled and Oathpledge but not give the entire category
	name = "Reimagining"
	phrase = "Oxidate Lecture: Reimagining"
	desc = "Recover from the ravages of wounds and pain, has a five minute cooldown."
	cooldown = TRUE
	cooldown_time = 5 MINUTES
	cooldown_category = "reimagining"
	power = 25 //Healing yourself is slightly easier than healing someone else

/datum/ritual/cruciform/oathpledge/reimagining/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C,list/targets)
	if(H.species?.reagent_tag == IS_SYNTHETIC)
		to_chat(H, SPAN_WARNING("You fail to cast the litany due to your non-organic body..."))
		return FALSE
	to_chat(H, "<span class='info'>A sensation of relief bathes you, washing away your pain.</span>")
	H.reagents.add_reagent("laudanum", 5)
	H.adjustBruteLoss(-15)
	H.adjustFireLoss(-15)
	H.adjustOxyLoss(-20)
	H.sanity.changeLevel(10)
	H.updatehealth()
	set_personal_cooldown(H)
	return TRUE

/datum/ritual/cruciform/oathpledge/commitment
	name = "Commitment"
	phrase = "Oxidate Lecture: Commitment"
	desc = "This lecture will command a Hearthcore to attach to a person lying on a Board of Opposites. The Hearthcore must lay near them, and will require the Epiphany lecture to fully activate."

/datum/ritual/cruciform/oathpledge/commitment/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/H = get_victim(user)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform, FALSE)
	if(CI)
		fail("[H] already has a Hearthcore installed.", user, C)
		return FALSE

	var/list/L = get_front(user)

	CI = locate(/obj/item/implant/core_implant/cruciform) in L

	if(!CI)
		fail("There is no Hearthcore on this one", user, C)
		return FALSE

	if (H.stat == DEAD)
		fail("It is too late for this one, they are already dead.", user, C)
		return FALSE

	if(!(H in L))
		fail("Hearthcore is too far from [H].", user, C)
		return FALSE

	if(CI.active)
		fail("Hearthcore already active.", user, C)
		return FALSE

	if(!H.lying || !locate(/obj/machinery/optable/altar) in L)
		fail("[H] must lie on the altar.", user, C)
		return FALSE

	if(!CI.install(H, BP_CHEST, user) || CI.wearer != H)
		fail("Commitment failed.", user, C)
		return FALSE

	if(ishuman(H))
		var/mob/living/carbon/human/M = H
		var/obj/item/organ/external/E = M.organs_by_name[BP_CHEST]
		for (var/i = 0; i < 5;i++)
			E.take_damage(5, sharp = FALSE)
			//Deal 25 damage in five hits. Using multiple small hits mostly prevents internal damage

		M.custom_pain("You feel the nails of the Hearthcore drive deep into you!",1)
		M.update_implants()
		M.updatehealth()

	return TRUE

/datum/ritual/cruciform/oathpledge/epiphany
	name = "Epiphany"
	phrase = "Oxidate Lecture: Epiphany"
	desc = "This lecture will command an unused Hearthcore to activate. The subject must lay on a Board of Opposites."

/datum/ritual/cruciform/oathpledge/epiphany/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform, FALSE)

	if(!CI)
		fail("There is no Hearthcore on this one.", user, C)
		return FALSE

	if(!CI.wearer)
		fail("Hearthcore is not installed.", user, C)
		return FALSE

	if(CI.activated || CI.active)
		fail("This Hearthcore has been used before.", user, C)
		return FALSE

	if (CI.wearer.stat == DEAD)
		fail("It is too late for this one, they are dead.", user, C)
		return FALSE

	log_and_message_admins("successfully baptized [CI.wearer]")
	to_chat(CI.wearer, "<span class='info'>Your Hearthcore vibrates and warms up.</span>")

	CI.activate()

	return TRUE

/datum/ritual/cruciform/oathpledge/deprivation
	name = "Deprivation"
	phrase = "Oxidate Lecture: Deprivation"
	desc = "This litany will command a Hearthcore to detach from its bearer, if the one bearing it is dead."

/datum/ritual/cruciform/oathpledge/deprivation/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform, FALSE)

	if(!CI)
		fail("There is no Hearthcore on this one", user, C)
		return FALSE

	if(!CI.wearer)
		fail("Hearthcore is not installed.", user, C)
		return FALSE

	var/mob/M = CI.wearer

	if(ishuman(M) && is_dead(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/E = H.organs_by_name[BP_CHEST]
		E.take_damage(15)
		H.custom_pain("You feel the Hearthcore ripping out of your chest!",1)
		CI.name = "[M]'s Hearthcore"
		CI.uninstall()
		return TRUE

	else if(ismob(M) && is_dead(M)) //Cruciforms can't normally be placed on non-humans, but this is still here for sanity purposes.
		CI.name = "[M]'s Hearthcore"
		CI.uninstall()
		return TRUE

	else
		fail("Deprivation does not work upon the living.", user, C)
		return FALSE


/datum/ritual/cruciform/oathpledge/reconsecration
	name = "Reconsecration"
	phrase = "Oxidate Lecture: Reconsecration"
	desc = "The ritual needed for the reactivation and repair of a Hearthcore that has been unwillingly separated from the body or damaged by the bearer's death. The process requires a Board of Opposites and the Hearthcore in question to be attached. \
	If the Hearthcore has been damaged by the Revival lecture, 25 silver must be laid on the Board aswell, as raw material to reconstitute the Hearthcore."
	power = 50

/datum/ritual/cruciform/oathpledge/reconsecration/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform, FALSE)
	var/mob/living/carbon/human/H = get_victim(user)
	var/list/front_contents = get_front(user)

	if(!H.lying || !locate(/obj/machinery/optable/altar) in front_contents)
		fail("[H] must lie on the Board.", user, C)
		return FALSE

	if(!CI)
		fail("There is no Hearthcore on this one.", user, C)
		return FALSE

	if(!CI.wearer)
		fail("Hearthcore is not installed.", user, C)
		return FALSE

	if(CI.active)
		fail("This Hearthcore is already active.", user, C)
		return FALSE

	if (CI.wearer.stat == DEAD)
		fail("The Hearthcore cannot be bound to a corpse.", user, C)
		return FALSE

	if (CI.get_module(CRUCIFORM_DAMAGED))
		var/obj/item/stack/located = locate(/obj/item/stack/material/silver) in front_contents
		if (!located)
			fail("There is no silver present to repair such severe damage.", user, C)
			return FALSE
		if (!(located.can_use(REPAIR_COST)))
			fail("There is not enough silver present to repair such severe damage.", user, C)
			return FALSE
		located.use(REPAIR_COST)

	log_and_message_admins("successfully reconsecrated [CI.wearer]")
	to_chat(CI.wearer, "<span class='info'>Your Hearthcore vibrates and reconstitutes itself.</span>")

	CI.activate()
	CI.remove_modules(CRUCIFORM_DAMAGED)

	return TRUE

/datum/ritual/cruciform/oathpledge/adoption
	name = "Adoption"
	phrase = "Oxidate Lecture: Adoption"
	desc = "Grants a Hearthcore user in front of you access to Custodian Hatchways."
	power = 15

/datum/ritual/cruciform/oathpledge/adoption/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform)

	if(!CI || !CI.wearer || !ishuman(CI.wearer) || !CI.active)
		fail("Hearthcore not found", user, C)
		return FALSE

	CI.security_clearance = CLEARANCE_COMMON
	return TRUE

/datum/ritual/cruciform/oathpledge/ordination
	name = "Ordination"
	phrase = "Oxidate Lecture: Ordination"
	desc = "Grants a Hearthcore user in front of you access to Secure Custodian Hatchways."
	power = 15

/datum/ritual/cruciform/oathpledge/ordination/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform)

	if(!CI || !CI.wearer || !ishuman(CI.wearer) || !CI.active)
		fail("Hearthcore not found", user, C)
		return FALSE

	CI.security_clearance = CLEARANCE_CLERGY
	return TRUE

/datum/ritual/cruciform/oathpledge/omission
	name = "Omission"
	phrase = "Oxidate Lecture: Omission"
	desc = "Removes all access from target's Hearthcore."
	power = 30

/datum/ritual/cruciform/oathpledge/omission/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform)

	if(!CI || !CI.wearer || !ishuman(CI.wearer) || !CI.active)
		fail("Hearthcore not found", user, C)
		return FALSE

	CI.security_clearance = CLEARANCE_NONE
	return TRUE

/datum/ritual/cruciform/oathpledge/pilgrim_path
	name = "Pilgrim's Path"
	phrase = "Oxidate Lecture: Pilgrim's Path"
	desc = "A lecture that enhances the physical attributes of everyone around you for ten minutes. Has a thirty minute cooldown."
	cooldown = TRUE
	cooldown_time = 30 MINUTES
	cooldown_category = "pilgrim_path"
	effect_time = 10 MINUTES
	power = 75

/datum/ritual/cruciform/oathbound/pilgrim_path/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	for(var/mob/living/carbon/human/H in view())
		if(!(H == user))
			H.stats.changeStat(STAT_TGH, 15)
			H.stats.changeStat(STAT_ROB, 15)
			H.stats.changeStat(STAT_VIG, 15)
			to_chat(H, SPAN_NOTICE("You feel stronger, hardier, more agile."))
			addtimer(CALLBACK(src, .proc/discard_effect, user), src.effect_time)
	set_personal_cooldown(user)
	return TRUE

/datum/ritual/cruciform/oathbound/pilgrim_path/proc/discard_effect(mob/living/carbon/human/user, amount)
	user.stats.changeStat(STAT_TGH, -15)
	user.stats.changeStat(STAT_ROB, -15)
	user.stats.changeStat(STAT_VIG, -15)
	to_chat(user, SPAN_NOTICE("You no longer feel so great."))

/datum/ritual/cruciform/oathpledge/sanctorium_of_life
	name = "Sanctorium of Life"
	phrase = "Oxidate Lecture: Sanctorium of Life"
	desc = "A lecture that enhances the mental attributes of everyone around you for ten minutes. Has a thirty minute cooldown."
	cooldown = TRUE
	cooldown_time = 30 MINUTES
	cooldown_category = "sanctorium"
	effect_time = 10 MINUTES
	power = 75

/datum/ritual/cruciform/oathbound/sanctorium_of_life/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	for(var/mob/living/carbon/human/H in view())
		if(!(H == user))
			H.stats.changeStat(STAT_MEC, 15)
			H.stats.changeStat(STAT_COG, 15)
			H.stats.changeStat(STAT_BIO, 15)
			to_chat(H, SPAN_NOTICE("You feel smarter, more mentally stable."))
			addtimer(CALLBACK(src, .proc/discard_effect, user), src.effect_time)
	set_personal_cooldown(user)
	return TRUE

/datum/ritual/cruciform/oathbound/sanctorium_of_life/proc/discard_effect(mob/living/carbon/human/user, amount)
	user.stats.changeStat(STAT_MEC, -15)
	user.stats.changeStat(STAT_COG, -15)
	user.stats.changeStat(STAT_BIO, -15)
	to_chat(user, SPAN_NOTICE("You no longer feel so wise."))


/datum/ritual/cruciform/oathpledge/torch_of_guidance
	name = "Torch of Guidance"
	phrase = "Oxidate Lecture: Torch of Guidance"
	desc = "A lecture designed to warn the user of danger, it will reveal the presence of hostile fauna, traps, and potentially monsters hiding as people."
	power = 50

/datum/ritual/cruciform/oathpledge/torch_of_guidance/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C)
	var/was_triggired = FALSE
	log_and_message_admins("performed empowered reveal litany")
	for(var/mob/living/carbon/superior_animal/S in range(14, H))
		if (S.stat != DEAD)
			to_chat(H, SPAN_WARNING("Adversaries are near. You can feel something nasty and hostile."))
			was_triggired = TRUE

	if(!was_triggired)
		for (var/mob/living/simple_animal/hostile/S in range(14, H))
			if (S.stat != DEAD)
				to_chat(H, SPAN_WARNING("A simple hostile brute is nearby, nasty and stupid."))
				was_triggired = TRUE

	if(locate(/obj/structure/wire_splicing || /obj/item/mine || /obj/item/mine_old || /obj/item/spider_shadow_trap || /obj/item/beartrap || /obj/item/emp_mine) in view(7, H))
		to_chat(H, SPAN_WARNING("Something is wrong with this area. Tread carefully, someone has laid a trap nearby."))
		was_triggired = TRUE

	for(var/mob/living/carbon/human/target in range(14, H))
		for(var/organ in target.organs)
			if (organ in subtypesof(/obj/item/organ/internal/carrion))
				to_chat(H, SPAN_DANGER("A black terrible evil brushes against your mind suddenly, a horrible monstrous entity who's mere glancing ire is enough to leave you in a breathless cold sweat..."))
				was_triggired = TRUE

	if(!was_triggired)
		to_chat(H, SPAN_NOTICE("There is nothing here. You feel safe."))

	return TRUE

/datum/ritual/cruciform/oathpledge/undying_phrases
	name = "Undying Phrases"
	phrase = "Oxidate Lecture: Undying Phrases"
	desc = "Transmit a message to all Hearthcore users."
	power = 25

/datum/ritual/cruciform/oathpledge/undying_phrases/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	var/text = input(user, "What message will you send? Only Hearthcore users will be able to hear it.", "Sending a message") as text|null

	if (!text)
		return FALSE

	for (var/mob/living/L in disciples)
		if(!(L == user))
			to_chat(L, "<span class='notice'><b><font size='2px'><font color='#ffaa00'> [user.real_name]'s voice resonates from your Hearthcore: \"[text]\"</font><b></span>")
	log_and_message_admins("[user.real_name] sent a message to all Hearthcore users with text \"[text]\"")
	playsound(user.loc, 'sound/machines/signal.ogg', 50, 1)
	for(var/mob/observer/ghost/G in world)
		G.show_message("<i>Message from <b>[src]</b> to all Hearthcore users: [text]</i>")
	return TRUE

/datum/ritual/cruciform/oathpledge/inspiration
	name = "Inspiration"
	phrase = "Oxidate Lecture: Inspiration"
	desc = "Increases the Sanity recovery rate of the person in front of you for fifteen minutes."
	effect_time = 15 MINUTES
	power = 65

/datum/ritual/cruciform/oathpledge/inspiration/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/target = get_victim(user)
	if(!target)
		fail("No target.", user, C)
		return FALSE
	give_sanity_recovery(target)
	return TRUE

/datum/ritual/cruciform/oathpledge/inspiration/proc/give_sanity_recovery(mob/living/carbon/human/target)
	target.sanity.sanity_passive_gain_multiplier += 0.2
	addtimer(CALLBACK(src, .proc/take_sanity_recovery, target), effect_time)
	spawn(30)
		to_chat(target, SPAN_NOTICE("You feel inspired."))

/datum/ritual/cruciform/oathpledge/inspiration/proc/take_sanity_recovery(mob/living/carbon/human/target)
	target.sanity.sanity_passive_gain_multiplier -= 0.2
	to_chat(target, SPAN_NOTICE("You feel your inspiration draining."))

/datum/ritual/cruciform/oathpledge/order_of_misery
	name = "Order of Misery"
	phrase = "Oxidate Lecture: Order of Misery"
	desc = "Decreases the Sanity recovery rate of the person in front of you for fifteen minutes."
	effect_time = 15 MINUTES
	power = 65

/datum/ritual/cruciform/oathpledge/order_of_misery/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/target = get_victim(user)
	if(!target)
		fail("No target.", user, C)
		return FALSE
	give_sanity_malus(target)
	return TRUE

/datum/ritual/cruciform/oathpledge/order_of_misery/proc/give_sanity_malus(mob/living/carbon/human/target)
	target.sanity.sanity_passive_gain_multiplier -= 0.2
	addtimer(CALLBACK(src, .proc/take_sanity_malus, target), effect_time)
	spawn(30)
		to_chat(target, SPAN_NOTICE("You feel miserable."))

/datum/ritual/cruciform/oathpledge/order_of_misery/proc/take_sanity_malus(mob/living/carbon/human/target)
	target.sanity.sanity_passive_gain_multiplier += 0.2
	to_chat(target, SPAN_NOTICE("You don't feel so miserable anymore."))

/datum/ritual/cruciform/oathpledge/disgrace
	name = "Disgrace"
	phrase = "Oxidate Lecture: Disgrace"
	desc = "Inflict a harmful psychological effect on the person in front of you."
	power = 35

/datum/ritual/cruciform/oathpledge/disgrace/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/target = get_victim(user)

	if(!target)
		fail("No target.", user, C)
		return FALSE

	target.sanity.changeLevel(-20)
	return TRUE

/datum/ritual/cruciform/oathpledge/sight_of_bonfire
	name = "Sight of Bonfire"
	phrase = "Oxidate Lecture: Sight of Bonfire"
	desc = "Toggles revealing other Hearthcore users."

/datum/ritual/cruciform/oathpledge/sight_of_bonfire/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/datum/core_module/cruciform/neotheologyhud/hud_module = C.get_module(/datum/core_module/cruciform/neotheologyhud)
	if(hud_module)
		success_message = "Turning off Sight of Bonfire."
		C.remove_module(hud_module)
	else
		success_message = "Turning on Sight of Bonfire."
		C.add_module(new /datum/core_module/cruciform/neotheologyhud)
	return TRUE


/datum/ritual/cruciform/tessellate
	name = "cruciform"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/tessellate
	category = "Tessellate"

/datum/ritual/targeted/cruciform/tessellate
	name = "cruciform targeted"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/tessellate
	category = "Tessellate"

/datum/ritual/cruciform/tessellate/desperate_calculation
	name = "Desperate Calculation"
	phrase = "Et consideremus quomodo ad dilectionem et ad bene operandum se invicem stimemus."
	desc = "An immensely powerful healing litany that restores any who hear it around the speaker, however the strength of the litany requires so much that the body of the speaker is temporarily ravaged by hunger. \
	Due to the strength of this hymn, it can only be used once every half hour."
	cooldown = TRUE
	power = 50
	cooldown_time = 30 MINUTES
	cooldown_category = "dcalculation" //Seperate cooldown since it stuns the user.
	nutri_cost = 150
	blood_cost = 50

/datum/ritual/cruciform/tessellate/desperate_calculation/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/list/people_around = list()
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	for(var/mob/living/carbon/human/H in view(user))
		if(H != user && !isdeaf(H))
			people_around.Add(H)

	if(people_around.len > 0)
		user.visible_message("<b><font color='red'>[user]'s cruciform glows brightly!</font><b>", "<b><font color='red'>Your feel the air thrum with an inaudible vibration, your cruciform withdrawing a lot of power to empower your litany!</font><b>", "<b><font color='red'>You hear a small crackle!</font><b>")
		playsound(user.loc, 'sound/machines/signal.ogg', 50, 1)
		for(var/mob/living/carbon/human/participant in people_around)
			to_chat(participant, SPAN_NOTICE("You hear a silent signal..."))
			heal_other(participant)
			add_effect(participant, FILTER_HOLY_GLOW, 25)
		set_personal_cooldown(user)
		return TRUE
	else
		fail("Your cruciform sings, alone, unto the void.", user, C)
		return FALSE

/datum/ritual/cruciform/tessellate/desperate_calculation/proc/heal_other(mob/living/carbon/human/participant)
		to_chat(participant, "<span class='info'>A sensation of relief bathes you, washing away most of your pain!</span>")
		participant.reagents.add_reagent("laudanum", 10)
		participant.adjustBruteLoss(-40)
		participant.adjustFireLoss(-40)
		participant.adjustOxyLoss(-80)
		participant.adjustBrainLoss(-10)
		participant.updatehealth()


//////////////////////////////////////////////////
/////////         LEMNISCATE             /////////
//////////////////////////////////////////////////

/datum/ritual/cruciform/lemniscate
	name = "cruciform"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/lemniscate
	category = "Lemniscate"

/datum/ritual/targeted/cruciform/lemniscate
	name = "cruciform targeted"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/lemniscate
	category = "Lemniscate"

/datum/ritual/cruciform/lemniscate/long_boost
	name = "Long boost ritual"
	phrase = null
	desc = "This litany boosts the stats of everyone who's hear you on the short time."
	cooldown = TRUE
	cooldown_time = 2 MINUTES
	effect_time = 30 MINUTES
	cooldown_category = "short_boost"
	category = "Lemniscate"
	var/list/stats_to_boost = list()
	nutri_cost = 50//high cost
	blood_cost = 50//high cost

/datum/ritual/cruciform/lemniscate/long_boost/New()
	..()
	desc = "This litany boosts [get_stats_to_text()] stats of everyone who hears you, for about thirty minutes."

/datum/ritual/cruciform/lemniscate/long_boost/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/list/people_around = list()
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	for(var/mob/living/carbon/human/H in view(user))
		if(H != user && !isdeaf(H))
			people_around.Add(H)

	if(people_around.len > 0)
		to_chat(user, SPAN_NOTICE("Your feel the air thrum with an inaudible vibration."))
		playsound(user.loc, 'sound/machines/signal.ogg', 50, 1)
		for(var/mob/living/carbon/human/participant in people_around)
			to_chat(participant, SPAN_NOTICE("You hear a silent signal..."))
			give_boost(participant)
			add_effect(participant, FILTER_HOLY_GLOW, 25)
		set_global_cooldown()
		return TRUE
	else
		fail("Your cruciform sings, alone, unto the void.", user, C)
		return FALSE


/datum/ritual/cruciform/lemniscate/long_boost/proc/give_boost(mob/living/carbon/human/participant)
	for(var/stat in stats_to_boost)
		var/amount = stats_to_boost[stat]
		participant.stats.addTempStat(stat, amount, effect_time, src.name)
		addtimer(CALLBACK(src, .proc/take_boost, participant, stat, amount), effect_time)
	spawn(30)
		to_chat(participant, SPAN_NOTICE("A wave of dizziness washes over you and your mind is filled with a sudden insight into [get_stats_to_text()]."))


/datum/ritual/cruciform/lemniscate/long_boost/proc/take_boost(mob/living/carbon/human/participant, stat, amount)
	to_chat(participant, SPAN_WARNING("Your knowledge of [get_stats_to_text()] feels lessened."))

/datum/ritual/cruciform/lemniscate/long_boost/proc/get_stats_to_text()
	if(stats_to_boost.len == 1)
		return lowertext(stats_to_boost[1])
	var/stats_text = ""
	for(var/i = 1 to stats_to_boost.len)
		var/stat = stats_to_boost[i]
		if(i == stats_to_boost.len)
			stats_text += " and [stat]"
			continue
		if(i == 1)
			stats_text += "[stat]"
		else
			stats_text += ", [stat]"
	return lowertext(stats_text)

/datum/ritual/cruciform/lemniscate/long_boost/mental
	name = "Sanctorum of Life"
	phrase = "Venite ad me omnes qui laboratis, et onerati estis, et ego reficiam vos."
	stats_to_boost = list(STAT_MEC = 15, STAT_COG = 15, STAT_BIO = 15)

/datum/ritual/cruciform/lemniscate/long_boost/physical
	name = "Pilgrim's Path"
	phrase = "Confortare et esto robustus. Nolite timere nec paveatis a conspectu eorum quia Dominus Deus tuus ipse est ductor tuus. Et non dimittet nec derelinquet te."
	stats_to_boost = list(STAT_ROB = 15, STAT_TGH = 15, STAT_VIG = 15)

/datum/ritual/targeted/cruciform/lemniscate/food_for_the_masses
	name = "Food for the Masses"
	phrase = "Sive ergo manducatis sive bibitis vel aliud quid facitis omnia in gloriam Dei facite."
	desc = "You call upon the churches limited fabrication abilities, creating a lunch box in hand that contains special upgraded food for you and others. While highly nutritious, it is also packed with \
	healing chemicals and stimulants. The strain of using this litany, however, forces the speaker to wait a minimum of an hour to use it again."
	cooldown = TRUE
	power = 50
	cooldown_time = 60 MINUTES
	cooldown_category = "food_masses"
	nutri_cost = 50
	blood_cost = 25

/datum/ritual/targeted/cruciform/lemniscate/food_for_the_masses/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	new /obj/item/storage/lunchbox/lemniscate/full(usr.loc)
	to_chat(user, SPAN_NOTICE("A lemniscate branded lunchbox that smells delicious appears at your feet, still warm and fresh from the kitchens!"))
	set_personal_cooldown(user)

/datum/ritual/cruciform/lemniscate/zoom_litany
	name = "Infinite Hymn"
	phrase = "Beati pacifici, quoniam filii Dei vocabuntur."
	desc = "Empowers the speaker with enhanced movement speed, allowing them to run faster and react quicker for a short time. While useful, the body must rest after exceeding its limits, normally for \
	only a mere ten minutes."
	cooldown = TRUE
	cooldown_time = 15 MINUTES
	power = 35
	nutri_cost = 25
	blood_cost = 25
	cooldown_category = "zoom_litany"

/datum/ritual/cruciform/lemniscate/zoom_litany/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C,list/targets)
	if(H.species?.reagent_tag != IS_SYNTHETIC)
		if(H.nutrition >= nutri_cost)
			H.nutrition -= nutri_cost
		else
			to_chat(H, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			H.vessel.remove_reagent("blood",blood_cost)
	to_chat(H, "<span class='info'>You feel yourself speeding up, your senses and reaction times quickening!</span>")
	H.add_chemical_effect(CE_SPEEDBOOST, 0.2, 5 MINUTES, "chronos")
	H.updatehealth()
	set_personal_cooldown(H)
	return TRUE

//////////////////////////////////////////////////
/////////         MONOMIAL               /////////
//////////////////////////////////////////////////

/datum/ritual/cruciform/monomial
	name = "cruciform"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/monomial
	fail_message = "The Cruciform feels cold against your chest."
	category = "Monomial"

/datum/ritual/targeted/cruciform/monomial
	name = "cruciform targeted"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/monomial
	category = "Monomial"

//////////////////////////////////////////////////
/////////         DIVISOR                /////////
//////////////////////////////////////////////////

/datum/ritual/cruciform/divisor
	name = "cruciform"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/divisor
	category = "Divisor"

/datum/ritual/targeted/cruciform/divisor
	name = "cruciform targeted"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/divisor
	category = "Divisor"

/datum/ritual/targeted/cruciform/divisor/spawn_con
	name = "Canticle of Defense"
	phrase = "Sed Dominus autem mihi astitit, et confortavit me, ut per me prædicatio impleatur, et nuntius ut audirent eum omnes gentes."
	desc = "Request a taser, Bonfire tactical belt, and divisor garb from the church armory for defending yourself and your fellow disciples. Establishing the connection takes a lot of power and this litany may only be used once every four hours."
	power = 50
	cooldown = TRUE
	cooldown_time = 4 HOURS
	cooldown_category = "cdefn"
	nutri_cost = 25//med cost
	blood_cost = 25//med cost

/datum/ritual/targeted/cruciform/divisor/spawn_con/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	new /obj/item/gun/energy/taser(usr.loc)
	new /obj/item/cell/medium(usr.loc)
	new /obj/item/storage/belt/security/custodian(usr.loc)
	new /obj/item/clothing/head/rank/divisor(usr.loc)
	new /obj/item/clothing/suit/greatcoat/divisor(usr.loc)
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	set_personal_cooldown(user)
/*
/datum/ritual/cruciform/divisor/div_flash
	name = "Ire"
	phrase = "Fortitudo mea et laus mea Dominus, et sicut in omnibus divitiis."
	desc = "Knocks over everybody without cruciform in your view range. Though the energy emitted is quite powerful, a vigilant person may resist it. This litany can only be used once every 30 minutes."
	cooldown = TRUE
	cooldown_time = 30 MINUTES
	cooldown_category = "dflas"
	power = 50
	nutri_cost = 50
	blood_cost = 50

/datum/ritual/cruciform/divisor/div_flash/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	playsound(user.loc, 'sound/effects/cascade.ogg', 65, 1)
	log_and_message_admins("performed an ire litany")
	for(var/mob/living/victim in view(user))
		if(!victim.get_core_implant(/obj/item/implant/core_implant/cruciform))
			if(prob(100 - (victim.stats.getStat(STAT_VIG))))
				to_chat(victim, SPAN_WARNING("You feel a blast of energy that knocks you down!"))
				victim.Stun(3)
				victim.Weaken(3)
			else
				to_chat(victim, SPAN_NOTICE("Your legs feel numb, but you managed to stay on your feet!"))
	set_personal_cooldown(user)
	return TRUE
*/
/datum/ritual/cruciform/divisor/echo_of_blasphemy
	name = "Echo of Blasphemy"
	phrase = "Id quod infra non pertinet."
	desc = "Sets alight and burns anything around you without a cruciform. This litany can only be used once every minute."
	cooldown = TRUE
	cooldown_time = 1 MINUTES
	cooldown_category = "flames_of_fate"
	power = 5
	nutri_cost = 15
	blood_cost = 15

/datum/ritual/cruciform/divisor/echo_of_blasphemy/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	playsound(user.loc, 'sound/effects/cascade.ogg', 65, 1)
	log_and_message_admins("performed an echo_of_blasphemy")
	for(var/mob/living/victim in oview(2))
		if(!victim.get_core_implant(/obj/item/implant/core_implant/cruciform))
			to_chat(victim, SPAN_WARNING("A blast of heat and embers hit you!"))
			victim.adjust_fire_stacks(5)
			victim.IgniteMob()
			victim.adjustFireLoss(30)
	set_personal_cooldown(user)
	return TRUE

/datum/ritual/cruciform/divisor/probability_coefficient
	name = "Probability Coefficient"
	phrase = "Lux in tenebris lucet, et tenebrae eam non comprehenderunt."
	desc = "A highly effective litany designed by divisors to warn them of danger, it will reveal the presence of hostile fauna, traps, and potentially monsters hiding as people. Though \
	it may warn you of threats nearby, it cannot tell you exactly what or where. Far more reliable than the reveal adversaries litany, offering multiple detection methods and locating a wider \
	selection of threats."
	power = 50
	nutri_cost = 25
	blood_cost = 25

/datum/ritual/cruciform/divisor/probability_coefficient/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C)
	var/was_triggired = FALSE
	if(H.species?.reagent_tag != IS_SYNTHETIC)
		if(H.nutrition >= nutri_cost)
			H.nutrition -= nutri_cost
		else
			to_chat(H, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			H.vessel.remove_reagent("blood",blood_cost)
	log_and_message_admins("performed empowered reveal litany")
	for(var/mob/living/carbon/superior_animal/S in range(14, H))
		if (S.stat != DEAD)
			to_chat(H, SPAN_WARNING("Adversaries are near. You can feel something nasty and hostile."))
			was_triggired = TRUE

	if(!was_triggired)
		for (var/mob/living/simple_animal/hostile/S in range(14, H))
			if (S.stat != DEAD)
				to_chat(H, SPAN_WARNING("A simple hostile brute is nearby, nasty and stupid."))
				was_triggired = TRUE

	if(locate(/obj/structure/wire_splicing || /obj/item/mine || /obj/item/mine_old || /obj/item/spider_shadow_trap || /obj/item/beartrap || /obj/item/emp_mine) in view(7, H))
		to_chat(H, SPAN_WARNING("Something is wrong with this area. Tread carefully, someone has laid a trap nearby."))
		was_triggired = TRUE

	for(var/mob/living/carbon/human/target in range(14, H))
		for(var/organ in target.organs)
			if (organ in subtypesof(/obj/item/organ/internal/carrion))
				to_chat(H, SPAN_DANGER("A black terrible evil brushes against your mind suddenly, a horrible monstrous entity who's mere glancing ire is enough to leave you in a breathless cold sweat..."))
				was_triggired = TRUE

	if(!was_triggired)
		to_chat(H, SPAN_NOTICE("There is nothing here. You feel safe."))

	return TRUE

//////////////////////////////////////////////////
/////////         FACTORIAL              /////////
//////////////////////////////////////////////////

/datum/ritual/cruciform/factorial
	name = "cruciform"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/factorial
	fail_message = "The cruciform's gears grind to a halt."
	category = "Factorial"

/datum/ritual/targeted/cruciform/factorial
	name = "cruciform targeted"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/factorial
	category = "Factorial"

// Self-Repair
/datum/ritual/cruciform/factorial/self_repair
	name = "Litany of the iron soul"
	desc = "Use the energy in your cruciform to repair all mechanical parts on the bearer, be they synthetic limbs or organs."
	phrase = "Sic invocamus Absoluta. Ergo omne quod facimus separabuntur."
	cooldown = TRUE
	cooldown_time = 10 MINUTES
	cooldown_category = "repair"
	power = 35
	nutri_cost = 150
	blood_cost = 80 //Aheal but not AOE, so little less bad

/datum/ritual/cruciform/factorial/self_repair/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	user.visible_message("<b><font color='red'>[user]'s cruciform glows before they suddenly collapse!</font><b>", "<b><font color='red'>Your feel the air thrum with an inaudible vibration, your cruciform withdrawing everything you have to empower your litany!</font><b>", "<b><font color='red'>You hear a thud!</font><b>")
	set_personal_cooldown(user) //This needs at least some downside
	for(var/obj/item/organ/augmentic in user) // Run this loop for every organ the user has
		if(augmentic.nature == MODIFICATION_SILICON) // Are the organ made of metal?
			augmentic.heal_damage(30, 30, TRUE)
	to_chat(user, "Your mechanical organs knit themselves back together.")

// Mass-Repair
/datum/ritual/cruciform/factorial/mass_repair
	name = "Blessing of the machine"
	desc = "Use the energy in your cruciform to repair all mechanical parts of those around you, be they synthetic limbs or organs."
	phrase = "Nee tamen carnis denigrant noli haec possunt referri. Tu posse reincarnated - renascentes per voluntatem Dei Absoluta ferro."
	cooldown = TRUE
	cooldown_time = 30 MINUTES
	cooldown_category = "repair"
	power = 50
	nutri_cost = 300
	blood_cost = 125 //This is literally an Aheal, why does it cost less than actual heal ?

/datum/ritual/cruciform/factorial/mass_repair/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	user.visible_message("<b><font color='red'>[user]'s cruciform glows before brightly!</font><b>", "<b><font color='red'>Your feel the air thrum with an inaudible vibration!</font><b>", "<b><font color='red'>You hear a light ticking sound!</font><b>")
	set_personal_cooldown(user) //This needs at least some downside
	for(var/mob/living/carbon/human/H in oview(user)) // Affect everyone the user can see.
		var/synth = FALSE // It is true if at least one of their limbs or organ is synthetic.
		for(var/obj/item/organ/augmentic in H) // Run this loop for every organ the person has
			if(augmentic.nature == MODIFICATION_SILICON) // Are the organ made of metal?
				augmentic.heal_damage(20, 20, TRUE)
				to_chat(H, "Your [augmentic.name] repair itself!")
				synth = TRUE // They have a prosthetic
		if(synth) // Did they have any prosthetics?
			add_effect(H, FILTER_HOLY_GLOW, 25) // Make them glow.


/datum/ritual/cruciform/factorial/mod_litany
	name = "Hymn of the Engineer"
	phrase = "Fiducia intra Absolutum precipua est machinae sanctitati confidere, sed semper meminisse debet, limites semper infiniti sunt."
	desc = "Creates unique mods or cruciform upgrades. Due to the complexity of the technology, this litany may only be used \
	once every two hours. One must still perform the rites of installation to upgrade one's cruciform."
	power = 40
	cooldown = TRUE
	cooldown_time = 90 MINUTES
	cooldown_category = "mod_litany"
	success_message = "On the verge of audibility you hear pleasant music. Seemingly working on their own, your hands shape a brand new device."
	var/anti_cheat = FALSE

/datum/ritual/cruciform/factorial/mod_litany/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	if(anti_cheat)
		fail("Your Greed will resault in your downfall. Take your requested item, and wait your turn like the rest.", user, C)
		return FALSE

	anti_cheat = TRUE

	var/response = input(user, "Which upgrade do you require?") in list("Holy Oils", "Righteous Seal", "Nature's Blessing", "Cleansing Presence", "Faith's Shield", "Martyr's Gift", "Wrath of God", "Speed of the Chosen", "Cancel Litany")
	if (response == "Holy Oils")
		new /obj/item/tool_upgrade/augment/holy_oils(user.loc)
		if(user.species?.reagent_tag != IS_SYNTHETIC)
			if(user.nutrition >= nutri_cost)
				user.nutrition -= nutri_cost
			else
				to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
				user.vessel.remove_reagent("blood",blood_cost)
		set_personal_cooldown(user)
		anti_cheat = FALSE
		return TRUE
	if (response == "Righteous Seal")
		new /obj/item/tool_upgrade/augment/crusader_seal(user.loc)
		if(user.species?.reagent_tag != IS_SYNTHETIC)
			if(user.nutrition >= nutri_cost)
				user.nutrition -= nutri_cost
			else
				to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
				user.vessel.remove_reagent("blood",blood_cost)
		set_personal_cooldown(user)
		anti_cheat = FALSE
		return TRUE
	if (response == "Nature's Blessing")
		new /obj/item/cruciform_upgrade/natures_blessing(user.loc)
		if(user.species?.reagent_tag != IS_SYNTHETIC)
			if(user.nutrition >= nutri_cost)
				user.nutrition -= nutri_cost
			else
				to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
				user.vessel.remove_reagent("blood",blood_cost)
		set_personal_cooldown(user)
		anti_cheat = FALSE
		return TRUE
	if (response == "Cleansing Presence")
		new /obj/item/cruciform_upgrade/cleansing_presence(user.loc)
		if(user.species?.reagent_tag != IS_SYNTHETIC)
			if(user.nutrition >= nutri_cost)
				user.nutrition -= nutri_cost
			else
				to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
				user.vessel.remove_reagent("blood",blood_cost)
		set_personal_cooldown(user)
		anti_cheat = FALSE
		return TRUE
	if (response == "Faith's Shield")
		new /obj/item/cruciform_upgrade/faiths_shield(user.loc)
		if(user.species?.reagent_tag != IS_SYNTHETIC)
			if(user.nutrition >= nutri_cost)
				user.nutrition -= nutri_cost
			else
				to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
				user.vessel.remove_reagent("blood",blood_cost)
		set_personal_cooldown(user)
		anti_cheat = FALSE
		return TRUE
	if (response == "Martyr's Gift")
		new /obj/item/cruciform_upgrade/martyr_gift(user.loc)
		if(user.species?.reagent_tag != IS_SYNTHETIC)
			if(user.nutrition >= nutri_cost)
				user.nutrition -= nutri_cost
			else
				to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
				user.vessel.remove_reagent("blood",blood_cost)
		set_personal_cooldown(user)
		anti_cheat = FALSE
		return TRUE
	if (response == "Wrath of God")
		new /obj/item/cruciform_upgrade/wrath_of_god(user.loc)
		if(user.species?.reagent_tag != IS_SYNTHETIC)
			if(user.nutrition >= nutri_cost)
				user.nutrition -= nutri_cost
			else
				to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
				user.vessel.remove_reagent("blood",blood_cost)
		set_personal_cooldown(user)
		anti_cheat = FALSE
		return TRUE
	if (response == "Speed of the Chosen")
		new /obj/item/cruciform_upgrade/speed_of_the_chosen(user.loc)
		if(user.species?.reagent_tag != IS_SYNTHETIC)
			if(user.nutrition >= nutri_cost)
				user.nutrition -= nutri_cost
			else
				to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
				user.vessel.remove_reagent("blood",blood_cost)
		set_personal_cooldown(user)
		anti_cheat = FALSE
		return TRUE
	if (response == "Cancel Litany")
		fail("You decide not to obtain church artifice at this time.", user, C)
		anti_cheat = FALSE
		return FALSE
	anti_cheat = FALSE
	return TRUE

#undef REPAIR_COST
