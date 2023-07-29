//Ingreds

/datum/cooking_with_jane/recipe/cooked_cutlet
	cooking_container = GRILL
	product_type = /obj/item/reagent_containers/food/snacks/cutlet
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/rawcutlet),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cornoil", 1, base=1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1, base=1),
		list(CWJ_USE_GRILL, J_LO, 15 SECONDS)
	)

/datum/cooking_with_jane/recipe/raw_meatball
	cooking_container = BOWL
	product_type = /obj/item/reagent_containers/food/snacks/rawmeatball
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/rawcutlet),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice),
	)

/datum/cooking_with_jane/recipe/cooked_meatball
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/food/snacks/meatball
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/rawmeatball),
		list(CWJ_ADD_REAGENT, "cornoil", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1, base=1),
		list(CWJ_USE_STOVE, J_LO, 20 SECONDS)
	)

/datum/cooking_with_jane/recipe/cooked_patty
	cooking_container = GRILL
	product_type = /obj/item/reagent_containers/food/snacks/patty
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/patty_raw),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cornoil", 1, base=1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1, base=1),
		list(CWJ_USE_GRILL, J_LO, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/sausage
	cooking_container = GRILL
	product_type = /obj/item/reagent_containers/food/snacks/sausage
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/rawmeatball),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/rawbacon),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cornoil", 1, base=1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1, base=1),
		list(CWJ_USE_GRILL, J_LO, 10 SECONDS)
	)

//Reg
/datum/cooking_with_jane/recipe/hotdog
	cooking_container = GRILL
	product_type = /obj/item/reagent_containers/food/snacks/hotdog
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sausage),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, base=1),
		list(CWJ_USE_GRILL, J_LO, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/chickensteak
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/food/snacks/chickensteak

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/chickenbreast, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT, "blackpepper", 1),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_PRODUCE_OPTIONAL, "mushrooms", reagent_skip=TRUE, prod_desc="It has sauteed mushrooms poured on top."),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "reishi", reagent_skip=TRUE, prod_desc="It has extra sauteed mushrooms poured on top."),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "amanita", reagent_skip=TRUE, prod_desc="It has more sauteed mushrooms poured on top."),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "plumphelmet", reagent_skip=TRUE, prod_desc="At this point it is more mushroom sautee than poultry steak."), // THERE IS CLEARLY A POINT TO STOP
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 3, base=3, prod_desc="The poultry has been glazed over with honey."),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "capsaicin", 5, base=6, prod_desc="The poultry was spiced with chili powder."),
		list(CWJ_ADD_REAGENT_OPTIONAL, "lemonjuice", 5, remain_percent=0.1 ,base=3, prod_desc="The poultry has fresh lemon juiced poured on top."),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_USE_GRILL, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/bearsteak
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/food/snacks/bearsteak

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/bearmeat, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT, "blackpepper", 1),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_PRODUCE_OPTIONAL, "mushrooms", reagent_skip=TRUE, prod_desc="It has sauteed mushrooms poured on top."),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "reishi", reagent_skip=TRUE, prod_desc="It has extra sauteed mushrooms poured on top."),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "amanita", reagent_skip=TRUE, prod_desc="It has more sauteed mushrooms poured on top."),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "plumphelmet", reagent_skip=TRUE, prod_desc="At this point it is more mushroom sautee than poultry steak."), // AND WE HAVE ALREADY PASSED IT
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 3, base=3, prod_desc="The bear meat has been glazed over with honey."),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "capsaicin", 5, base=6, prod_desc="The bear meat was spiced with chili powder."),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_USE_GRILL, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/beefcurry
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/beefcurry

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/butterslice, base=10),
		list(CWJ_USE_STOVE, J_LO, 10 SECONDS),
		list(CWJ_ADD_REAGENT, "flour", 5),
		list(CWJ_ADD_REAGENT, "soysauce", 5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/boiledrice),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat),
		list(CWJ_ADD_PRODUCE, "chili"),
		list(CWJ_ADD_PRODUCE, "carrot"),
		list(CWJ_ADD_PRODUCE, "tomato"),
		list(CWJ_USE_STOVE, J_MED, 40 SECONDS)
	)

