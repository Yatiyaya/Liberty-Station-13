//A cooking step that involves adding a reagent to the food.
/datum/cooking_with_jane/recipe_step/use_oven
	class=CWJ_USE_OVEN
	auto_complete_enabled = TRUE
	var/time
	var/heat

//set_heat: The temperature the oven must bake at.
//set_time: How long something must be baked in the overn
//our_recipe: The parent recipe object
/datum/cooking_with_jane/recipe_step/use_oven/New(var/set_heat, var/set_time, var/datum/cooking_with_jane/recipe/our_recipe)



	time = set_time
	heat = set_heat

	desc = "Cook in an oven set to [heat] for [ticks_to_text(time)]."

	..(our_recipe)


/datum/cooking_with_jane/recipe_step/use_oven/check_conditions_met(var/obj/used_item, var/datum/cooking_with_jane/recipe_tracker/tracker)

	if(!istype(used_item, /obj/machinery/cooking_with_jane/oven))
		return CWJ_CHECK_INVALID

	return CWJ_CHECK_VALID

/datum/cooking_with_jane/recipe_step/use_oven/follow_step(var/obj/used_item, var/datum/cooking_with_jane/recipe_tracker/tracker)
	return CWJ_SUCCESS

/datum/cooking_with_jane/recipe_step/use_oven/is_complete(var/obj/used_item, var/datum/cooking_with_jane/recipe_tracker/tracker)

	var/obj/item/reagent_containers/cooking_with_jane/cooking_container/container = tracker.holder_ref.resolve()

	if(container.oven_data[heat] >= time)
		#ifdef CWJ_DEBUG
		log_debug("use_oven/is_complete() Returned True; comparing [heat]: [container.oven_data[heat]] to [time]")
		#endif
		return TRUE

	#ifdef CWJ_DEBUG
	log_debug("use_oven/is_complete() Returned False; comparing [heat]: [container.oven_data[heat]] to [time]")
	#endif
	return FALSE
