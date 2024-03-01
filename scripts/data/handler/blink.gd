extends Node

static func _static_init():
	Register_table.handlers["blink"] = func (_self : Obj_function, value) :
		_self.set_obj_position( _self.get_obj_position() + _self.get_toward() * _self.get_item_info("blink_dist",50.0) )
		pass

