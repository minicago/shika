extends Node
static func _static_init():
	Register_table.handlers["spin"] = func(_self:Obj_function ,value):
		var delta = value.get("delta", 0.0)
		_self.spin( _self.get_item_info("spin_rate", 0) * delta)