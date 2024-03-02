extends Node
static func _static_init():
	Register_table.handlers["box"] = func(collidee :Obj_function, collider : Obj):
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

	