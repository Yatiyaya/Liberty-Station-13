//Path of life you know the stuff you actually did in your life matters HERE. / The actual stats are gonna come later once I finished my sheet - Lamasmaster
/datum/category_item/setup_option/background/path/laborer
	name = "Former Laborer"
	desc = "This is here so that someone can actually write a description for it on basis of me having 'poor grammar' to put it \
	in very mild  terms, also cause nothing is concrete yet."

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/path/medtech //This should be both civilian and military to cut down on the amount paths available
	name = "Former Medical Technician"
	desc = "This is here so that someone can actually write a description for it on basis of me having 'poor grammar' to put it \
	in very mild  terms, also cause nothing is concrete yet."

	perks = list(PERK_MEDICAL_EXPERT)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/path/criminal //Former pirate is to be considered merged under this.
	name = "Former Criminal"
	desc = "This is here so that someone can actually write a description for it on basis of me having 'poor grammar' to put it \
	in very mild  terms, also cause nothing is concrete yet."

	perks = list(PERK_PARKOUR)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/path/armed_forces //All ex militaries merged under here, also applies to cops like this.
	name = "Former Armed Forces Member"
	desc = "This is here so that someone can actually write a description for it on basis of me having 'poor grammar' to put it \
	in very mild  terms, also cause nothing is concrete yet."

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/path/entrepreneur
	name = "Free Market Shark"
	desc = "This is here so that someone can actually write a description for it on basis of me having 'poor grammar' to put it \
	in very mild  terms, also cause nothing is concrete yet."

	perks = list(PERK_MARKET_PROF) //You have defended the free market one too many times Harry, you are getting political again.

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0 //So many psions are going to fucking pick this. / No psions every picked this btw
	)

/datum/category_item/setup_option/background/path/noble
	name = "Impoverished Noble"
	desc = "This is here so that someone can actually write a description for it on basis of me having 'poor grammar' to put it \
	in very mild  terms, also cause nothing is concrete yet."

	perks = list(PERK_NOBLE)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/path/mercenary //different from armoed forces member, get perk but less points is the idea here
	name = "Retired Mercenary"
	desc = "This is here so that someone can actually write a description for it on basis of me having 'poor grammar' to put it \
	in very mild  terms, also cause nothing is concrete yet."

	perks = list(PERK_SPACE_ASSHOLE)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)


/datum/category_item/setup_option/background/path/drug_addict
	name = "Magnesium-Modus Vivendi"
	desc = "This is here so that someone can actually write a description for it on basis of me having 'poor grammar' to put it \
	in very mild  terms, also cause nothing is concrete yet." //conducit proclivitas

	perks = list(PERK_ADDICT)
	restricted_to_species = list(FORM_HUMAN, FORM_KRIOSAN, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_OPIFEX, FORM_CHTMANT, FORM_CINDAR)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/path/razor_maniac
	name = "Rookie Transhumanist"
	desc = "This is here so that someone can actually write a description for it on basis of me having 'poor grammar' to put it \
	in very mild  terms, also cause nothing is concrete yet." //Tekko-Kagi

	racial_implants = (/obj/item/organ_module/active/simple/wolverine)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)
