/datum/cooking_with_jane/recipe/bun
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/bun
	product_count = 3
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/doughslice),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/doughslice),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/doughslice),
		list(CWJ_USE_OVEN, J_HI, 5 SECONDS)
	)

/datum/cooking_with_jane/recipe/breakfast_muffin
	cooking_container = PAN // Toasting the english muffins and heating the whole thing.
	product_type = /obj/item/reagent_containers/food/snacks/muffinegg
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bacon),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, base=1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 5,base=5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/friedegg),
		list(CWJ_USE_OVEN, J_LO, 15 SECONDS)
	)

/datum/cooking_with_jane/recipe/burger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/monkeyburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/patty)
	)

/datum/cooking_with_jane/recipe/burger_synth
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/monkeyburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/syntiflesh)
	)

/datum/cooking_with_jane/recipe/burger_human
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/human/burger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/human)
	)

/datum/cooking_with_jane/recipe/burger_fish
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/fishburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/carp, exclude_reagents=list("carpotoxin"))
	)

/datum/cooking_with_jane/recipe/burger_tofu
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/tofuburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/tofu)
	)

/datum/cooking_with_jane/recipe/burger_bacon
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/baconburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/patty),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bacon)
	)

/datum/cooking_with_jane/recipe/burger_chicken
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/chickenburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/friedchikin)
	)

/datum/cooking_with_jane/recipe/burger_big
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/bigbiteburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/monkeyburger),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/patty),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/patty),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/friedegg)
	)

/datum/cooking_with_jane/recipe/burger_huge
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/superbiteburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bigbiteburger),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/patty),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/patty),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bacon)
	)

/datum/cooking_with_jane/recipe/burger_roach
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/kampferburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/roachmeat/kampfer, exclude_reagents=list("blattedin", "diplopterum")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge)
	)

/datum/cooking_with_jane/recipe/burger_roach_panzer
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/panzerburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/roachmeat/panzer, exclude_reagents=list("blattedin", "diplopterum", "starkellin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge)
	)

/datum/cooking_with_jane/recipe/burger_roach_hunter
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/jagerburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/roachmeat/jager, exclude_reagents=list("blattedin", "diplopterum", "gewaltine")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge)
	)

/datum/cooking_with_jane/recipe/burger_roach_toxin
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/seucheburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/roachmeat/seuche, exclude_reagents=list("blattedin", "diplopterum", "seligitillin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge)
	)

/datum/cooking_with_jane/recipe/burger_roach_overlord
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/fuhrerburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/roachmeat/fuhrer, exclude_reagents=list("seligitillin", "fuhrerole", "diplopterum")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/roachmeat/fuhrer, exclude_reagents=list("seligitillin", "fuhrerole", "diplopterum"))
	)

/datum/cooking_with_jane/recipe/burger_roach_hivelord
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/kaiserburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/roachmeat/kaiser, exclude_reagents=list("blattedin", "fuhrerole", "seligitillin", "diplopterum", "starkellin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/roachmeat/kaiser, exclude_reagents=list("blattedin", "fuhrerole", "seligitillin", "diplopterum", "starkellin"))
	)

/datum/cooking_with_jane/recipe/burger_roach_big
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/bigroachburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/roachmeat, exclude_reagents=list("blattedin", "diplopterum")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/roachmeat/seuche, exclude_reagents=list("blattedin", "diplopterum", "seligitillin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/roachmeat/panzer, exclude_reagents=list("blattedin", "diplopterum", "starkellin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/roachmeat/jager, exclude_reagents=list("blattedin", "diplopterum", "gewaltine"))
	)

/datum/cooking_with_jane/recipe/burger_xeno
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/xenoburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/xenomeat, exclude_reagents=list("pacid"))
	)

