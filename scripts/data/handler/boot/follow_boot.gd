extends Node
static func _static_init():
	Register_table.handlers["follow_boot"] = func(_self:Obj_function ,value):
		var delta = value.get("delta", 0.0)
		if  _self.get_item_info("follow_monster", null) == null:
			_self.call_handler("follow_rider_handler", value, false)
		else:
			_self.call_handler("follow_other_handler", value, false)
