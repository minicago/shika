extends Node

static func _static_init():
	Register_table.handlers["show_cool"] = func (_self : Obj_function, value) :
		_self.item_info_append("display1", _self.timer_get(_self.item_name + "cool_time", 0.0 ))
		_self.item_info_append("display2", _self.get_item_info("cool_time",10.0))
		pass

