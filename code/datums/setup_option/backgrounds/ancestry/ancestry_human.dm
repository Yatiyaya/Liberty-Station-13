/* Humans shouldn't start with any major bonus stats from backgrounds as they already get them baked into the race*/
//Baseline
/datum/category_item/setup_option/background/ancestry/human_sol
	name = "Solarian"
	desc = "You come from the cradle of civilization - Sol, known as Earth and Mars in the old days to it's residents. \
	Since then it has massively expanded it's borders way past just the two planets reaching the status of a galactic superpower.\
	You however were born in heart of this empire leaving you completely unprepared for the horrors lying within the reach of borders."

	restricted_depts = COMMAND
	restricted_jobs = list(/datum/job/premier)

	restricted_to_species = list(FORM_HUMAN)

	stat_modifiers = list(STAT_ROB = -3, STAT_TGH = -3, STAT_BIO = 3, STAT_MEC = 3) //Pretty bad perk baked into this so

	perks = list(PERK_SOLBORN)

/datum/category_item/setup_option/background/ancestry/human_periphery
	name = "Periphery Resident"
	desc = "While not an official term on how to refer to residents of the edges of Sol space it is generally accepted as a colloquial term for such. \
	Hardy space-farers, pirates, mercenaries looking out for their next hit or even just unfortunate souls trying to live outside of centralized government, all of these find home here. \
	You are one such person, what brought you there in first place is noone's question, what you became is what matters living in such conditions."

	restricted_to_species = list(FORM_HUMAN)

/datum/category_item/setup_option/background/ancestry/human_vatgrown
	name = "Vatgrown Humanoid"
	desc = "This is here so that someone can actually write a description for it on basis of me having 'poor grammar' to put it \
	in very mild  terms, also cause nothing is concrete yet."

	restricted_depts = COMMAND

	restricted_to_species = list(FORM_HUMAN)

	stat_modifiers = list(STAT_BIO = -3, STAT_MEC = 3, STAT_VIG = -3, STAT_COG = 3)

	perks = list(PERK_DEBTOR)

//Exalt
/datum/category_item/setup_option/background/ancestry/human_exalt //Just make it a human_exalt_powergamer if you are gonna make another one of these.
	name = "Exalted Humanoid"
	desc = "You are an 'exalted' human, via extensive gene modifications and treatments you became more than just your regular Joe. \
	Faster, more perceptive and smarter all of those are benefits of such treatements, if you got them the legal way or signing off your soul to some mob is irrelevant. \
	Whichever the case now you will have to deal with the consequences of your decisions, your DNA is scrambled and unstable and you require expensive treatment every day to keep yourself together, cutting deep into your wages."

	restricted_to_species = list(FORM_EXALT_HUMAN)
