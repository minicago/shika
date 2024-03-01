extends Node

static func _static_init():
	Register_table.handlers["clean_once"] = func (_self : Obj_function, value) :
		if _self.timer_get(_self.item_name+"clean_once",0.0) == 0.0:
			_self.banlist.clear()
			_self.timer_set(_self.item_name+"clean_once", _self.get_item_info("clean_once_time", 0.5))
		pass

