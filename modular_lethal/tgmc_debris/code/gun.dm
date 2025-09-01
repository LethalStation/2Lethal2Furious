/obj/item/gun
	light_system = OVERLAY_LIGHT
	light_range = 0
	light_color = COLOR_WHITE
	/// The effect of the muzzle flash
	var/obj/effect/muzzle_flash/muzzle_flash
	/// How bright in lumcount should the flash be
	var/muzzle_flash_lum = 2
	/// Icon state of the muzzle flash
	var/muzzleflash_iconstate
	/// Light color made by the gun when shooting
	var/muzzle_flash_color = COLOR_VERY_SOFT_YELLOW
	/// If the gun has muzzle effects at all
	var/muzzle_effects = TRUE

/obj/item/gun/ballistic/bow
	muzzle_effects = FALSE
