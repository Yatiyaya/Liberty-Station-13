/*These are the old cooking system, use this if CWJ doesn't work cause this will wor kevery time, just remember the app
doesn't show recipes put in here so you know slap them on wiki or ingame manual - Lamasmaster
*/
// see code/datums/recipe.dm

/datum/recipe/dumplings
	fruit = list("cabbage" = 1) // A recipe that ACTUALLY uses cabbage.
	reagents = list("soysauce" = 5, "sodiumchloride" = 1, "blackpepper" = 1, "cornoil" = 1) // No sesame oil, corn will have to do.
	items = list(
		/obj/item/reagent_containers/food/snacks/rawbacon,
		/obj/item/reagent_containers/food/snacks/rawbacon, // Substitute for minced pork.
		/obj/item/reagent_containers/food/snacks/doughslice,
	)
	result = /obj/item/reagent_containers/food/snacks/dumplings

/datum/recipe/muffinegg
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/friedegg,
		/obj/item/reagent_containers/food/snacks/bacon,
	)
	result = /obj/item/reagent_containers/food/snacks/muffinegg

/datum/recipe/donkpocket
	items = list(
		/obj/item/reagent_containers/food/snacks/dough,
		/obj/item/reagent_containers/food/snacks/meatball
	)
	result = /obj/item/reagent_containers/food/snacks/donkpocket //SPECIAL
	proc/warm_up(var/obj/item/reagent_containers/food/snacks/donkpocket/being_cooked)
		being_cooked.heat()
	make_food(var/obj/container as obj)
		var/obj/item/reagent_containers/food/snacks/donkpocket/being_cooked = ..(container)
		warm_up(being_cooked)
		return being_cooked

/datum/recipe/donkpocket/warm
	reagents = list() //This is necessary since this is a child object of the above recipe and we don't want donk pockets to need flour
	items = list(
		/obj/item/reagent_containers/food/snacks/donkpocket
	)
	result = /obj/item/reagent_containers/food/snacks/donkpocket //SPECIAL
	make_food(var/obj/container as obj)
		var/obj/item/reagent_containers/food/snacks/donkpocket/being_cooked = locate() in container
		if(being_cooked && !being_cooked.warm)
			warm_up(being_cooked)
		return being_cooked

/datum/recipe/cinnamonroll
	reagents = list("cinnamonpowder" = 5, "sugar" = 10, "milk" = 5, "egg" = 3) // We have cinnamon now! Updating this recipe, thank you MikieRPG - Seb
	items = list(
		/obj/item/reagent_containers/food/snacks/doughslice,
		/obj/item/reagent_containers/food/snacks/butterslice,
		/obj/item/reagent_containers/food/snacks/cheesewedge, // For the frosting, same as 5u more of sugar
	)
	result = /obj/item/reagent_containers/food/snacks/cinnamonroll

/datum/recipe/muffin
	reagents = list("milk" = 5, "sugar" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/dough,
	)
	result = /obj/item/reagent_containers/food/snacks/muffin

/datum/recipe/eggplantparm
	fruit = list("eggplant" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/cheesewedge,
		/obj/item/reagent_containers/food/snacks/cheesewedge
		)
	result = /obj/item/reagent_containers/food/snacks/eggplantparm

/datum/recipe/soylenviridians
	fruit = list("soybeans" = 1)
	reagents = list("flour" = 10)
	result = /obj/item/reagent_containers/food/snacks/soylenviridians

/datum/recipe/cheesecake
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/plaincake,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
		/obj/item/reagent_containers/food/snacks/cheesewedge
		)
	result = /obj/item/reagent_containers/food/snacks/sliceable/cheesecake

/datum/recipe/soylentgreen
	reagents = list("flour" = 10)
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/human,
		/obj/item/reagent_containers/food/snacks/meat/human
	)
	result = /obj/item/reagent_containers/food/snacks/soylentgreen

/datum/recipe/chaosdonut
	reagents = list("frostoil" = 5, "capsaicin" = 5, "sugar" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/dough
	)
	result = /obj/item/reagent_containers/food/snacks/donut/chaos

