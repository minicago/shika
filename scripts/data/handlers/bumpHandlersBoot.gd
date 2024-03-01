extends Node
class_name BumpHandlerBoot

static var bump_handler_home = func(collidee :Obj_function, collider : Obj):
	if collider.get_addon_info("type") == "home":
		collidee.addon_info_append("win", true)
		print("back home")

static var bump_handler_monster = func(collidee :Obj_function, collider : Obj):
	if collider.get_addon_info("type") == "monster":
		collider.call_handler("take_damage", collidee.get_item_info("bump_damage", {}))
		
static var bump_handler_once = func(collidee :Obj_function, collider : Obj):
	if collider.get_addon_info("once", false): 
		if not collidee.banlist.get(collider, false):
			collidee.banlist[collider] = true
		else : return
		
static var bump_handler_box = func(collidee :Obj_function, collider : Obj):
	if (collidee.lowlevel.timestamp) < collider.timestamp : return
	var m1 = collidee.get_item_info("mass", -1.0)
	var m2 = collider.get_addon_info("mass", -1.0)
	if m2 > 0.0: 
		var dist :Vector2 = collidee.get_obj_position() - collider.get_obj_position()
		var dspeed :Vector2 = collidee.get_real_speed() - collider.get_real_speed()
		if not collidee.get_item_info("hard_box", false):
			collidee.set_real_speed(collidee.get_real_speed() - (2 * m2) / (m1 + m2) * dspeed)
			collidee.set_obj_position(collidee.get_obj_position() + dist.normalized() * collider.get_addon_info("box", 0.0))
		if not collider.get_addon_info("hard_box", false):
			collider.set_real_speed(collider.get_real_speed() + (2 * m1) / (m1 + m2) * dspeed)
			collider.set_obj_position(collider.get_obj_position() - dist.normalized() * collider.get_addon_info("box", 0.0))
		
static var bump_handler_rider = func(collidee : Obj_function, collider : Obj):
	if collider.get_addon_info("type", "") == "rider":
		collider.call_handler("take_damage", collidee.get_item_info("bump_damage", {}))
		
static var bump_handler_bullet = func(collidee : Obj_function, collider : Obj):
	collider.call_handler("take_damage", collidee.get_item_info("damage", {}))
		
static var bump_handler_bullet_kill = func(collidee : Obj_function, collider : Obj):
	if not collidee.get_item_info("damage", {}).get("ignore_invincible",false) or collider.timer_get("invincible", 0.0) == 0.0 :
		collidee.call_handler("die", {})

static func _static_init():
	Register_table.handlers["home"] = bump_handler_home
	Register_table.handlers["monster"] = bump_handler_monster
	Register_table.handlers["once"] = bump_handler_once
	Register_table.handlers["box"] = bump_handler_box
	Register_table.handlers["rider"] = bump_handler_rider
	Register_table.handlers["bullet"] = bump_handler_bullet
	Register_table.handlers["bullet_kill"] = bump_handler_bullet_kill
