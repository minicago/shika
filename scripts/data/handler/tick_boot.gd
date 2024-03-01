extends Node

static func _static_init():
	Register_table.handlers["tick_boot"] = func (_self : Obj_function, value) :
		var exact_time = _self.get_item_info("exact_time", 4.0)
		var penalty_time = _self.get_item_info("penalty_time", 0.15)
		var cool_time = _self.timer_get(_self.item_name + "cool", 0.0 )
		_self.item_info_append("display1",  max(0, cool_time - penalty_time * 3 ))
		_self.item_info_append("display2", exact_time)
		if  cool_time == 0.0:
			_self.timer_set(_self.item_name + "cool",  exact_time + 3 * penalty_time )
		if cool_time < penalty_time * 6 :
			if Input.is_action_just_pressed("item"+_self.item_name):
				if cool_time > penalty_time * 2 and cool_time < penalty_time * 4 :
					_self.call_handler("tick_reward", {} , false)
				else  :
					_self.call_handler("tick_penalty", {} , false)
				_self.timer_set(_self.item_name + "cool",  exact_time + 3 * penalty_time )
		pass