/datum/recipe/cubancarp
	fruit = list("chili" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/dough,
		/obj/item/reagent_containers/food/snacks/meat/carp
	)
	result = /obj/item/reagent_containers/food/snacks/cubancarp

/datum/recipe/popcorn
	reagents = list("cornoil" = 2)
	fruit = list("corn" = 1)
	items = list(/obj/item/reagent_containers/food/snacks/butterslice)
	result = /obj/item/reagent_containers/food/snacks/popcorn

/datum/recipe/cookie
	reagents = list("milk" = 5, "sugar" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/dough,
		/obj/item/reagent_containers/food/snacks/chocolatebar,
		/obj/item/reagent_containers/food/snacks/butterslice,
	)
	result = /obj/item/reagent_containers/food/snacks/cookie

/datum/recipe/fortunecookie
	reagents = list("sugar" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/doughslice,
		/obj/item/paper,
	)
	result = /obj/item/reagent_containers/food/snacks/fortunecookie
	make_food(var/obj/container as obj)
		var/obj/item/paper/paper = locate() in container
		paper.loc = null //prevent deletion
		var/obj/item/reagent_containers/food/snacks/fortunecookie/being_cooked = ..(container)
		paper.loc = being_cooked
		being_cooked.trash = paper //so the paper is left behind as trash without special-snowflake(TM Nodrak) code ~carn
		return being_cooked
	check_items(var/obj/container as obj)
		. = ..()
		if (.)
			var/obj/item/paper/paper = locate() in container
			if (!paper || !paper.info)
				return 0
		return .

/datum/recipe/tonkatsu
	reagents = list("sodiumchloride" = 1, "flour" = 5, "egg" = 3, "cornoil" = 2)
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/pork,
	)
	result = /obj/item/reagent_containers/food/snacks/tonkatsu

/datum/recipe/spacylibertyduff
	reagents = list("water" = 5, "vodka" = 5, "psilocybin" = 5)
	result = /obj/item/reagent_containers/food/snacks/spacylibertyduff

/datum/recipe/amanitajelly
	reagents = list("water" = 5, "vodka" = 5, "amatoxin" = 5)
	result = /obj/item/reagent_containers/food/snacks/amanitajelly
	make_food(var/obj/container as obj)
		var/obj/item/reagent_containers/food/snacks/amanitajelly/being_cooked = ..(container)
		being_cooked.reagents.del_reagent("amatoxin")
		return being_cooked

/datum/recipe/candy_corn
	reagents = list("sugar" = 5, "cornoil" = 5)
	result= /obj/item/reagent_containers/food/snacks/candy_corn

/datum/recipe/enchiladas
	fruit = list("chili" = 2, "corn" = 1)
	items = list(/obj/item/reagent_containers/food/snacks/cutlet)
	result = /obj/item/reagent_containers/food/snacks/enchiladas

/datum/recipe/creamcheesebread
	items = list(
		/obj/item/reagent_containers/food/snacks/dough,
		/obj/item/reagent_containers/food/snacks/dough,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
	)
	result = /obj/item/reagent_containers/food/snacks/sliceable/creamcheesebread

/datum/recipe/monkeysdelight
	fruit = list("banana" = 1)
	reagents = list("sodiumchloride" = 1, "blackpepper" = 1, "flour" = 10)
	items = list(
		/obj/item/reagent_containers/food/snacks/monkeycube
	)
	result = /obj/item/reagent_containers/food/snacks/monkeysdelight

/datum/recipe/fishandchips
	items = list(
		/obj/item/reagent_containers/food/snacks/fries,
		/obj/item/reagent_containers/food/snacks/fishfingers,
	)
	result = /obj/item/reagent_containers/food/snacks/fishandchips

/datum/recipe/sashimi // Ironically, this doesn't get cooked since it's raw fish
	reagents = list("soysauce" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/carp,
		/obj/item/reagent_containers/food/snacks/meat/carp,
	)
	result = /obj/item/reagent_containers/food/snacks/sashimi

