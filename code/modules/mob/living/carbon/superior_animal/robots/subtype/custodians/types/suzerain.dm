// Tank-type construct. Slow moving and high health, high damage.
/mob/living/carbon/superior_animal/robot/custodians/suzerain
	name = "Suzerain Automaton"
	desc = "The Suzerain, an automaton made by the Custodians and fashioned after a hulking behemoth, it's often attacked first by foes. \
	Slow, lumbering, but with the strength required to tear enemies apart."
	faction = "neutral"
	icon_state = "suzerain_automaton"
	icon_dead = "suzerain_automaton_dead"
	fleshcolor = "#964B00"
	bloodcolor = "#964B00"
	attacktext = "pumbled"
	move_to_delay = 5 // Rather slow moving
	turns_per_move = 5
	meat_amount = 1
	health = 550
	maxHealth = 550
	melee_damage_lower = 60
	melee_damage_upper = 75
	meat_type = /obj/item/stack/material/gold/random // 1 to 6 gold
	drop1 = /obj/item/stack/material/silver/random // 1 to 6 silver, pieces of the radiance sigil
	drop2 = /obj/item/book/lectures/hearthlantern
	armor = list(melee = 75, bullet = 25, energy = 20, bomb = 30, bio = 100, rad = 100, agony = 100)
	target_dummy = TRUE

