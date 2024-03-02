extends Node
static func _static_init():
	Register_table.handlers["follow"] = func(_self:Obj_function ,value):
		var delta = value.get("delta", 0.0)
		var world:World = _self.get_father()
		var follow_pos
		if  _self.get_item_info("follow_monster", null) == null:
			follow_pos = world.get_rider().get_obj_position()
		else:
			follow_pos = _self.get_item_info("follow_monster", null).get_obj_position() - _self.get_item_info("follow_monster", null).get_toward() * _self.get_item_info("follow_offset", 150.0)
		
		var final_toward = (follow_pos - _self.position ).normalized()
	   
		if _self.get_addon_info("smart_follow", false):
			var dist = (_self.get_obj_position() - follow_pos)
			var real_spead = world.get_rider().get_real_speed()
			var bullet_speed = _self.get_speed().length()
			var angle = real_spead.angle_to(dist)
			var sin_angle = sin(angle) / bullet_speed * real_spead.length() 
			final_toward = (-dist).rotated(asin(sin_angle)).normalized()

		var rotate_angle = _self.toward.angle_to( final_toward )

		if (follow_pos - _self.position ).length() >_self.get_item_info("turn_die_zone", 10.0) :
			if  rotate_angle > 0:
				_self.spin( min(rotate_angle, _self.get_item_info("max_rotate_rate",4 * PI) * delta ))
			else : 
				_self.spin( max(rotate_angle, - _self.get_item_info("max_rotate_rate",4 * PI) * delta ))

