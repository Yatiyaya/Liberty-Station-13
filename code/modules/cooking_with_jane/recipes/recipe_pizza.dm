//PIZZA!!!

/datum/cooking_with_jane/recipe/pizzamargherita
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/pizza/margherita
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/flatdough),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		list(CWJ_ADD_REAGENT_OPTIONAL, "water", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "flour", 5),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
		list(CWJ_USE_OVEN, J_MED, 35 SECONDS)
	)

/datum/cooking_with_jane/recipe/meatpizza
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/pizza/meatpizza
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/flatdough),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		list(CWJ_ADD_REAGENT_OPTIONAL, "water", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "flour", 5),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
		list(CWJ_USE_OVEN, J_MED, 35 SECONDS)
	)

/datum/cooking_with_jane/recipe/mushroompizza
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/pizza/mushroompizza
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/flatdough),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		list(CWJ_ADD_REAGENT_OPTIONAL, "water", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "flour", 5),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "mushrooms", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "mushrooms", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "mushrooms", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "mushrooms", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "mushrooms", reagent_skip=TRUE),
		list(CWJ_USE_OVEN, J_MED, 35 SECONDS)
	)

/datum/cooking_with_jane/recipe/vegetablepizza
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/pizza/vegetablepizza
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/flatdough),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		list(CWJ_ADD_REAGENT_OPTIONAL, "water", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "flour", 5),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "eggplant", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "carrot", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "mushrooms", reagent_skip=TRUE),
		list(CWJ_USE_OVEN, J_MED, 35 SECONDS)
	)

/datum/cooking_with_jane/recipe/hawaiianpizza
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/pizza/hawaiianpizza
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/flatdough),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		list(CWJ_ADD_REAGENT_OPTIONAL, "water", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "flour", 5),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "pineapple", reagent_skip=TRUE),
		list(CWJ_USE_OVEN, J_MED, 35 SECONDS)
	)
