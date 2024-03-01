extends Node

static func _static_init():
	Register_table.handlers["rush"] = func (_self : Obj_function, value) :
		_self.speed.x +=  _self.get_item_info("rush_power",800.0)
		pass

