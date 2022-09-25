/obj/item/mecha_ammo
	name = "generic ammo box"
	desc = "A box of ammo for an unknown weapon."
	w_class = WEIGHT_CLASS_BULKY
	icon = 'icons/mecha/mecha_ammo.dmi'
	icon_state = "empty"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	var/rounds = 0
	var/direct_load //For weapons where we re-load the weapon itself rather than adding to the ammo storage.
	var/load_audio = 'sound/weapons/gun/general/mag_bullet_insert.ogg'
	var/ammo_type

/obj/item/mecha_ammo/update_name()
	. = ..()
	name = "[rounds ? null : "empty "][initial(name)]"

/obj/item/mecha_ammo/update_desc()
	. = ..()
	desc = rounds ? initial(desc) : "An exosuit ammuniton box that has since been emptied. Please recycle."

/obj/item/mecha_ammo/update_icon_state()
	icon_state = rounds ? initial(icon_state) : "empty"
	return ..()

/obj/item/mecha_ammo/attack_self(mob/user)
	..()
	if(rounds)
		to_chat(user, span_warning("You cannot flatten the ammo box until it's empty!"))
		return

	to_chat(user, span_notice("You fold [src] flat."))
	var/trash = new /obj/item/stack/sheet/iron(user.loc)
	qdel(src)
	user.put_in_hands(trash)

/obj/item/mecha_ammo/examine(mob/user)
	. = ..()
	if(rounds)
		. += "There [rounds > 1?"are":"is"] [rounds] [ammo_type][rounds > 1?"s":""] left."

/obj/item/mecha_ammo/incendiary
	name = "incendiary ammo box"
	desc = "A box of incendiary ammunition for use with exosuit weapons."
	icon_state = "incendiary"
	rounds = 24
	ammo_type = MECHA_AMMO_INCENDIARY

/obj/item/mecha_ammo/scattershot
	name = "scattershot ammo box"
	desc = "A box of scaled-up buckshot, for use in exosuit shotguns."
	icon_state = "scattershot"
	rounds = 40
	ammo_type = MECHA_AMMO_BUCKSHOT

/obj/item/mecha_ammo/ac2
	name = "AC2 ammo box"
	desc = "A box of linked ammunition, designed for the Ultra AC 2 exosuit weapon."
	icon_state = "ac2"
	rounds = 300
	ammo_type = MECHA_AMMO_AC2

/obj/item/mecha_ammo/ac5
	name = "AC5 ammo box"
	desc = "A box of linked ammunition, designed for the Autocannon/5 exosuit weapon."
	icon_state = "ac5"
	rounds = 100
	ammo_type = MECHA_AMMO_AC5

/obj/item/mecha_ammo/missiles_br
	name = "breaching missiles"
	desc = "A box of large missiles, ready for loading into a BRM-6 exosuit missile rack."
	icon_state = "missile_br"
	rounds = 6
	direct_load = TRUE
	load_audio = 'sound/weapons/gun/general/mag_bullet_insert.ogg'
	ammo_type = MECHA_AMMO_MISSILE_HE

/obj/item/mecha_ammo/missiles_he
	name = "anti-armor missiles"
	desc = "A box of large missiles, ready for loading into an SRM-8 exosuit missile rack."
	icon_state = "missile_he"
	rounds = 8
	direct_load = TRUE
	load_audio = 'sound/weapons/gun/general/mag_bullet_insert.ogg'
	ammo_type = MECHA_AMMO_MISSILE_AP


/obj/item/mecha_ammo/flashbang
	name = "launchable flashbangs"
	desc = "A box of smooth flashbangs, for use with a large exosuit launcher. Cannot be primed by hand."
	icon_state = "flashbang"
	rounds = 6
	ammo_type = MECHA_AMMO_FLASHBANG

/obj/item/mecha_ammo/clusterbang
	name = "launchable flashbang clusters"
	desc = "A box of clustered flashbangs, for use with a specialized exosuit cluster launcher. Cannot be primed by hand."
	icon_state = "clusterbang"
	rounds = 3
	direct_load = TRUE
	ammo_type = MECHA_AMMO_CLUSTERBANG
