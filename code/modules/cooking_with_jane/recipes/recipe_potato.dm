/datum/cooking_with_jane/recipe/mashpotato
	cooking_container = BOWL
	product_type = /obj/item/reagent_containers/food/snacks/mashpotatoes

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_PRODUCE, "potato", 2),
		list(CWJ_ADD_REAGENT, "milk", 2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/butterslice, base=10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1),
		list(CWJ_USE_TOOL, QUALITY_HAMMERING, 15)
	)

/datum/cooking_with_jane/recipe/loadedbakedpotato
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/loadedbakedpotato

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_PRODUCE, "potato", 1),
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/food/snacks/butterslice, base=10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/fries
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/fries

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/rawsticks),
		list(CWJ_ADD_REAGENT, "cornoil", 1),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_USE_STOVE, J_LO, 15 SECONDS)
	)

/datum/cooking_with_jane/recipe/fries_cheesy
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/cheesyfries

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/fries),
		list(CWJ_ADD_REAGENT, "cornoil", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		list(CWJ_USE_STOVE, J_LO, 15 SECONDS)
	)
