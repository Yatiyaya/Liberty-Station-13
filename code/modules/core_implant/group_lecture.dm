/datum/lecture/group
	name = "group lecture"
	desc = ""
	phrase = null
	power = 0
	category = "Group"
	var/list/phrases = list()
	var/effect_type = null

	cooldown = TRUE
	cooldown_time = 1 SECONDS
	cooldown_category = "group"

/datum/lecture/group/pre_check(mob/living/carbon/human/H, obj/item/implant/core_implant/C, targets)
	if(is_on_cooldown(H))
		return FALSE
	return ..()

/datum/lecture/group/proc/step_check(mob/living/carbon/human/H)
	return TRUE

/datum/lecture/group/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C, targets)
	if(!effect_type)
		return FALSE

	var/datum/core_module/group_lecture/GR = new
	GR.lecture = src
	GR.implant_type = implant_type //Defined further in document as main core implant
	GR.phrases = phrases
	GR.effect = new effect_type
	GR.effect.succ_message = success_message
	GR.effect.fail_message = fail_message

	if(C.add_module(GR))
		return TRUE
	else
		qdel(GR.effect)
		qdel(GR)
		return FALSE

/datum/lecture/group/proc/get_group_say_phrase(var/ind)
	return phrases[ind]

//returns phrase to display in bible
/datum/lecture/group/proc/get_group_display_phrase(var/ind)
	return phrases[ind]

/datum/lecture/group/get_say_phrase()
	return ""

//returns phrase to display in bible
/datum/lecture/group/get_display_phrase()
	return ""

/////////////////////////////////

/datum/core_module/group_lecture
	implant_type = /obj/item/implant/core_implant
	var/list/participants = list()
	var/list/correct_participants = list()
	var/list/phrases = list()
	var/first = TRUE

	var/datum/lecture/group/lecture
	var/datum/group_lecture_effect/effect = null

/datum/core_module/group_lecture/set_up()
	first = TRUE

/datum/core_module/group_lecture/can_install()
	if(!effect)
		return FALSE

	return TRUE

/datum/core_module/group_lecture/uninstall()
	if(!effect)
		return


/datum/core_module/group_lecture/proc/hear(var/mob/user, var/phrase)
	if(!(locate(implant_type) in user))
		return

	if(user == implant.wearer)
		if(phrases.len > 2)
			if(phrase == phrases[2] && lecture.step_check(user))
				next_phrase()
			else
				effect.trigger_fail(implant.wearer,participants)
				implant.remove_module(src)
		else
			if(phrase == phrases[2] && lecture.step_check(user) && participants.len)	//It's a group lecture, isn't it?
				effect.trigger_success(implant.wearer,participants)
				implant.remove_module(src)
			else
				effect.trigger_fail(implant.wearer,participants)
				implant.remove_module(src)

	else
		if(first || (user in participants))
			if(phrase == phrases[1] && !(user in correct_participants) && lecture.step_check(user))
				correct_participants.Add(user)
			else
				participants.Remove(user)


/datum/core_module/group_lecture/proc/next_phrase()
	phrases = phrases.Copy(2)
	first = FALSE
	participants = correct_participants
	correct_participants = list()
	to_chat(implant.wearer, SPAN_NOTICE("There is [participants.len] followers continuing the lecture."))


////////////////////////

/datum/group_lecture_effect
	var/succ_message = ""
	var/fail_message = ""

	var/starter_succ_message = null
	var/starter_fail_message = null

/datum/group_lecture_effect/proc/trigger_success(var/mob/starter, var/list/participants)
	if(!starter_succ_message)
		starter_succ_message = succ_message

	to_chat(starter, starter_succ_message)
	success(starter, participants.len)

	for(var/mob/affected in participants)
		to_chat(affected, succ_message)
		success(affected, participants.len)

/datum/group_lecture_effect/proc/success(var/mob/affected, var/part_len)
	return

/datum/group_lecture_effect/proc/trigger_fail(var/mob/starter, var/list/participants)
	if(!starter_fail_message)
		starter_fail_message = fail_message

	to_chat(starter, starter_fail_message)
	fail(starter, participants.len)

	for(var/mob/affected in participants)
		to_chat(affected, fail_message)
		fail(affected, participants.len)

/datum/group_lecture_effect/proc/fail(var/mob/affected, var/part_len)
	return