/datum/recipe/slimetoast
	reagents = list("slimejelly" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/breadslice,
	)
	result = /obj/item/reagent_containers/food/snacks/jelliedtoast/slime

/datum/recipe/jelliedtoast
	reagents = list("cherryjelly" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/breadslice,
	)
	result = /obj/item/reagent_containers/food/snacks/jelliedtoast/cherry

/datum/recipe/milosoup
	reagents = list("water" = 10)
	items = list(
		/obj/item/reagent_containers/food/snacks/soydope,
		/obj/item/reagent_containers/food/snacks/soydope,
		/obj/item/reagent_containers/food/snacks/tofu,
		/obj/item/reagent_containers/food/snacks/tofu,
	)
	result = /obj/item/reagent_containers/food/snacks/milosoup

/datum/recipe/stewedsoymeat
	fruit = list("carrot" = 1, "tomato" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/soydope,
		/obj/item/reagent_containers/food/snacks/soydope
	)
	result = /obj/item/reagent_containers/food/snacks/stewedsoymeat

/datum/recipe/boiledspagetti
	reagents = list("water" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/spagetti,
	)
	result = /obj/item/reagent_containers/food/snacks/boiledspagetti

/datum/recipe/boiledrice
	reagents = list("water" = 5, "rice" = 10)
	result = /obj/item/reagent_containers/food/snacks/boiledrice

/datum/recipe/ricepudding
	reagents = list("milk" = 5, "rice" = 10)
	result = /obj/item/reagent_containers/food/snacks/ricepudding

/datum/recipe/katsudon
	reagents = list("egg" = 3, "soysauce" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/boiledrice,
		/obj/item/reagent_containers/food/snacks/tonkatsu,
		)
	result = /obj/item/reagent_containers/food/snacks/katsudon

/datum/recipe/pastatomato
	fruit = list("tomato" = 2)
	reagents = list("water" = 5)
	items = list(/obj/item/reagent_containers/food/snacks/spagetti)
	result = /obj/item/reagent_containers/food/snacks/pastatomato

/datum/recipe/poppypretzel
	fruit = list("poppy" = 1)
	items = list(/obj/item/reagent_containers/food/snacks/dough)
	result = /obj/item/reagent_containers/food/snacks/poppypretzel

/datum/recipe/meatballspagetti
	reagents = list("water" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/spagetti,
		/obj/item/reagent_containers/food/snacks/meatball,
		/obj/item/reagent_containers/food/snacks/meatball,
	)
	result = /obj/item/reagent_containers/food/snacks/meatballspagetti

/datum/recipe/spesslaw
	reagents = list("water" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/spagetti,
		/obj/item/reagent_containers/food/snacks/meatball,
		/obj/item/reagent_containers/food/snacks/meatball,
		/obj/item/reagent_containers/food/snacks/meatball,
		/obj/item/reagent_containers/food/snacks/meatball,
	)
	result = /obj/item/reagent_containers/food/snacks/spesslaw

/datum/recipe/candiedapple
	fruit = list("apple" = 1)
	reagents = list("water" = 5, "sugar" = 5)
	result = /obj/item/reagent_containers/food/snacks/candiedapple

/datum/recipe/applepie
	fruit = list("apple" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough,
		/obj/item/reagent_containers/food/snacks/butterslice,
	)
	result = /obj/item/reagent_containers/food/snacks/applepie

/datum/recipe/slimeburger
	reagents = list("slimejelly" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/bun
	)
	result = /obj/item/reagent_containers/food/snacks/jellyburger/slime

/datum/recipe/jellyburger
	reagents = list("cherryjelly" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/bun
	)
	result = /obj/item/reagent_containers/food/snacks/jellyburger/cherry

/datum/recipe/twobread
	reagents = list("wine" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/breadslice,
		/obj/item/reagent_containers/food/snacks/breadslice,
	)
	result = /obj/item/reagent_containers/food/snacks/twobread

