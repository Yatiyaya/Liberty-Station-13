/obj/item/voucher
	name = "\improper voucher"
	desc = "A token to redeem... something."
	icon = 'icons/obj/voucher.dmi'
	icon_state = "voucher"
	w_class = ITEM_SIZE_TINY
	var/stamped = FALSE //used by the voucher vender to be an anti-cheat

// Marshal
/obj/item/voucher/marshal
	name = "marshal voucher"
	desc = "A token to redeem marshal equipment from a vendor."
	icon_state = "voucher"
	var/voucher_type // The type of equipment the voucher redeem

/obj/item/voucher/marshal/primary
	name = "\improper marshal primary weapon voucher"
	desc = "A token to redeem marshal equipment from a vendor."
	icon_state = "voucher"
	voucher_type = "Primary"

/obj/item/voucher/marshal/specprimary
	name = "\improper Specialist primary weapon voucher"
	desc = "A token to redeem marshal equipment from a vendor."
	icon_state = "voucher"
	voucher_type = "SpecPrimary"

/obj/item/voucher/marshal/rangerprimary
	name = "Ranger primary weapon voucher"
	desc = "A token to redeem marshal equipment from a vendor."
	icon_state = "voucher"
	voucher_type = "RangerPrimary"

/obj/item/voucher/marshal/secondary
	name = "\improper marshal secondary weapon voucher"
	desc = "A token to redeem marshal equipment from a vendor."
	icon_state = "voucher"
	voucher_type = "Secondary"

/obj/item/voucher/marshal/rangersecondary
	name = "Ranger secondary weapon voucher"
	desc = "A token to redeem marshal equipment from a vendor."
	icon_state = "voucher"
	voucher_type = "RangerSecondary"

/obj/item/voucher/marshal/wosecondary
	name = "Warrant Officer secondary weapon voucher"
	desc = "A token to redeem marshal equipment from a vendor."
	icon_state = "voucher"
	voucher_type = "WOSecondary"

/obj/item/voucher/marshal/armor
	name = "\improper marshal armor voucher"
	desc = "A token to redeem marshal equipment from a vendor."
	icon_state = "voucher"
	voucher_type = "Armor"

// Voucher Box.
/obj/item/storage/box/marshal_voucher
	name = "\improper marshal voucher box"
	desc = "A box full of vouchers."

	populate_contents()
		new /obj/item/voucher/marshal/primary(src)
		new /obj/item/voucher/marshal/secondary(src)
		new /obj/item/voucher/marshal/armor(src)
