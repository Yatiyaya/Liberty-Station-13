//Contains: Engineering department jumpsuits

/obj/item/clothing/under/rank/roboticist
	desc = "An orange and tan CAPSA jumpsuit designed for mechanical work."
	name = "roboticist's jumpsuit"
	icon_state = "robotics"
	item_state = "bl_suit"

/obj/item/clothing/under/rank/engineer/adv
	desc = "A plastic coated and padded engineering suit worn by Guild Adepts heading into dangerously radioactive areas for repair work. Offers full radiation protection."
	name = "adept's padded emergency suit"
	icon_state = "engineadv"
	item_state = "engineadv"
	armor_list = list(
		melee = 20, //if they are not waring any armor over this then we give *something*
		bullet = 20,
		energy = 25,
		bomb = 40,
		bio = 50,
		rad = 100 //Rad proof
	)

/obj/item/clothing/under/rank/engineer/ert_engineer
	name = "padded emergency response jumpsuit"
	desc = "A plastic-coated and iron-woven engineering suit worn by emergency response teams heading into dangerously radioactive areas for repair work."
	icon_state = "chiefengineeradv"
	item_state = "chiefengineeradv"
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 0, rad = 30)




	obj/item/clothing/under/rank/engineer
	desc = "A Robust Snow Jumpsuit, this one is Made by Terra-Therma in Orange For the Engineers, It stills having Terra Fed Markings."
	name = "Terra Union Engineer Jumpsuit"
	icon_state = "Terra_engineer_icon"
	item_state = "Terra_engineer"
	armor_list = list(
		melee = 0,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 50,
		rad = 50
	)

/obj/item/clothing/under/rank/engineer/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()

	options["Terra engineer"] = "Terra_engineer" // Sprites by Ezoken/Dromkii
	options["Terra engineer Rolled down"] = "Terra_engineer_alt" // Sprites by Ezoken/Dromkii
	options["Terra engineer down"] = "Terra_engineer_pants" // Sprites by Ezoken/Dromkii

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = null
		to_chat(M, "You adjust your [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()

	obj/item/clothing/under/rank/Miner
	desc = "A Robust Snow Jumpsuit, this one is Made by Terra-Therma in Brown For the Miners, It stills having Terra Fed Markings."
	name = "Terra Union Miner jumpsuit"
	icon_state = "Terra_miner_icon"
	item_state = "Terra_miner"
	armor_list = list(
		melee = 0,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 50,
		rad = 50
	)

/obj/item/clothing/under/rank/engineer/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()

	options["Terra Miner"] = "Terra_miner" // Sprites by Ezoken/Dromkii
	options["Terra Miner Rolled down"] = "Terra_miner_alt" // Sprites by Ezoken/Dromkii
	options["Terra Miner down"] = "Terra_miner_pants" // Sprites by Ezoken/Dromkii

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = null
		to_chat(M, "You adjust your [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/rank/chief
	desc = "A Robust Snow Jumpsuit, this one is Made by Terra-Therma in Navy Blue for the Chief, It stills having Terra Fed Markings."
	name = "Terra Union Chief Jumpsuit"
	icon_state = "Terra_chief_icon"
	item_state = "Terra_chief"
	armor_list = list(
		melee = 0,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 50,
		rad = 50
	)

/obj/item/clothing/under/rank/engineer/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()

	options["Terra Chief"] = "Terra_chief" // Sprites by Ezoken/Dromkii
	options["Terra Chief Rolled down"] = "Terra_chief_alt" // Sprites by Ezoken/Dromkii
        options["Terra Chief down"] = "Terra_chief_pants" // Sprites by Ezoken/Dromkii

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = null
		to_chat(M, "You adjust your [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1
