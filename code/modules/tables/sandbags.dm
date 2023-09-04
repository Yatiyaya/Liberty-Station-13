// Sandbag structures that work like tables, in the sense that projectiles can go through them,
// and offer below waist coverage against them, while allowing guns to be braced on top
// These are built exclusively through the "sandbags" material sheets (a badly implemented idea tbh)
// by using said mats in hand through the pop up menu (using the build_windows() proc)
// Attacking them with an empty hand will collapse them back into two sandbags worth for repositioning
// TODO: ADD BARBED WIRE AND WOODEN BARRICADES ON THIS FILE, SPRITES ALREADY PRESENT IN barricades.dmi

/obj/structure/sandbags
	name = "sandbag fortification"
	desc = "A half-wall of sandbags piled to act as a fortification."
	icon = 'icons/obj/structures/barricades.dmi'
	icon_state = "sandbag_0"
	density = TRUE
	anchored = TRUE
	climbable = TRUE
	layer = PROJECTILE_HIT_THRESHHOLD_LAYER
	throwpass = TRUE
	maxHealth = 50
	health = 50

	matter = list(MATERIAL_SANDBAG = 2)

	var/base_blocking = 50
	var/base_cover = 50
	var/ini_dir = null

/obj/structure/sandbags/New(Loc, start_dir=null)
	..()
	if(start_dir)
		set_dir(start_dir)
	health = maxHealth
	ini_dir = dir
	update_icon()

/obj/structure/sandbags/update_icon()
	if(health < 40)
		icon_state = "sandbag_0"
	if(health < 30)
		icon_state = "sandbag_1"
	if(health < 20)
		icon_state = "sandbag_2"
	if(health < 10)
		icon_state = "sandbag_3"

/obj/structure/sandbags/verb/compact(mob/living/user)
	set src in oview(1)
	set category = "Object"
	set name = "Take down"

	if(!user || !Adjacent(user) || !usr.canmove || usr.stat || usr.restrained())
		return

	if(ishuman(usr) || isrobot(usr)) // So that borgs can also take them down
		if(do_after(user, 30, src)) // Takes some time to collapse
			visible_message("[usr] folds \the [src] into portable stacks.")
			new /obj/item/stack/material/sandbag(get_turf(src))
			new /obj/item/stack/material/sandbag(get_turf(src))
			qdel(src)

/obj/structure/sandbags/proc/damage(damage)
	health -= damage
	update_icon()
	if(health < 1)
		qdel(src)

/obj/structure/sandbags/attack_hand(mob/user)
	if(ishuman(user) || isrobot(user))
		compact(user)

/obj/structure/sandbags/attack_robot(var/mob/user)
	if(Adjacent(user))
		attack_hand(user)

// Rest of this code is copied from the Bastion Shield object. Mild changes are made, however, such as how to repair this structure vs the Shield.
/obj/structure/sandbags/attackby(obj/item/I, mob/living/user)
	.=..()
	if(user.a_intent == I_HELP && istype(I, /obj/item/gun))
		var/obj/item/gun/G = I
		G.gun_brace(user, src)
		return
	if(istype(I, /obj/item/stack/material/sandbag))
		var/obj/item/stack/material/sandbag/S
		if(health == maxHealth)
			to_chat(user, SPAN_NOTICE("\The [src] is already fully repaired!"))
			return
		if(health < maxHealth)
			to_chat(user, SPAN_NOTICE("You start reparing \the [src]."))
			if(do_after(user, 30))
				health = maxHealth
				S.use(1) // Consume at least one sandbag to repair fully, no cheating
				to_chat(user, SPAN_NOTICE("\The [src] is now fully repaired!"))
				return
	if(I.has_quality(QUALITY_BOLT_TURNING))
		if(get_dir(loc, usr) == dir)
			return

/obj/structure/sandbags/attack_generic(var/mob/user, var/damage, var/attack_message = "smashes", var/wallbreaker)//Occulus Edit
	if(damage)//Occulus edit
		damage(damage)//Occulus Edit
		attack_animation(user)
		visible_message(SPAN_DANGER("\The [user] has [attack_message] \the [src]!"))
		return 1

