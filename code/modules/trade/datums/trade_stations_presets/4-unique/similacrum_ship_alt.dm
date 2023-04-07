/datum/trade_station/similacrum_printer_ship
	icon_states = list("similacrum_frigate", "ship")
	uid = "similacrum_printer"
	tree_x = 0.66
	tree_y = 0.6
	start_discovered = FALSE
	spawn_always = TRUE
	markup = UNIQUE_GOODS
	base_income = 800
	wealth = 0
	recommendations_needed = 1
	hidden_inv_threshold = 2000
	recommendation_threshold = 4000
	regain_stock = FALSE
	name_pool = list("Dayinji" = "A still functioning, heavily armed similacrum ship that still produces and offers wares, likely entirely unaware of Similacrum Positronics collapse given its \
	automated. It's a wonder it hasn't been raided, but then again its protected by a massive army of still functioning combat drones. This one specializes in a wide variety of interesting goods.")
	inventory = list(
		"Sheji pan" = list(
			/obj/item/computer_hardware/hard_drive/portable/design/onestar/stockparts = good_data("SD Stockpart Disk", list(30, 50), 900),
			/obj/item/computer_hardware/hard_drive/portable/design/onestar = good_data("SD Tool Disk", list(30, 50), 1200)
		),
		"Gongju" = list(
			/obj/item/tool/crowbar/onestar = custom_good_nameprice("SD Crowbar", list(-100, -50)),
			/obj/item/tool/multitool/advanced/onestar = custom_good_nameprice("SD Multitool", list(-100, -50)),
			/obj/item/tool/weldingtool/onestar = custom_good_nameprice("SD Welding Tool", list(-100, -50)),
			/obj/item/tool/screwdriver/combi_driver/onestar = custom_good_nameprice("SD Combination Drill", list(-100, -50)),
			/obj/item/tool/hammer/powered_hammer/onestar_hammer = custom_good_nameprice("SD Sledgehammer", list(-100, -50)),
			/obj/item/tool/pickaxe/jackhammer/onestar = custom_good_nameprice("SD Jackhammer", list(-100, -50)),
			/obj/item/tool/pickaxe/drill/onestar = custom_good_nameprice("SD Mining Drill", list(-100, -50)),
			/obj/item/tool/pickaxe/onestar = custom_good_nameprice("SD Pickaxe", list(-100, -500)),
			/obj/item/tool/shovel/onestar_shovel = custom_good_nameprice("SD Shovel", list(-100, -50)),
			/obj/item/tool/saw/onestar_saw = custom_good_nameprice("SD Handsaw", list(-100, -50)),
			/obj/item/tool/medmultitool = custom_good_nameprice("SD Medical Multitool", list(-100, -50)),
			/obj/item/tool/wirecutters/onestar_pliers = custom_good_nameprice("SD Pliers", list(-100, -50))
		),
		"Beijian" = list(
			/obj/item/stock_parts/micro_laser/one_star = custom_good_nameprice("SD Micro Laser", list(-100, -50)),
			/obj/item/stock_parts/matter_bin/one_star = custom_good_nameprice("SD Matter Bin", list(-100, -50)),
			/obj/item/stock_parts/scanning_module/one_star = custom_good_nameprice("SD Scanning Module", list(-100, -50)),
			/obj/item/stock_parts/capacitor/one_star = custom_good_nameprice("SD Capacitor", list(-100, -50)),
			/obj/item/stock_parts/manipulator/one_star = custom_good_nameprice("SD Manipulator", list(-100, -50))
		)
	)
	hidden_inventory = list(
		"Wuqi pan" = list(
			/obj/item/computer_hardware/hard_drive/portable/design/onestar/cog = custom_good_nameprice("SD Cog Disk", list(50, 150)),
			/obj/item/computer_hardware/hard_drive/portable/design/onestar/armor = custom_good_nameprice("SD Ablative Disk", list(20, 30))
		),
		"Wuqi yinshua" = list(
			/obj/item/gun/energy/cog = good_data("SD Cog", list(-1, 0), 475)
		),
		"Yinhua kuijia" = list(
			/obj/item/clothing/under/iron_lock_security = good_data("ILS Security Uniform", list(-100, -50), 175),
			/obj/item/clothing/head/soft/iron_lock_security = good_data("ILS Security Cap", list(-100, -50), 175),
			/obj/item/clothing/gloves/thick/ablasive/iron_lock_security = good_data("ILS Ablasive Gloves", list(-100, -50), 475),
			/obj/item/clothing/shoes/ablasive/iron_lock_security = good_data("ILS Ablasive Shoes", list(-100, -50), 475),
			/obj/item/clothing/head/helmet/laserproof/iron_lock_security = good_data("ILS Ablasive Helmet", list(-100, -50), 475),
			/obj/item/clothing/suit/armor/vest/iron_lock_security = good_data("ILS Ablasive Vest", list(-100, -50), 475)
		),
		"Gongju mo zu" = list(
			/obj/item/tool_upgrade/augment/holding_tank = custom_good_nameprice("SD Welder Fule Holding Tank", list(-100, -50)),
			/obj/item/tool_upgrade/augment/repair_nano = custom_good_nameprice("SD Nano Repair", list(-100, -50)),
			/obj/item/tool_upgrade/augment/ai_tool = custom_good_nameprice("SD Nano AI", list(-100, -50)),
			//Guns are tools too
			/obj/item/gun_upgrade/mechanism/glass_widow = custom_good_nameprice("SD Glass Widow", list(-100, -50)),
			/obj/item/gun_upgrade/mechanism/similacrum_master_catalyst = custom_good_nameprice("SD \"Master Unmaker\" infuser", list(-100, -50))
		)
	)

	//The projectile guns, no selling the disk as they are op guns

	offer_types = list(
		/obj/item/gun/projectile/spring = offer_data("SD Spring", 2500, 1),
		/obj/item/gun/projectile/rivet = offer_data("SD Rivet", 3000, 1),
		/obj/item/gun/projectile/rebar = offer_data("SD Rebar", 4000, 1),
		/obj/item/gun/projectile/automatic/nail_gun = offer_data("SD Nail", 6000, 1),
		/obj/item/gun/projectile/trouble_shooter = offer_data("SD Trouble Shooter", 18000, 1),
		/obj/item/gun/projectile/automatic/scaffold = offer_data("SD Scaffold", 7500, 1)
	)
