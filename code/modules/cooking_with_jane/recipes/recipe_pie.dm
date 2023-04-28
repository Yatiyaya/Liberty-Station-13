//Pies
/datum/cooking_with_jane/recipe/pie
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/pie
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/flatdough, qmod=0.5),
		list(CWJ_ADD_PRODUCE, "banana", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT, "sugar", 5, base=1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "woodpulp", 1, base=1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/butterslice, qmod=0.5),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/meatpie
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/meatpie
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/flatdough, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_REAGENT_OPTIONAL, "woodpulp", 1, base=1),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/tofupie
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/tofupie
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/flatdough, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/tofu, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_REAGENT_OPTIONAL, "woodpulp", 1, base=1),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/xemeatpie
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/xemeatpie
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/flatdough, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/xenomeat, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_REAGENT_OPTIONAL, "woodpulp", 1, base=1),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/cherrypie
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/cherrypie
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/flatdough, qmod=0.5),
		list(CWJ_ADD_PRODUCE, "cherry", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT, "sugar", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "woodpulp", 1, base=1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/butterslice, qmod=0.5),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/berryclafoutis
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/berryclafoutis
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/flatdough, qmod=0.5),
		list(CWJ_ADD_PRODUCE, "berries", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT, "sugar", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "woodpulp", 1, base=1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/butterslice, qmod=0.5),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/amanita_pie
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/amanita_pie
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/flatdough, qmod=0.5),
		list(CWJ_ADD_REAGENT, "amatoxin", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "woodpulp", 1, base=1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/butterslice, qmod=0.5),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/plump_pie
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/plump_pie
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/flatdough, qmod=0.5),
		list(CWJ_ADD_PRODUCE, "plumphelmet", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "woodpulp", 1, base=1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/butterslice, qmod=0.5),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/pumpkinpie
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/pumpkinpie
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/flatdough, qmod=0.5),
		list(CWJ_ADD_PRODUCE, "pumpkin", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "woodpulp", 1, base=1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/butterslice, qmod=0.5),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/applepie
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/applepie
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/flatdough, qmod=0.5),
		list(CWJ_ADD_PRODUCE, "apple", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "woodpulp", 1, base=1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/butterslice, qmod=0.5),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)
