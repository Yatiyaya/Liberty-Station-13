/datum/category_item/setup_option/background/habit/chainsmoker
	name = "Terminal Smoker"
	desc = "Nicotine is way of life, nicotine is love, nicotine is your lifeline, without it you wouldn't be whole.\
	Due to genetic predisposition acquired through generations or a gene therapy you are now partially related to tobacco!\
	This means you can inexplicably mend small wounds via consumption of cigarettes or cigars."

	restricted_to_species = list(FORM_HUMAN, FORM_KRIOSAN, FORM_SABLEKYNE, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_OPIFEX, FORM_CHTMANT, FORM_CINDAR, FORM_SLIME)
	perks = list(PERK_CUBAN_DELIGHT)
	stat_modifiers = list(STAT_TGH = -10) //Trade stats for perks

/datum/category_item/setup_option/background/habit/nepotism
	name = "Friends in High Places"
	desc = "Let's be real, you aren't smart, pretty or particularly talented in any field, what you do have is net of connections.\
	From bankers to cult leaders to even just petty criminals, if it moves you can make it praise your name.\
	As such you got yourself a hefty raise from the higher ups which you will surely put to good use."

	restricted_to_species = list(FORM_HUMAN, FORM_KRIOSAN, FORM_SABLEKYNE, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_OPIFEX, FORM_CHTMANT, FORM_CINDAR, FORM_SLIME)
	perks = list(PERK_NEPOTISM)
	stat_modifiers = list(STAT_COG = -10) //Really dumb

/datum/category_item/setup_option/background/habit/linguist
	name = "Aspiring Linguist"
	desc = "Be it from your education or from a multi-lingual family, you've found yourself studying languages non-stop throughout your childhood and early adulthood. \
	Unlike most you're silver-tongued in both your knowledge of English, your secondary or native language - and your tertiary! \
	Being tri-lingual has its upsides, making you an adept trader of sorts. Though its downside is that you may have not studied as hard as some others have in other subjects."

	restricted_to_species = list(FORM_HUMAN, FORM_KRIOSAN, FORM_SABLEKYNE, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_OPIFEX, FORM_CHTMANT, FORM_CINDAR, FORM_SLIME)
	perks = list(PERK_LINGUIST)

/datum/category_item/setup_option/background/habit/generic
	name = "Loser Lifestyle"
	desc = "You are, by all means of the word, an incredibly generic person. You say no to drugs, you don't break laws - hell, it's questionable if you've ever even drank before. \
	Some may call you a loser, but your abstinence from anything dangerous or possibly divisive has gotten you.. oddly far in life. Sure, you can't socialize for shit - but who cares? \
	You feel that this lifestyle has made you smarter than others. Maybe it has. Or maybe it's just your programming, you NPC. Now get a job, you NEET."

	restricted_to_species = list(FORM_HUMAN, FORM_KRIOSAN, FORM_SABLEKYNE, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_OPIFEX, FORM_CHTMANT, FORM_CINDAR, FORM_SLIME)
	stat_modifiers = list(STAT_ROB = -5, STAT_COG = 10, STAT_BIO = 5)

/datum/category_item/setup_option/background/habit/paper_worm
	name = "Paper Worm"
	desc = "You were a clerk and bureaucrat for all your life. Cramped offices with angry people is where your personality was forged. \
			Coffee is your blood, your mind is corporate slogans, and personal life is nonexistent. \
			But here you are, on a spaceship flying to hell. There is something more to you, something that may come to light later."

	restricted_to_species = list(FORM_HUMAN, FORM_KRIOSAN, FORM_SABLEKYNE, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_OPIFEX, FORM_CHTMANT, FORM_CINDAR, FORM_SLIME)
	stat_modifiers = list(STAT_ROB = -10, STAT_TGH = -10, STAT_BIO = -10, STAT_MEC = -10, STAT_VIG = -10, STAT_COG = -10)
	perks = list(PERK_PAPER_WORM)

/*
/datum/category_item/setup_option/background/habit/psi_sufficiency
	name = "Enlightened Scholar"
	desc = "Due to rigorious studies and self-critique you have learned to master your psionic potential beyond what most can muster. \
	Your mind is in perfect balance with little being able to tilt it's scales downwards.\
	As such certain disciplines are way easier to use for you with smaller chance of violently backfiring."

	restricted_to_species = list(FORM_HUMAN, FORM_KRIOSAN, FORM_SABLEKYNE, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_OPIFEX, FORM_CHTMANT, FORM_CINDAR, FORM_SLIME)
	perks = list(PERK_PSI_ATTUNEMENT)
	stat_modifiers = list(STAT_ROB = -5, STAT_TGH = -5, STAT_VIG = -5)
*/
