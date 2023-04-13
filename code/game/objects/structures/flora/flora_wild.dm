
//wild plants, manually added in by mappers using spawners
/obj/structure/flora/wild
	name = "wild plant base item"
	desc = "If you see this, something's wrong."
	anchored = TRUE
	density = FALSE
	var/fruit

/obj/structure/flora/wild/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING && user.stats.getPerk(PERK_MASTER_HERBALIST))
		to_chat(user, SPAN_NOTICE("You start to harvest the wild plant."))
		if(I.use_tool(user, src, WORKTIME_QUICK, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC))
			new fruit(get_turf(src))
			new fruit(get_turf(src))
			new fruit(get_turf(src))
			new fruit(get_turf(src))
			to_chat(user, SPAN_NOTICE("You harvest the wild plant."))
			qdel(src)
			return
	else
		to_chat(user, SPAN_NOTICE("You don't know how to harvest this!"))
		return

/obj/structure/flora/wild/bruteloss
	name = "brute wild plant"
	desc = "it heals brute"
	fruit = /obj/item/reagent_containers/food/snacks/wild/brute

/obj/structure/flora/wild/burnloss
	name = "burn wild plant"
	desc = "it heals burn"
	fruit = /obj/item/reagent_containers/food/snacks/wild/burn

/obj/structure/flora/wild/toxinloss
	name = "toxin wild plant"
	desc = "it heals toxin"
	fruit = /obj/item/reagent_containers/food/snacks/wild/toxin

/obj/structure/flora/wild/oxyloss
	name = "oxyloss wild plant"
	desc = "it heals oxyloss"
	fruit = /obj/item/reagent_containers/food/snacks/wild/oxyloss

