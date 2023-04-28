//salad

/datum/cooking_with_jane/recipe/tossedsalad
	cooking_container = BOWL
	product_type = /obj/item/reagent_containers/food/snacks/tossedsalad
	step_builder = list(
		list(CWJ_ADD_PRODUCE, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "carrot", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "apple", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cornoil", 1, base=1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1),
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/food/snacks/stuffing, base=10, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
	)

/datum/cooking_with_jane/recipe/aesirsalad
	cooking_container = BOWL
	product_type = /obj/item/reagent_containers/food/snacks/aesirsalad
	step_builder = list(
		list(CWJ_ADD_PRODUCE, "ambrosiadeus", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cornoil", 1, base=1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1),
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/food/snacks/stuffing, base=10, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "goldapple", reagent_skip=TRUE),
	)

/datum/cooking_with_jane/recipe/validsalad
	cooking_container = BOWL
	product_type = /obj/item/reagent_containers/food/snacks/validsalad
	step_builder = list(
		list(CWJ_ADD_PRODUCE, "ambrosia", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "ambrosia", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "ambrosia", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cornoil", 1, base=1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1),
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/food/snacks/stuffing, base=5, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "potato", reagent_skip=TRUE),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meatball),
	)

/datum/cooking_with_jane/recipe/stuffing
	cooking_container = BOWL
	product_type = /obj/item/reagent_containers/food/snacks/stuffing
	product_count = 3
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/bread),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cornoil", 1, base=1),
		list(CWJ_ADD_REAGENT, "blackpepper", 1),
		list(CWJ_ADD_REAGENT, "water", 5),
	)
