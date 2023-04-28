/datum/cooking_with_jane/recipe/friedegg_basic
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/food/snacks/friedegg
	step_builder = list(
		CWJ_BEGIN_OPTION_CHAIN,
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/food/snacks/butterslice, base=10, reagent_skip=TRUE),
		list(CWJ_USE_STOVE_OPTIONAL, J_LO, 10 SECONDS),
		CWJ_END_OPTION_CHAIN,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/egg, exclude_reagents=list("blattedin")),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT, "blackpepper", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cornoil", 1, base=1),
		list(CWJ_USE_STOVE, J_LO, 15 SECONDS)
	)

/datum/cooking_with_jane/recipe/boiled_egg
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/boiledegg
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/egg, exclude_reagents=list("blattedin")),
		list(CWJ_ADD_REAGENT, "water", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_USE_STOVE, J_MED, 15 SECONDS)
	)

/datum/cooking_with_jane/recipe/baconegg
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/food/snacks/baconeggs
	step_builder = list(
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT, "cornoil", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bacon),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, base=1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/friedegg),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1, base=1),
		list(CWJ_USE_STOVE, J_LO, 5 SECONDS)
	)

/datum/cooking_with_jane/recipe/benedict
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/food/snacks/benedict
	step_builder = list(
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT, "cornoil", 1),
		list(CWJ_ADD_REAGENT, "egg", 3),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/butterslice),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 3, base=3),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bacon),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1, base=1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/boiledegg),
		list(CWJ_USE_STOVE, J_LO, 5 SECONDS)
	)

/datum/cooking_with_jane/recipe/omelette
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/food/snacks/omelette
	step_builder = list(
		list(CWJ_ADD_REAGENT, "cornoil", 2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/egg),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/egg),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 3, base=3),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1, base=1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/butterslice),
		list(CWJ_USE_STOVE, J_LO, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/chocolateegg
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/chocolateegg
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/egg),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/chocolatebar),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sugar", 5),
		list(CWJ_USE_STOVE, J_LO, 15 SECONDS)
	)

/datum/cooking_with_jane/recipe/chawanmushi
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/chawanmushi
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/egg),
		list(CWJ_ADD_PRODUCE, "mushrooms", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT, "water", 5),
		list(CWJ_ADD_REAGENT, "soysauce", 5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/egg),
		list(CWJ_USE_OVEN, J_LO, 15 SECONDS)
	)
