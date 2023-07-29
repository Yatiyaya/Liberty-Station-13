/obj/item/reagent_containers/food/snacks/breadslice/attackby(obj/item/W as obj, mob/user as mob)

	if(istype(W,/obj/item/reagent_containers/food/snacks/butterslice))
		new /obj/item/reagent_containers/food/snacks/butterbread(src)
		to_chat(user, "You spread the butter on the toast.")
		qdel(W)
		qdel(src)

	if(istype(W,/obj/item/material/shard) || istype(W,/obj/item/reagent_containers/food/snacks))
		var/obj/item/reagent_containers/food/snacks/csandwich/S = new(get_turf(src))
		S.attackby(W,user)
		qdel(src)

	..()

// No intrinsic nutriment value since this is a skeleton sandwich
// that will take reagents from whatever is stacked on it
/obj/item/reagent_containers/food/snacks/csandwich
	name = "sandwich"
	desc = "The best thing since sliced bread."
	icon_state = "breadslice"
	trash = /obj/item/trash/plate
	bitesize = 2
	cooked = TRUE

	var/list/ingredients = list()
	var/shard_limit = 3 // How many shards can we slap on the sandwich?
	var/shard_amt = 0 // How many shards are already in the sandwich?

/obj/item/reagent_containers/food/snacks/csandwich/attackby(obj/item/W as obj, mob/user as mob)

	var/sandwich_limit = 4
	for(var/obj/item/O in ingredients)
		if(istype(O,/obj/item/reagent_containers/food/snacks/breadslice))
			sandwich_limit += 4

	if(src.contents.len > sandwich_limit)
		to_chat(user, SPAN_WARNING("If you put anything else on \the [src] it's going to collapse."))
		return
	else if(istype(W,/obj/item/material/shard))
		if(shard_limit == 0)
			to_chat(user, SPAN_NOTICE("You cannot sneak any more shards in \the [src] without making it obvious."))
			return
		else
			to_chat(user, SPAN_NOTICE("You hide \a [W] in \the [src]."))
			user.drop_from_inventory(W, src)
			shard_limit -= 1
			shard_amt += 1
			update()
			return
	else if(istype(W,/obj/item/reagent_containers/food/snacks))
		to_chat(user, SPAN_NOTICE("You add \a [W] between \the [src]'s breads."))
		var/obj/item/reagent_containers/F = W
		F.reagents.trans_to_obj(src, F.reagents.total_volume) // This will also transfer nutriment taste description.
		user.drop_from_inventory(W, src)
		ingredients += W
		update()
		return
	..()

/obj/item/reagent_containers/food/snacks/csandwich/proc/update()
	var/fullname = "" //We need to build this from the contents of the var.
	var/i = 0

	cut_overlays()

	for(var/obj/item/reagent_containers/food/snacks/O in ingredients)

		i++
		if(i == 1)
			fullname += "[O.name]"
		else if(i == ingredients.len)
			fullname += " and [O.name]"
		else
			fullname += ", [O.name]"

		var/image/I = new(src.icon, "sandwich_filling")
		I.color = O.filling_color
		I.pixel_x = pick(list(-1,0,1))
		I.pixel_y = (i*2)+1
		add_overlay(I)

	var/image/T = new(src.icon, "sandwich_top")
	T.pixel_x = pick(list(-1,0,1))
	T.pixel_y = (ingredients.len * 2)+1
	add_overlay(T)

	name = lowertext("[fullname] sandwich")
	if(length(name) > 80) name = "[pick(list("absurd","colossal","enormous","ridiculous"))] sandwich"
	w_class = n_ceil(CLAMP((ingredients.len/2),2,4))

/obj/item/reagent_containers/food/snacks/csandwich/Destroy()
	for(var/obj/item/O in ingredients)
		qdel(O)
	. = ..()

/obj/item/reagent_containers/food/snacks/csandwich/examine(mob/user)
	..(user)
	var/obj/item/O = pick(contents)
	to_chat(user, SPAN_NOTICE("You think you can see [O.name] in there."))

/obj/item/reagent_containers/food/snacks/csandwich/attack(mob/M as mob, mob/user as mob, def_zone)
	var/obj/item/shard
	for(var/obj/item/O in contents)
		if(istype(O,/obj/item/material/shard))
			shard = O
			break

	var/mob/living/H
	if(isliving(M))
		H = M

	if(H && shard_amt >= 1 && M == user) //This needs a check for feeding the food to other people, but that could be abusable.
		to_chat(H, SPAN_WARNING("You lacerate your mouth with [shard_amt] [shard.name]\s that [shard_amt == 1 ? "was" : "were"] hidden in the sandwich!"))
		H.damage_through_armor(shard_amt * 5, BRUTE, BP_HEAD, ARMOR_MELEE)
		H.emote("painscream") // OUCH OOF MY TEEF
		qdel(shard)
		shard_amt = 0 // (prevents masochism)
	..()

// Pre-made sandwiches

/obj/item/reagent_containers/food/snacks/muffinegg
	name = "muffin egg sandwich"
	desc = "A muffin sandwich consisting of a round fried egg and locally sourced bacon, a good breakfast takeaway choice."
	icon_state = "muffinegg"
	bitesize = 2
	nutriment_desc = list("bacon" = 4, "runny fried egg" = 3, "muffin" = 2)
	nutriment_amt = 9
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/sandwich
	name = "sandwich"
	desc = "A grand creation of meat, cheese, bread, and several leaves of lettuce! Arthur Dent would be proud."
	icon_state = "sandwich"
	filling_color = "#D9BE29"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=4)
	nutriment_desc = list("bread" = 3, "cheese" = 3)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 3)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 13)

