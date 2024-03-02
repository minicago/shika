extends Node
static func _static_init():
	Register_table.handlers["maggot"] = func(_self:Obj_function ,value):
		var delta = value.get("delta", 0.0)
		_self.speed.x += _self.get_item_info("power", 800) * delta
		_self.speed = _self.speed * exp(- _self.get_item_info("resist", 0.9) * delta)