/datum/recipe/slimesandwich
	reagents = list("slimejelly" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/breadslice,
		/obj/item/reagent_containers/food/snacks/breadslice,
	)
	result = /obj/item/reagent_containers/food/snacks/jellysandwich/slime

/datum/recipe/cherrysandwich
	reagents = list("cherryjelly" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/breadslice,
		/obj/item/reagent_containers/food/snacks/breadslice,
	)
	result = /obj/item/reagent_containers/food/snacks/jellysandwich/cherry

/datum/recipe/bloodsoup
	reagents = list("blood" = 30)
	result = /obj/item/reagent_containers/food/snacks/bloodsoup

/datum/recipe/slimesoup
	reagents = list("water" = 10, "slimejelly" = 5)
	items = list()
	result = /obj/item/reagent_containers/food/snacks/slimesoup

/datum/recipe/boiledslimeextract
	reagents = list("water" = 5)
	items = list(
		/obj/item/slime_extract,
	)
	result = /obj/item/reagent_containers/food/snacks/boiledslimecore

/datum/recipe/fishfingers
	reagents = list("flour" = 5, "egg" = 3, "cornoil" = 2)
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/carp,
	)
	result = /obj/item/reagent_containers/food/snacks/fishfingers

/datum/recipe/mysterysoup
	reagents = list("water" = 10)
	items = list(
		/obj/item/reagent_containers/food/snacks/badrecipe,
		/obj/item/reagent_containers/food/snacks/tofu,
		/obj/item/reagent_containers/food/snacks/egg,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
	)
	result = /obj/item/reagent_containers/food/snacks/mysterysoup

/datum/recipe/pumpkinpie
	fruit = list("pumpkin" = 1)
	reagents = list("milk" = 5, "sugar" = 5, "egg" = 3, "flour" = 10)
	result = /obj/item/reagent_containers/food/snacks/sliceable/pumpkinpie

/datum/recipe/plumphelmetbiscuit
	fruit = list("plumphelmet" = 1)
	reagents = list("water" = 5, "flour" = 5)
	items = list(/obj/item/reagent_containers/food/snacks/butterslice)
	result = /obj/item/reagent_containers/food/snacks/plumphelmetbiscuit

/datum/recipe/mushroomsoup
	fruit = list("mushroom" = 1)
	reagents = list("milk" = 5, "cream" = 5, "sodiumchloride" = 1, "blackpepper" = 1)
	result = /obj/item/reagent_containers/food/snacks/mushroomsoup

/datum/recipe/chawanmushi
	fruit = list("mushroom" = 1)
	reagents = list("water" = 5, "soysauce" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/egg,
		/obj/item/reagent_containers/food/snacks/egg
	)
	result = /obj/item/reagent_containers/food/snacks/chawanmushi

/datum/recipe/beetsoup
	fruit = list("whitebeet" = 1, "cabbage" = 1)
	reagents = list("water" = 10)
	result = /obj/item/reagent_containers/food/snacks/beetsoup

/datum/recipe/validsalad
	fruit = list("potato" = 1, "ambrosia" = 3)
	items = list(/obj/item/reagent_containers/food/snacks/meatball)
	result = /obj/item/reagent_containers/food/snacks/validsalad
	make_food(var/obj/container as obj)
		var/obj/item/reagent_containers/food/snacks/validsalad/being_cooked = ..(container)
		being_cooked.reagents.del_reagent("toxin")
		return being_cooked

/datum/recipe/stuffing
	reagents = list("water" = 5, "sodiumchloride" = 1, "blackpepper" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/bread,
	)
	result = /obj/item/reagent_containers/food/snacks/stuffing

/datum/recipe/tofurkey
	items = list(
		/obj/item/reagent_containers/food/snacks/tofu,
		/obj/item/reagent_containers/food/snacks/tofu,
		/obj/item/reagent_containers/food/snacks/stuffing,
	)
	result = /obj/item/reagent_containers/food/snacks/tofurkey

/datum/recipe/honey_bun
	reagents = list("sugar" = 3, "honey" = 5, "cream" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/dough,
		/obj/item/reagent_containers/food/snacks/butterslice,
	)
	result = /obj/item/reagent_containers/food/snacks/honeybuns

