
/**********************Ore box**************************/

/obj/structure/ore_box
	icon = 'icons/obj/mining.dmi'
	icon_state = "union_mining_cart"
	name = "mining cart"
	desc = "A heavy cart used for storing ore."
	density = 1
	breakable = TRUE
	parts = /obj/structure/ore_box/destroyed
	health = 120 //we are a metal cart. We are pretty tanky.

/obj/structure/ore_box/destroyed
	name = "broken mining cart"
	desc = "A busted cart. This thing won't move anymore."
	icon_state = "union_mining_cart_broken"
	parts = null
	breakable = TRUE
	anchored = 1
	health = 30 //we are on our last legs. This is your last chance to empty the cart.

/obj/structure/ore_box/Destroy()
	..()
	var/target_cart = (/obj/structure/ore_box/destroyed in src.loc.contents)
	if(target_cart) //if we got a broken cart we move the contents to it.
		for (var/obj/item/stack/ore/O in src.contents)
			O.loc = target_cart

/obj/structure/ore_box/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/stack/ore))
		user.remove_from_mob(W)
		W.forceMove(src)
	if (istype(W, /obj/item/storage))
		var/obj/item/storage/S = W
		S.hide_from(usr)
		if (locate(/obj/item/stack/ore) in S.contents)
			for(var/obj/item/stack/ore/O in S.contents)
				S.remove_from_storage(O, src) //This will move the item to this item's contents
			playsound(loc, S.use_sound, 50, 1, -5)
			user.visible_message(SPAN_NOTICE("[user.name] empties the [S] into the box"), SPAN_NOTICE("You empty the [S] into the box."), SPAN_NOTICE("You hear a rustling sound"))
		else
			to_chat(user, SPAN_WARNING("There's no ore inside the [S] to empty into here"))
	return

/obj/structure/ore_box/examine(mob/user)
	..()
	to_chat(user, SPAN_NOTICE("The box contains:"))
	var/list/nice_display_list = list()
	for(var/type in contents)
		var/obj/item/stack/ore/O = type
		nice_display_list[initial(O.name)] += O.amount
	for(var/element in nice_display_list)
		var/numtoshow = nice_display_list[element]
		to_chat(user, SPAN_NOTICE("[numtoshow] of [element]"))

/obj/structure/ore_box/verb/empty_cart()
	set name = "Empty Ore Box"
	set category = "Object"
	set src in view(1)

	if(!ishuman(usr) && !isrobot(usr)) //Only living, intelligent creatures with hands can empty material boxes.
		to_chat(usr, "\red You are physically incapable of emptying the ore box.")
		return

	if( usr.stat || usr.restrained() )
		return

	if(!Adjacent(usr)) //You can only empty the box if you can physically reach it
		to_chat(usr, "You cannot reach the ore box.")
		return

	add_fingerprint(usr)

	if(contents.len < 1)
		to_chat(usr, "\red The ore box is empty")
		return


	dump_box_contents()

	return


/obj/structure/ore_box/proc/dump_box_contents(drop_loc = null)
	var/drop = drop_loc ? drop_loc : drop_location()
	for(var/obj/item/stack/ore/O in src)
		if(QDELETED(O))
			continue
		if(QDELETED(src))
			break
		O.forceMove(drop)
		if(TICK_CHECK)
			stoplag()
			drop = drop_loc ? drop_loc : drop_location()

/obj/structure/ore_box/ex_act(severity)
	if(severity == 1.0 || (severity < 3.0 && prob(50)))
		for (var/obj/item/stack/ore/O in contents)
			O.loc = src.loc
			O.ex_act(severity++)
		qdel(src)
		return

/obj/structure/ore_box/proc/take_damage(amount)
	health -= amount
	if(health <= 0)
		visible_message(SPAN_WARNING("\The [src] breaks down!"))
		playsound(loc, 'sound/effects/grillehit.ogg', 50, 1)
		qdel(src)

/obj/structure/ore_box/attack_hand(mob/user as mob)

	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	playsound(loc, 'sound/effects/grillehit.ogg', 80, 1)
	user.do_attack_animation(src)

	var/damage_dealt = 1
	var/attack_message = "kicks"
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.species.can_shred(H))
			attack_message = "mangles"
			damage_dealt = 5

	attack_generic(user,damage_dealt,attack_message)


/obj/structure/ore_box/bullet_act(obj/item/projectile/Proj)
	if(!Proj)
		return
	var/damage = Proj.get_structure_damage()
	if(!damage)
		return
	take_damage(Proj.get_structure_damage())

/obj/structure/ore_box/attack_generic(mob/user, damage, attack_verb)
	if(istype(user))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		user.do_attack_animation(src)
		visible_message(SPAN_DANGER("[user] smashes into [src]!"))
		take_damage(damage)
		return TRUE

/obj/structure/ore_box/hitby(AM as mob|obj)
	..()
	visible_message(SPAN_DANGER("[src] was hit by [AM]."))
	playsound(loc, 'sound/effects/grillehit.ogg', 80, 1)
	var/tforce = 0
	if(ismob(AM))
		tforce = 10
	else if(isobj(AM))
		var/obj/item/I = AM
		tforce = I.throwforce
	take_damage(max(tforce))