/obj/structure/sandbags/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(air_group || (height==0))
		return 1
	if(istype(mover,/obj/item/projectile))

		var/obj/item/projectile/P = mover
		var/chance = base_blocking

		if(locate(/mob/living/) in get_turf(loc))
			return (check_cover(P,target))
		if(get_dist(P.starting, loc) <= 1)
			return 1
		if(istype(P, /obj/item/projectile/test) || P.testing) // Turrets need to try to kill the shield and so their test bullet needs to penetrate.
			return 1
		var/bad_arc = reverse_direction(dir) // Arc of directions from which we cannot block.
		if(!check_parry_arc(src, bad_arc, P)) // This is actually for mobs but it will work for our purposes as well.
			return 1

		if(health >= 1)
			if((prob(chance)) && (!(P.testing)))
				damage(P.get_structure_damage())
				visible_message(SPAN_WARNING("[P] hits \the [src]!"))
				qdel(P)
				return 0
		else
			return 1
	if(health >= 1)
		if (get_dir(loc, target) == dir)
			return !density
		else
			return 1
	if(istype(mover) && mover.checkpass(PASSTABLE))
		return 1
	if(locate(/obj/structure/sandbags) in get_turf(mover))
		return 1
	return 0

/obj/structure/sandbags/proc/check_cover(obj/item/projectile/P, turf/from)
	var/turf/cover
	if(health >= 1)
		cover = get_turf(src)
	else if(health == 0)
		cover = get_step(loc, get_dir(from, loc))
	if(!cover)
		return 1
	if(get_dist(P.starting, loc) <= 1) //Tables won't help you if people are THIS close
		return 1

	if(istype(P, /obj/item/projectile/test) || P.testing) // Turrets need to try to kill the shield and so their test bullet needs to penetrate.
		return 1

	var/bad_arc = reverse_direction(dir) // Arc of directions from which we cannot block.
	if(!check_parry_arc(src, bad_arc, P)) // This is actually for mobs but it will work for our purposes as well.
		return 1

	if(config.z_level_shooting)
		if(P.height == HEIGHT_HIGH)
			return TRUE // Bullet is too high to hit
		P.height = (P.height == HEIGHT_LOW) ? HEIGHT_LOW : HEIGHT_CENTER

	var/chance = base_cover

	if(P.height == HEIGHT_LOW)
		chance += 30 //if your shooting upwards at this defence you will have a much harder time hitting

	if((prob(chance)) && (!(P.testing)))
		damage(P.get_structure_damage())
		if (health > 0)
			visible_message(SPAN_WARNING("[P] hits \the [src]!"))
			qdel(P)
			return 0
		else
			//visible_message(SPAN_WARNING("[src] breaks down!"))
			//break_to_parts()
			return 1

	return 1

/obj/structure/sandbags/CheckExit(atom/movable/O as mob|obj, target as turf)
	if(istype(O) && O.checkpass(PASSTABLE))
		return 1
	if (get_dir(loc, target) == dir)
		return !density
	else
		return 1

/obj/structure/sandbags/do_climb(var/mob/living/user)
	if(!can_climb(user))
		return

	usr.visible_message(SPAN_WARNING("[user] starts climbing onto \the [src]!"))
	climbers |= user

	var/delay = (issmall(user) ? 20 : 34) * user.mod_climb_delay
	var/duration = max(delay * user.stats.getMult(STAT_VIG, STAT_LEVEL_EXPERT), delay * 0.66)
	if(!do_after(user, duration))
		climbers -= user
		return

	if(!can_climb(user, post_climb_check=1))
		climbers -= user
		return

	if(!neighbor_turf_passable())
		to_chat(user, SPAN_DANGER("You can't climb there, the way is blocked."))
		climbers -= user
		return

	if(get_turf(user) == get_turf(src))
		usr.forceMove(get_step(src, src.dir))
	else
		usr.forceMove(get_turf(src))

	usr.visible_message(SPAN_WARNING("[user] climbed over \the [src]!"))
	climbers -= user
