// The Knight Golem is between the Pawn and the Rook in term of durability, damage and speed.
/mob/living/carbon/superior_animal/robot/church/knight
	name = "Knight Golem"
	desc = "The Knight, a golem made by the Custodians and fashioned after the time honored game of chess. Reliable, strong, and quite sturdy. \
	The most prevalent out of the Custodian golems."
	faction = "neutral"
	icon_state = "knight_golem"
	attacktext = "strikes"
	fleshcolor = "#964B00"
	bloodcolor = "#964B00"
	move_to_delay = 3
	turns_per_move = 3
	pass_flags = PASSTABLE
	meat_amount = 1
	health = 400
	maxHealth = 400
	melee_damage_lower = 45
	melee_damage_upper = 55
	meat_type = /obj/item/stack/material/platinum/random
	drop1 = /obj/item/tool/sword/custodian/horseaxe
	drop2 = /obj/item/shield/riot/custodian
	armor = list(melee = 50, bullet = 50, energy = 10, bomb = 15, bio = 100, rad = 100, agony = 100)
