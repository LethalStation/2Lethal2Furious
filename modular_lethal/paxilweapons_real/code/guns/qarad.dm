/obj/item/gun/ballistic/automatic/sol_rifle/machinegun
	name = "\improper Qarad Light Machinegun"
	desc = "A hefty machinegun commonly seen in the hands of Sol's most powerful armed goons. \
		Accepts any standard Cawil rifle magazine."
	icon_state = "qarad"
	worn_icon_state = "qarad"
	inhand_icon_state = "qarad"
	bolt_type = BOLT_TYPE_OPEN
	spawn_magazine_type = /obj/item/ammo_box/magazine/c40sol_rifle
	fire_delay = 0.1 SECONDS
	recoil = 0.5
	spread = 10
	projectile_wound_bonus = -10
	suppressor_x_offset = 9
	gunshot_animation_information = list(
		"pixel_x" = 35, \
		"pixel_y" = 0, \
		"inactive_wben_suppressed" = TRUE, \
	)
	recoil_animation_information = list(
		"recoil_angle_upper" = -10, \
		"recoil_angle_lower" = -20, \
		"recoil_burst_speed" = 0.5, \
		"return_burst_speed" = 0.5, \
		"recoil_speed" = 0.5, \
		"return_speed" = 0.5, \
	)

/obj/item/gun/ballistic/automatic/sol_rifle/machinegun/give_autofire()
	AddComponent(/datum/component/automatic_fire, fire_delay)

/obj/item/gun/ballistic/automatic/sol_rifle/machinegun/no_mag
	spawnwithmagazine = FALSE
