/datum/orderable_item/peacekeeper
	category_index = "Peacekeeper"

/datum/orderable_item/peacekeeper/un_helmet
	name = "Peacekeeper Helmet"
	purchase_path = /obj/item/clothing/head/helmet/sf_peacekeeper
	cost_per_order = 300

/datum/orderable_item/peacekeeper/un_armor
	name = "Peacekeeper Vest"
	purchase_path = /obj/item/clothing/suit/armor/sf_peacekeeper
	cost_per_order = 300

/datum/orderable_item/peacekeeper/pistol_magazine
	name = "Sol Pistol Magazine"
	purchase_path = /obj/item/ammo_box/magazine/c35sol_pistol/starts_empty
	cost_per_order = 50

/datum/orderable_item/peacekeeper/pistol_magazine_super
	name = "Sol Pistol Extended Magazine"
	purchase_path = /obj/item/ammo_box/magazine/c35sol_pistol/stendo/starts_empty
	cost_per_order = 100

/datum/orderable_item/peacekeeper/trappiste_magazine
	name = "Trappiste Pistol Magazine"
	purchase_path = /obj/item/ammo_box/magazine/c585trappiste_pistol/spawns_empty
	cost_per_order = 50

/datum/orderable_item/peacekeeper/rifle_magazine
	name = "Sol Rifle Short Magazine"
	purchase_path = /obj/item/ammo_box/magazine/c40sol_rifle/starts_empty
	cost_per_order = 50

/datum/orderable_item/peacekeeper/rifle_magazine_super
	name = "Sol Rifle Magazine"
	purchase_path = /obj/item/ammo_box/magazine/c40sol_rifle/standard/starts_empty
	cost_per_order = 100

/datum/orderable_item/peacekeeper/grenade_magazine
	name = "Kiboko Magazine"
	purchase_path = /obj/item/ammo_box/magazine/c980_grenade/starts_empty
	cost_per_order = 100

/datum/orderable_item/peacekeeper/grenade_magazine_super
	name = "Kiboko Drum"
	purchase_path = /obj/item/ammo_box/magazine/c980_grenade/drum/starts_empty
	cost_per_order = 200

/datum/orderable_item/peacekeeper/kiram_rifle
	name = "Kiram Electric Rifle"
	purchase_path = /obj/item/gun/ballistic/automatic/karim
	cost_per_order = 200

/datum/orderable_item/peacekeeper/kiram_rifle_mag
	name = "Kiram Electric Rifle"
	purchase_path = /obj/item/ammo_box/magazine/karim
	cost_per_order = 50

/datum/orderable_item/peacekeeper/motiondetector
	name = "Motion Detector"
	purchase_path = /obj/item/motiondetector
	cost_per_order = 350


// nri larp stuff

/datum/orderable_item/imperial
	category_index = "Rayisa"

/datum/orderable_item/imperial/plasma_battery
	name = "Plasma Battery"
	desc = "A rechargeable, detachable battery that serves as a power source for plasma projectors."
	purchase_path = /obj/item/ammo_box/magazine/recharge/plasma_battery
	cost_per_order = 50

/datum/orderable_item/imperial/miecz_mag
	name = "Miecz Magazine"
	purchase_path = /obj/item/ammo_box/magazine/miecz/spawns_empty
	cost_per_order = 100

/datum/orderable_item/imperial/lanca_mag
	name = "Lanca Magazine"
	purchase_path = /obj/item/ammo_box/magazine/lanca/spawns_empty
	cost_per_order = 50

/datum/orderable_item/imperial/plasmathrower
	name = "Plasma Projector"
	purchase_path = /obj/item/gun/ballistic/automatic/pistol/plasma_marksman
	cost_per_order = 200

// Some of the special larp ammo

/datum/orderable_item/operator_larp
	category_index = "Operator"

/datum/orderable_item/operator_larp/chinmoku_short
	name = "Chinmoku short magazine"
	purchase_path = /obj/item/ammo_box/magazine/c12chinmoku/starts_empty
	cost_per_order = 50

/datum/orderable_item/operator_larp/chinmoku_real
	name = "Chinmoku magazine"
	purchase_path = /obj/item/ammo_box/magazine/c12chinmoku/standard/starts_empty
	cost_per_order = 100

/datum/orderable_item/operator_larp/chinmoku_tracer
	name = "12mm Chinmoku tracer ammo stack"
	desc = "A stack of 12mm Chinmoku tracer cartridges."
	purchase_path = /obj/item/ammo_box/magazine/ammo_stack/c12chinmoku/prefilled/tracer
	cost_per_order = 50

/datum/orderable_item/operator_larp/chinmoku_special
	name = "12mm Chinmoku special ammo stack"
	desc = "A stack of 12mm Chinmoku special cartridges."
	purchase_path = /obj/item/ammo_box/magazine/ammo_stack/c12chinmoku/prefilled/special
	cost_per_order = 100

/datum/orderable_item/operator_larp/chokyu_magazine
	name = "Chokyu sniper magazine"
	purchase_path = /obj/item/ammo_box/magazine/c8marsian/starts_empty
	cost_per_order = 50

/datum/orderable_item/operator_larp/marsian_shockwave
	name = "8mm Marsian shockwave ammo stack"
	desc = "A stack of 8mm Marsian shockwave cartridges."
	purchase_path = /obj/item/ammo_box/magazine/ammo_stack/c8marsian/prefilled/shockwave
	cost_per_order = 100

