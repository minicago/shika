extends Node

static func _static_init():
	Register_table.handlers["blink"] = func (_self : Obj_function, value) :
		if Input.is_action_just_pressed("item"+_self.item_name):
			if _self.timer_get(_self.item_name + "cool", 0.0 ) == 0.0:
				_self.set_obj_position( _self.get_obj_position() + _self.get_toward() * _self.get_item_info("blink_dist",50.0) )
				_self.timer_set(_self.item_name + "cool", _self.get_item_info("cool_time",10.0) )
		pass