/obj/item/reagent_containers/food/snacks/toastedsandwich
	name = "toasted sandwich"
	desc = "Your classic sandwich, grilled with butter to amp up its deliciousness factor tenfold."
	icon_state = "toastedsandwich"
	filling_color = "#D9BE29"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=4)
	nutriment_desc = list("toasted bread" = 4, "cheese" = 1, "butter" = 1)
	nutriment_amt = 6
	preloaded_reagents = list("protein" = 6) // Who thought putting carbon on a FOOD was a good idea?!
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 17)

/obj/item/reagent_containers/food/snacks/toasted_guild_sandwich
	name = "deluxe toasted sandwich"
	desc = "A perfectly toasted sandwich with all the works."
	icon_state = "toastedsandwich"
	filling_color = "#D9BE29"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=4)
	nutriment_desc = list("exquisitely toasted bread" = 4, "cheese" = 2)
	nutriment_amt = 6
	preloaded_reagents = list("protein" = 3, "greaser" = 3, "glucose" = 2)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 23)

/obj/item/reagent_containers/food/snacks/toastedsandwich/holy
	name = "precept sandwich"
	desc = "A classic sandwich grilled in butter and toasted perfectly. Comes packed with protein-rich meat made from mukwahs and cheese derived from tangu milk, making it an immensely empowering meal. \
	Side effects include enhanced toughness, robustness, movement speed, and twitching."
	preloaded_reagents = list("protein" = 10, "tangu_milk" = 10, "chronos" = 10)

/obj/item/reagent_containers/food/snacks/grilledcheese
	name = "grilled cheese sandwich"
	desc = "Goes great with Tomato soup!"
	icon_state = "toastedsandwich"
	filling_color = "#D9BE29"
	bitesize = 2
	nutriment_desc = list("toasted bread" = 2, "cheese" = 2)
	nutriment_amt = 4
	preloaded_reagents = list("protein" = 4)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 20)

/obj/item/reagent_containers/food/snacks/blt
	name = "\proper BLT"
	desc = "A classic sandwich composed of nothing more than bacon, lettuce and tomato."
	icon_state = "blt"
	bitesize = 2
	nutriment_desc = list("toasted bread" = 2, "bacon" = 2, "tomato" = 2)
	nutriment_amt = 6
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/twobread
	name = "two bread"
	desc = "It is very bitter and winy."
	icon_state = "twobread"
	filling_color = "#DBCC9A"
	bitesize = 3
	center_of_mass = list("x"=15, "y"=12)
	nutriment_desc = list("sourness" = 2, "bread" = 2)
	nutriment_amt = 2
	//cooked = TRUE		Classic bri'ish cuisine is sad and you should gain no sanity from this
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/jellysandwich
	name = "jelly sandwich"
	desc = "You wish you had some peanut butter to go with this..."
	icon_state = "jellysandwich"
	trash = /obj/item/trash/plate
	filling_color = "#9E3A78"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=8)
	nutriment_desc = list("bread" = 2)
	nutriment_amt = 2
	matter = list(MATERIAL_BIOMATTER = 6)

/obj/item/reagent_containers/food/snacks/jellysandwich/slime
	preloaded_reagents = list("slimejelly" = 5)

/obj/item/reagent_containers/food/snacks/jellysandwich/cherry
	preloaded_reagents = list("cherryjelly" = 5)

/obj/item/reagent_containers/food/snacks/cubancarp
	name = "cuban carp"
	desc = "A sandwich that burns your tongue and then leaves it numb!"
	icon_state = "cubancarp"
	trash = /obj/item/trash/plate
	filling_color = "#E9ADFF"
	bitesize = 3
	center_of_mass = list("x"=12, "y"=5)
	nutriment_desc = list("toasted bread" = 3)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 3, "capsaicin" = 3)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 8)

/obj/item/reagent_containers/food/snacks/icecreamsandwich
	name = "icecream sandwich"
	desc = "A classic icecream sandwiched between two brownies, an essential dessert to have by the dozen."
	icon_state = "icecreamsandwich"
	bitesize = 4
	nutriment_amt = 10
	nutriment_desc = list("soft icecream" = 2, "bownies" = 2, "perfection" = 6)
	matter = list(MATERIAL_BIOMATTER = 10)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/strawberrysandwich
	name = "strawberry icecream sandwich"
	desc = "A classic strawberry icecream sandwiched between two vanilla cookies, an essential treat to have by the dozen."
	icon_state = "icecreamsandwich_sb"
	bitesize = 4
	nutriment_amt = 10
	nutriment_desc = list("strawberry icecream" = 2, "cookies" = 2, "perfection" = 6)
	matter = list(MATERIAL_BIOMATTER = 10)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/chocolatesandwich
	name = "chocolate icecream sandwich"
	desc = "A classic chocolate icecream sandwiched between two brownies, for those who want an extra chocolatey flavor to their perfection."
	icon_state = "icecreamsandwich_ch"
	bitesize = 4
	nutriment_amt = 10
	nutriment_desc = list("chocolate icecream" = 2, "bownies" = 2, "perfection" = 6)
	matter = list(MATERIAL_BIOMATTER = 10)
	cooked = TRUE
