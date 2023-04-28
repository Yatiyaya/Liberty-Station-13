/datum/cooking_with_jane/recipe/bun
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/bun
	product_count = 3
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/doughslice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/doughslice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/doughslice, qmod=0.5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "woodpulp", 1),
		list(CWJ_USE_OVEN, J_HI, 5 SECONDS)
	)

/datum/cooking_with_jane/recipe/burger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/monkeyburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/patty)
	)

/datum/cooking_with_jane/recipe/burger_human
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/human/burger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/patty)
	)