/datum/orderable_item/operator_larp/marsian_piercing
	name = "8mm Marsian piercing ammo stack"
	desc = "A stack of 8mm Marsian piercing cartridges."
	purchase_path = /obj/item/ammo_box/magazine/ammo_stack/c8marsian/prefilled/piercing
	cost_per_order = 100

// Everything shotgun

/datum/orderable_item/shotgun_man
	category_index = "Safariman"

/datum/orderable_item/shotgun_man/longshot
	name = "6ga longshot ammo stack"
	desc = "A stack of 6 gauge longshot shells."
	purchase_path = /obj/item/ammo_box/magazine/ammo_stack/s6gauge/prefilled/longshot
	cost_per_order = 50

/datum/orderable_item/shotgun_man/flash_6ga
	name = "6ga flash ammo stack"
	desc = "A stack of 6 gauge flash shells."
	purchase_path = /obj/item/ammo_box/magazine/ammo_stack/s6gauge/prefilled/flash
	cost_per_order = 50

/datum/orderable_item/shotgun_man/nomi_magazine
	name = "Nomi 12ga drum"
	purchase_path = /obj/item/ammo_box/magazine/c12nomi/starts_empty
	cost_per_order = 100

/datum/orderable_item/shotgun_man/magnum
	name = "12ga flechettes"
	desc = "A pile of 12GA flechettes, good for fighting armor."
	purchase_path = /obj/item/ammo_box/magazine/ammo_stack/s12gauge/prefilled/flechette
	cost_per_order = 100

/datum/orderable_item/shotgun_man/express
	name = "12ga AP slugs"
	desc = "A pile of 12GA AP slugs."
	purchase_path = /obj/item/ammo_box/magazine/ammo_stack/s12gauge/prefilled/ap_slug
	cost_per_order = 100

/datum/orderable_item/shotgun_man/flechette
	name = "12ga shrapnel shot"
	desc = "A pile of 12GA shrapnel shells"
	purchase_path = /obj/item/ammo_box/magazine/ammo_stack/s12gauge/prefilled/shrapnel
	cost_per_order = 200

// Consumable medical stuff

/datum/orderable_item/medical_consumable
	category_index = "Dealer"

/datum/orderable_item/medical_consumable/coagulant
	name = "coagulant-F packet"
	purchase_path = /obj/item/stack/medical/suture/coagulant
	cost_per_order = 25

/datum/orderable_item/medical_consumable/sutures
	name = "hemostatic sutures"
	purchase_path = /obj/item/stack/medical/suture/bloody
	cost_per_order = 50

/datum/orderable_item/medical_consumable/red_sun_over_paradise
	name = "coagulant-F packet"
	purchase_path = /obj/item/stack/medical/ointment/red_sun
	cost_per_order = 25

/datum/orderable_item/medical_consumable/blood_mesh
	name = "hemostatic mesh"
	purchase_path = /obj/item/stack/medical/mesh/bloody
	cost_per_order = 50

/datum/orderable_item/medical_consumable/bone_breaker
	name = "aluminum splints"
	purchase_path = /obj/item/stack/medical/gauze/alu_splint
	cost_per_order = 50

/datum/orderable_item/medical_consumable/medpen_morpital
	name = "morpital regenerative stimulant injector"
	purchase_path = /obj/item/reagent_containers/hypospray/medipen/deforest/morpital
	cost_per_order = 50

/datum/orderable_item/medical_consumable/medpen_lipital
	name = "lipital regenerative stimulant injector"
	purchase_path = /obj/item/reagent_containers/hypospray/medipen/deforest/lipital
	cost_per_order = 50

/datum/orderable_item/medical_consumable/medpen_lepoturi
	name = "lepoturi burn treatment injector"
	purchase_path = /obj/item/reagent_containers/hypospray/medipen/deforest/lepoturi
	cost_per_order = 50

/datum/orderable_item/medical_consumable/medpen_coagulants
	name = "coagulant-S injector"
	purchase_path = /obj/item/reagent_containers/hypospray/medipen/deforest/coagulants
	cost_per_order = 50

/datum/orderable_item/medical_consumable/medpen_calopine
	name = "calopine emergency stabilizant injector"
	purchase_path = /obj/item/reagent_containers/hypospray/medipen/deforest/calopine
	cost_per_order = 50

//lasers and such
/datum/orderable_item/pewpew
	category_index = "Allstar"

/datum/orderable_item/pewpew/basiclaser
	name = "SC-1 Laser Rifle"
	purchase_path = /obj/item/gun/energy/laser
	cost_per_order = 150

/datum/orderable_item/pewpew/basiclasercarbine
	name = "SC-1c Laser Carbine"
	purchase_path = /obj/item/gun/energy/laser/carbine
	cost_per_order = 150

/datum/orderable_item/pewpew/energygun
	name = "SC-2 Energy Gun"
	purchase_path = /obj/item/gun/energy/e_gun
	cost_per_order = 200

/datum/orderable_item/pewpew/fancylasercarbine
	name = "REAL Allstar Laser Carbine (Legitimate)"
	purchase_path = /obj/item/gun/energy/laser/carbine/cybersun
	cost_per_order = 250

/datum/orderable_item/pewpew/lasergatling
	name = "Gatling Laser Kit"
	purchase_path = /obj/item/minigunpack
	cost_per_order = 600

/datum/orderable_item/pewpew/pulserifle
	name = "Military Pulse Rifle"
	purchase_path = /obj/item/gun/energy/pulse
	cost_per_order = 1000

