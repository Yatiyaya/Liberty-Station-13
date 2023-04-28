//pasta

/datum/cooking_with_jane/recipe/raw_speggie
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/spagetti
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/doughslice),
		list(CWJ_ADD_REAGENT_OPTIONAL, "flour", 1, base=1),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1)
	)

/datum/cooking_with_jane/recipe/boiledspagetti
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/boiledspagetti
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/spagetti),
		list(CWJ_USE_STOVE, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/pastatomato
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/food/snacks/pastatomato
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/boiledspagetti),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
		list(CWJ_USE_STOVE, J_LO, 5 SECONDS)
	)

/datum/cooking_with_jane/recipe/meatballspagetti
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/food/snacks/meatballspagetti
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/boiledspagetti),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meatball, exclude_reagents=list("blattedin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meatball, exclude_reagents=list("blattedin")),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE),
		list(CWJ_USE_STOVE, J_LO, 5 SECONDS)
	)

/datum/cooking_with_jane/recipe/spesslaw
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/food/snacks/spesslaw
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/boiledspagetti),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meatball, exclude_reagents=list("blattedin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meatball, exclude_reagents=list("blattedin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meatball, exclude_reagents=list("blattedin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meatball, exclude_reagents=list("blattedin")),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE),
		list(CWJ_USE_STOVE, J_LO, 5 SECONDS)
	)
