extends Node

static func _static_init():
	Register_table.handlers["suicide"] = func (_self : Obj_function, value) :
		var delta = value.get("delta", 0.0)
		_self.call_handler("take_damage", {"damage" : _self.get_item_info("suicide_damage") * delta, "ignore_invincible" : true})
		pass

