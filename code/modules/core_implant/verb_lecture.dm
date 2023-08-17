/datum/lecture/mind
	name = "mind-controlled lecture"
	desc = "Basic lecture that does nothing."
	phrase = ""
	var/activator_verb = /datum/lecture/mind/proc/activator

/datum/lecture/mind/get_say_phrase()
	return null

/datum/lecture/mind/get_display_phrase()
	return null

/datum/lecture/mind/compare()
	return FALSE

//Proc, which will be added to mob's verb list
/datum/lecture/mind/proc/activator()