/datum/cooking_with_jane/recipe/chickencurry
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/chickencurry

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/butterslice, base=10),
		list(CWJ_USE_STOVE, J_LO, 10 SECONDS),
		list(CWJ_ADD_REAGENT, "flour", 5),
		list(CWJ_ADD_REAGENT, "soysauce", 5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/boiledrice),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/chickenbreast),
		list(CWJ_ADD_PRODUCE, "chili"),
		list(CWJ_ADD_PRODUCE, "carrot"),
		list(CWJ_ADD_PRODUCE, "tomato"),
		list(CWJ_USE_STOVE, J_MED, 40 SECONDS)
	)

/datum/cooking_with_jane/recipe/porkchops
	cooking_container = GRILL
	product_type = /obj/item/reagent_containers/food/snacks/porkchops

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/pork, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT, "blackpepper", 1),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_PRODUCE_OPTIONAL, "mushrooms", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "reishi", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "amanita", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "plumphelmet", reagent_skip=TRUE),
		CWJ_END_EXCLUSIVE_OPTIONS,
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "capsaicin", 5, base=6, prod_desc="The pork was spiced with chili powder."),
		list(CWJ_ADD_REAGENT_OPTIONAL, "pineapplejuice", 5, remain_percent=0.1, base=5, prod_desc="The pork was roasted in pineapple juice."),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 5, remain_percent=0.1 ,base=3, prod_desc="The pork was glazed with honey"),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 3, remain_percent=0.5 ,base=8, prod_desc="The pork was slathered with BBQ sauce"),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_USE_GRILL, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/roastchicken
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/roastchicken
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/chicken),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT, "blackpepper", 1),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/wingfangchu
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/wingfangchu
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/xenomeat),
		list(CWJ_ADD_REAGENT, "soysauce", 5),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1)
	)

/datum/cooking_with_jane/recipe/sashimi
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/sashimi
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/carp),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/carp),
		list(CWJ_ADD_REAGENT, "soysauce", 5),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1)
	)

/datum/cooking_with_jane/recipe/stewedsoymeat
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/stewedsoymeat
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/soydope),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/soydope),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "carrot", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_USE_STOVE, J_HI, 15 SECONDS)
	)

/datum/cooking_with_jane/recipe/bacon
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/food/snacks/bacon
	step_builder = list(
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT, "cornoil", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1, base=1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/rawbacon),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, base=1, prod_desc="The bacon strips have been caramelized."),
		list(CWJ_USE_STOVE, J_LO, 15 SECONDS)
	)

/datum/cooking_with_jane/recipe/tortilla
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/tortilla
	product_count = 3
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/flatdoughslice),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/flatdoughslice),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/flatdoughslice),
		list(CWJ_USE_OVEN, J_HI, 5 SECONDS)
	)

/datum/cooking_with_jane/recipe/taco
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/food/snacks/taco
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/tortilla),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT, "cornoil", 1),
		list(CWJ_ADD_PRODUCE, "corn"),
		list(CWJ_ADD_PRODUCE, "cabbage"),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cutlet),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		list(CWJ_USE_STOVE, J_LO, 15 SECONDS)
	)

//Kebob - This is just kebab but americans be americans
/datum/cooking_with_jane/recipe/kebob
	cooking_container = GRILL
	product_type = /obj/item/reagent_containers/food/snacks/monkeykabob
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/material/kitchen/utensil/skewer),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_USE_GRILL, J_LO, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/kebob_tofu
	cooking_container = GRILL
	product_type = /obj/item/reagent_containers/food/snacks/tofukabob
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/material/kitchen/utensil/skewer),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/tofu),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/tofu),
		list(CWJ_USE_GRILL, J_LO, 10 SECONDS)
	)

