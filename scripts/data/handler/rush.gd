extends Node

static func _static_init():
	Register_table.handlers["rush"] = func (_self : Obj_function, value) :
		_self.item_info_append("display1", _self.timer_get(_self.item_name + "cool", 0.0 ))
		_self.item_info_append("display2", _self.get_item_info("cool_time",10.0))
		if Input.is_action_just_pressed("item"+_self.item_name):
			if _self.timer_get(_self.item_name + "cool", 0.0 ) == 0.0:
				_self.speed.x +=  _self.get_item_info("rush_power",800.0)
				_self.timer_set(_self.item_name + "cool", _self.get_item_info("cool_time",10.0) )
		pass

