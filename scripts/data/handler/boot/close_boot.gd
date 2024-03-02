extends Node
static func _static_init():
	Register_table.handlers["close_boot"] = func(_self:Obj_function ,value):
		var world:World = _self.get_father()
		var follow_target = _self.get_item_info("follow_monster", null)
		if follow_target == null :
			follow_target = world.get_rider()
		var follow_pos = follow_target.get_obj_position()
		if ( (follow_pos - _self.get_obj_position()).length()  < _self.get_item_info("close_dist", 300.0) ):
			_self.call_handler("close_handler", value, false)
