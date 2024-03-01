extends Node

static func _static_init():
	Register_table.handlers["bomb"] = func (_self : Obj_function, value) :
		var delta = value.get("delta", 0.0)
		_self.set_speed(Vector2(0,0))
		
		_self.lowlevel.UI.scale *= pow(_self.get_item_info("scale",500.0), delta)
		pass

