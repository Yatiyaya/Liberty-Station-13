/datum/job/clubmanager
	title = "Casino Manager"
	flag = CLUBMANAGER
	department = DEPARTMENT_SERVICE
	department_flag = SERVICE
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "You"
	difficulty = "Medium."
	selection_color = "#dddddd"
	access = list(access_hydroponics, access_bar, access_kitchen)
	wage = WAGE_COMMAND
	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_VIG = 15,
	)

	perks = list(PERK_MARKET_PROF)

	outfit_type = /decl/hierarchy/outfit/job/service/bartender //Re-using this.
	description = "The Bartender runs the colony bar, providing colonists with drinks and entertainment.<br>\
	Working with the Chef and Gardener, you make the big decisions. Run your business well - perhaps seek to maximise profits.<br>\
	Although tips are a good source of income, your wider business acumen will truly decide your prosperity here."

	duties = "Run the bar - provide a safe haven for food, drinks, and entertainment.<br>\
		Seek extra sources of income from the venue - perhaps run deals or trade secrets.<br>\
		Potentially take over cooking duties if a Chef is not present."

/obj/landmark/join/start/clubmanager
	name = "Casino Manager"
	icon_state = "player-grey"
	join_tag = /datum/job/clubmanager


/datum/job/janitor
	title = "Janitor"
	flag = JANITOR
	department = DEPARTMENT_SERVICE
	department_flag = SERVICE
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Casino Manager"
	difficulty = "Easy."
	selection_color = "#dddddd"
	alt_titles = list("Custodian","Sanitation Technician")
	access = list(access_janitor, access_maint_tunnels, access_morgue, access_hydroponics, access_bar, access_kitchen)
	wage = WAGE_PROFESSIONAL
	health_modifier = 5
	outfit_type = /decl/hierarchy/outfit/job/service/janitor

	perks = list(PERK_MARKET_PROF, /datum/perk/job/jingle_jangle, /datum/perk/neat) //Union has revoked their chemistry privileges

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_BIO = 10,
	)

	software_on_spawn = list(/datum/computer_file/program/camera_monitor)
	description = "The lowly Janitor, well paid but rarely respected, nevertheless provides a valuable service.<br>\
	You will trundle around the colony, armed with your trusty janicart full of cleaning supplies, disposing of trash and pests.<br>\
	Some minor maintenance also falls within your duties. Fix lights, correct broken vendors, replace floor tiles - ease the guild burden.<br>\
	Although your status is miserable, your knowledge of maintenance may lead you to some valuable salvage for some extra cash."

	duties = "Clean blood, dirt, rubble and messes. Don't clean up crime scenes!<br>\
		Conduct minor repairs and maintenance when guild adepts aren't available.<br>\
		Restock Newscasters to at lest 15 prints.<br>\
		Deploy traps on burrows and do your best to handle the ongoing roach and spider problem."

/obj/landmark/join/start/janitor
	name = "Janitor"
	icon_state = "player-black"
	join_tag = /datum/job/janitor

/datum/job/bouncer
	title = "Bouncer"
	flag = BOUNCER
	department = DEPARTMENT_SERVICE
	department_flag = SERVICE
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Casino Manager"
	difficulty = "Easy."
	alt_titles = list("Enforcer", "Hired Muscle")
	selection_color = "#dddddd"
	access = list(access_hydroponics, access_bar, access_kitchen)
	initial_balance = 750
	wage = WAGE_LABOUR_DUMB //They should get paid by making food.
	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 10,
		STAT_BIO = 10, // They need it to butcher animals without hurting themselves.
	)

	perks = list()

	outfit_type = /decl/hierarchy/outfit/job/service/waiter
	description = "The Chef works in the kitchen, ensuring that the colony remains well-fed and energetic.<br>\
	You will typically work closely with a Bartender while cooking, cleaning, serving, and perhaps entertaining.<br>\
	You are paid mainly through fulfilling requests for food. The successful Chef takes initiative by asking for customer orders."

	duties = "Provide enough meals to feed the colony. Aim for a variety of interesting and tasty dishes.<br>\
		Ensure your customers are well-fed and looked after.<br>\
		Potentially take over bartending duties if a Bartender is not present."


/obj/landmark/join/start/bouncer
	name = "Bouncer"
	icon_state = "player-grey"
	join_tag = /datum/job/bouncer

/datum/job/clubworker
	title = "Casino Worker"
	flag = CLUBWORKER
	department = DEPARTMENT_SERVICE
	department_flag = SERVICE
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Casino Manager"
	difficulty = "Easy."
	alt_titles = list("Bartender", "Chef", "Gardener")
	selection_color = "#dddddd"
	health_modifier = -10
	access = list(access_hydroponics, access_bar, access_kitchen)
	initial_balance = 750
	wage = WAGE_LABOUR_DUMB //They should get paid by making food.
	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 10,
		STAT_BIO = 10, // They need it to butcher animals without hurting themselves.
	)

	perks = list()

	outfit_type = /decl/hierarchy/outfit/job/service/waiter
	description = "The Chef works in the kitchen, ensuring that the colony remains well-fed and energetic.<br>\
	You will typically work closely with a Bartender while cooking, cleaning, serving, and perhaps entertaining.<br>\
	You are paid mainly through fulfilling requests for food. The successful Chef takes initiative by asking for customer orders."

	duties = "Provide enough meals to feed the colony. Aim for a variety of interesting and tasty dishes.<br>\
		Ensure your customers are well-fed and looked after.<br>\
		Potentially take over bartending duties if a Bartender is not present."


/obj/landmark/join/start/clubworker
	name = "Casino Worker"
	icon_state = "player-grey"
	join_tag = /datum/job/clubworker
