extends Node
static func _static_init():
	Register_table.handlers["straight_boot"] = func(_self:Obj_function ,value):
		var world:World = _self.get_father()
		var follow_target = _self.get_item_info("follow_monster", null)
		if follow_target == null :
			follow_target = world.get_rider()
			var follow_pos = follow_target.get_obj_position()
			var rotate_angle = _self.toward.angle_to( (follow_pos - _self.position ).normalized() )
			if (abs(rotate_angle) < 0.05 * PI ):
				_self.call_handler("straight_handler", value, false)