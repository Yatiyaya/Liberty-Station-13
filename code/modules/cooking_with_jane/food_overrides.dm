/obj/item/reagent_containers/food/snacks/examine(mob/user)
	if(!..(user, get_dist(user, src)))
		return

	if(cooking_description_modifier)
		to_chat(user, SPAN_NOTICE(cooking_description_modifier))

	if (bitecount==0)
		return
	else if (bitecount==1)
		to_chat(user, SPAN_NOTICE("\The [src] was bitten by someone!"))
	else if (bitecount<=3)
		to_chat(user, SPAN_NOTICE("\The [src] was bitten [bitecount] time\s!"))
	else
		to_chat(user, SPAN_NOTICE("\The [src] was bitten multiple times!"))
