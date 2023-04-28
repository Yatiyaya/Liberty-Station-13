//PIZZA!!!

/datum/cooking_with_jane/recipe/pizzamargherita
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/pizza/margherita
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/flatdough, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge, qmod=0.5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "water", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "flour", 5),
		list(CWJ_ADD_PRODUCE, "tomato", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_USE_OVEN, J_MED, 35 SECONDS)
	)

/datum/cooking_with_jane/recipe/meatpizza
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/pizza/meatpizza
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/flatdough, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge, qmod=0.5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "water", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "flour", 5),
		list(CWJ_ADD_PRODUCE, "tomato", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_USE_OVEN, J_MED, 35 SECONDS)
	)

/datum/cooking_with_jane/recipe/mushroompizza
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/pizza/mushroompizza
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/flatdough, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge, qmod=0.5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "water", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "flour", 5),
		list(CWJ_ADD_PRODUCE, "tomato", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "mushrooms", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "mushrooms", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "mushrooms", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "mushrooms", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "mushrooms", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_USE_OVEN, J_MED, 35 SECONDS)
	)

/datum/cooking_with_jane/recipe/vegetablepizza
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/pizza/vegetablepizza
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/flatdough, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge, qmod=0.5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "water", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "flour", 5),
		list(CWJ_ADD_PRODUCE, "tomato", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "eggplant", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "cabbage", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "carrot", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "mushrooms", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_USE_OVEN, J_MED, 35 SECONDS)
	)

/datum/cooking_with_jane/recipe/hawaiianpizza
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/pizza/hawaiianpizza
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/flatdough, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge, qmod=0.5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "water", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "flour", 5),
		list(CWJ_ADD_PRODUCE, "tomato", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "pineapple", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_USE_OVEN, J_MED, 35 SECONDS)
	)
