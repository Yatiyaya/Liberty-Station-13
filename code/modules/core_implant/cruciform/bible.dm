/obj/item/book/ritual/cruciform
	name = "Custodian hearth lantern"
	desc = "Holds lectures for use by Custodians."
	icon = 'icons/obj/nt_melee.dmi'
	icon_state = "hearth_lantern"
	item_state = "hearth_lantern"
	price_tag = 150

/*
/obj/item/book/ritual/cruciform/ritual(var/datum/ritual/R)
	var/data = ""
	data += "<div style='margin-bottom:10px;'>"
	data += "<b>[capitalize(R.name)]</b><br>"
	data += "<a href='[href(R)]'>[R.get_display_phrase()]</a><br>"
	data += "<i>[R.desc]</i></div>"
	return data
*/

/*/obj/item/book/ritual/cruciform/inquisitor
	name = "Inquisitor ritual book"
	desc = "Contains holy litany and prayers only for the Inquisitor."
	icon_state = "biblep"*/

/obj/item/book/ritual/cruciform/priest
	name = "Oathpledge hearth lantern"
	desc = "Holds lectures meant only for the Oathpledge."
	icon_state = "hearth_lantern_oathpledge"
	item_state = "hearth_lantern_oathpledge"
	price_tag = 250