/* UNTESTED SPECIALITY MEAT KABOBS
/datum/cooking_with_jane/recipe/kebob_monkey
	cooking_container = GRILL
	product_type = /obj/item/reagent_containers/food/snacks/monkeykabob
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/stack/rods),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/monkey),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/monkey),
		list(CWJ_USE_GRILL, J_LO, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/kebob_synth
	cooking_container = GRILL
	product_type = /obj/item/reagent_containers/food/snacks/monkeykabob
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/stack/rods),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/syntiflesh),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/syntiflesh),
		list(CWJ_USE_GRILL, J_LO, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/kebob_human
	cooking_container = GRILL
	product_type = /obj/item/reagent_containers/food/snacks/human/kabob
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/stack/rods),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/human),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/human),
		list(CWJ_USE_GRILL, J_LO, 10 SECONDS)
	)
*/

/datum/cooking_with_jane/recipe/friedchikin
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/food/snacks/friedchikin
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/chicken),
		list(CWJ_ADD_REAGENT, "flour", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "egg", 3, base=1, prod_desc="The fried poultry has an extra crispy batter coating."),
		list(CWJ_ADD_REAGENT_OPTIONAL, "capsaicin", 5, base=6, prod_desc="The fried poultry was spiced up with chili powder."),
		list(CWJ_ADD_REAGENT, "cornoil", 1),
		list(CWJ_USE_STOVE, J_MED, 15 SECONDS)
	)

/datum/cooking_with_jane/recipe/tonkatsu
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/food/snacks/tonkatsu
	step_builder = list(
		list(CWJ_ADD_REAGENT, "flour", 5),
		list(CWJ_ADD_REAGENT, "egg", 3),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/pork),
		list(CWJ_USE_TOOL_OPTIONAL, QUALITY_HAMMERING, 15, prod_desc="The pork meat is soft and tenderized."),
		list(CWJ_ADD_REAGENT, "cornoil", 1),
		list(CWJ_USE_STOVE, J_HI, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/katsudon
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/katsudon
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/boiledrice),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/tonkatsu),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage"),
		list(CWJ_ADD_REAGENT, "egg", 3),
		list(CWJ_ADD_REAGENT, "soysauce", 5)
	)

/datum/cooking_with_jane/recipe/cubancarp
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/food/snacks/cubancarp
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/carp, exclude_reagents=list("carpotoxin")),
		list(CWJ_ADD_PRODUCE, "chili"),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, base=1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/dough),
		list(CWJ_USE_STOVE, J_MED, 15 SECONDS)
	)

/datum/cooking_with_jane/recipe/enchiladas
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/enchiladas
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cutlet, exclude_reagents=list("carpotoxin", "blattedin", "pacid")),
		list(CWJ_ADD_PRODUCE, "chili"),
		list(CWJ_ADD_PRODUCE, "chili"),
		list(CWJ_ADD_REAGENT_OPTIONAL, "capsaicin", 5, base=5),
		list(CWJ_ADD_PRODUCE, "corn"),
		list(CWJ_USE_OVEN, J_MED, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/fishfingers
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/food/snacks/fishfingers
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/carp, exclude_reagents=list("carpotoxin")),
		list(CWJ_USE_TOOL_OPTIONAL, QUALITY_HAMMERING, 15, prod_desc="The fish fingers are soft and tenderized."),
		list(CWJ_ADD_REAGENT, "flour", 5),
		list(CWJ_ADD_REAGENT, "egg", 3),
		list(CWJ_ADD_REAGENT, "cornoil", 1),
		list(CWJ_USE_STOVE, J_HI, 5 SECONDS)
	)

/datum/cooking_with_jane/recipe/fish_n_chips
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/fishandchips
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/fishfingers),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, base=1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/fries)
	)
