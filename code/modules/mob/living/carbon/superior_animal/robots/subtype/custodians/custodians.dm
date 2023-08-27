/mob/living/carbon/superior_animal/robot/custodians
	name = "Bonfire Custodians Automaton"
	desc = "You shouldn't be seeing this."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = ""
	faction = "neutral"
	light_range = 3
	light_color = COLOR_LIGHTING_CUSTODIANS_BRIGHT
	colony_friend = TRUE
	friendly_to_colony = TRUE
	emp_damage = FALSE // Technically they're not robos but "golems".
	termination = FALSE
	cleaning = FALSE
	meat_type = /obj/item/stack/material/biomatter/random

// Not making an AI file for just these four lines.
/mob/living/carbon/superior_animal/robot/custodians/obey_check(mob/living/speaker = null)
	. = ..()
	if(speaker?.get_core_implant(/obj/item/implant/core_implant/hearthcore))
		return TRUE // We obey only people with a Hearthcore

/mob/living/carbon/superior_animal/robot/custodians/attackby(obj/item/W as obj, mob/user as mob)
	var/obj/item/T
	if(user.a_intent == I_HELP) // Make sure we're not actively trying to attack it with weapons

		// Check if it's a tool so we can call its tool_qualities
		if(istype(W, /obj/item/tool))
			T = W

		if(QUALITY_WELDING in T.tool_qualities)
			if(health < maxHealth)
				if(T.use_tool(user, src, WORKTIME_NORMAL, QUALITY_WELDING, FAILCHANCE_EASY, required_stat = STAT_MEC))
					user.visible_message(
										SPAN_NOTICE("[user] [user.stats.getPerk(PERK_ROBOTICS_EXPERT) ? "expertly" : ""] repair the damage to [name]."),
										SPAN_NOTICE("You [user.stats.getPerk(PERK_ROBOTICS_EXPERT) ? "expertly" : ""] repair the damage to [name].")
										)
					if(user.stats.getPerk(PERK_ROBOTICS_EXPERT))
						heal_overall_damage(50, 50)
					else
						heal_overall_damage(rand(30, 50), rand(30, 50))
					return
				return
			to_chat(user, "[src] doesn't need repairs.")
			return
	// Otherwise, attack as normal
	..()