/datum/recipe/honey_pudding
	reagents = list("sugar" = 3, "honey" = 15, "cream" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/chocolatebar,
	)
	result = /obj/item/reagent_containers/food/snacks/honeypudding

// Fuck Science!
/datum/recipe/ruinedvirusdish
	items = list(
		/obj/item/virusdish
	)
	result = /obj/item/ruinedvirusdish

//////////////////////////////////////////
// bs12 food port stuff
//////////////////////////////////////////
/datum/recipe/mint
	reagents = list("sugar" = 5, "frostoil" = 5)
	result = /obj/item/reagent_containers/food/snacks/mint

//Roach cubes

/datum/recipe/cube/
	fruit = list("potato" = 1)
	reagents = list("protein" = 15, "egg" = 3)
	items = list(/obj/item/reagent_containers/food/snacks/meat/roachmeat)
	result = /obj/item/reagent_containers/food/snacks/cube/roach

/datum/recipe/cube/fuhrer
	fruit = list("potato" = 2)
	reagents = list("protein" = 25, "fuhrerole" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/roachmeat/fuhrer,
		/obj/item/reagent_containers/food/snacks/meat/roachmeat/fuhrer,
	)
	result = /obj/item/reagent_containers/food/snacks/cube/roach/fuhrer

/datum/recipe/cube/jager
	fruit = list("potato" = 1)
	reagents = list("protein" = 10, "blattedin" = 5)
	items = list(/obj/item/reagent_containers/food/snacks/meat/roachmeat/jager)
	result = /obj/item/reagent_containers/food/snacks/cube/roach/jager

/datum/recipe/cube/kraftwerk
	fruit = list("potato" = 1)
	reagents = list("protein" = 10, "gewaltine" = 5)
	items = list(/obj/item/reagent_containers/food/snacks/meat/roachmeat/kraftwerk)
	result = /obj/item/reagent_containers/food/snacks/cube/roach/kraftwerk

/datum/recipe/cube/elektromagnetisch
	fruit = list("potato" = 1)
	reagents = list("protein" = 10, "iron" = 5)
	items = list(/obj/item/reagent_containers/food/snacks/meat/roachmeat/elektromagnetisch)
	result = /obj/item/reagent_containers/food/snacks/cube/roach/elektromagnetisch

/datum/recipe/cube/glowing
	fruit = list("potato" = 1)
	reagents = list("protein" = 10, MATERIAL_URANIUM = 5)
	items = list(/obj/item/reagent_containers/food/snacks/meat/roachmeat/glowing)
	result = /obj/item/reagent_containers/food/snacks/meat/roachmeat/glowing

/datum/recipe/cube/roachling
	fruit = list("potato" = 1)
	reagents = list("protein" = 5, "seligitillin" = 1)
	items = list(/obj/item/reagent_containers/food/snacks/meat/roachmeat)
	result = /obj/item/reagent_containers/food/snacks/cube/roach/roachling

/datum/recipe/cube/seuche
	fruit = list("potato" = 1)
	reagents = list("protein" = 10, "diplopterum" = 5)
	items = list(/obj/item/reagent_containers/food/snacks/meat/roachmeat/seuche)
	result = /obj/item/reagent_containers/food/snacks/cube/roach/seuche

/datum/recipe/cube/panzer
	fruit = list("potato" = 1)
	reagents = list("protein" = 20, "starkellin" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/roachmeat/panzer,
		/obj/item/reagent_containers/food/snacks/meat/roachmeat/panzer,
	)
	result = /obj/item/reagent_containers/food/snacks/cube/roach/panzer

/datum/recipe/cube/gestrahlte
	fruit = list("potato" = 1)
	reagents = list("protein" = 10, "toxin" = 5)
	items = list(/obj/item/reagent_containers/food/snacks/meat/roachmeat)
	result = /obj/item/reagent_containers/food/snacks/cube/roach/grestrahlte
