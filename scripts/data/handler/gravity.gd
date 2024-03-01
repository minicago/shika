extends Node

static func _static_init():
	Register_table.handlers["gravity"] = func (_self : Obj_function, value) :
		var dist = _self.get_father().get_home().get_obj_position() - _self.get_obj_position()
		_self.set_real_speed( _self.get_real_speed() + dist.normalized() * _self.get_item_info("gravity", 200.0) * value )
		pass

