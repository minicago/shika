extends Node
static func _static_init():
	Register_table.handlers["cool_boot"] = func(_self:Obj_function ,value):
		if _self.timer_get(_self.item_name + "cool_time", _self.get_item_info("offset_cool_time", 0.0) ) <= 0.0:
			_self.call_handler("cool_handler", {"delta" : _self.get_item_info("cool_time", INF)} , false)
			_self.timer_set(_self.item_name + "cool_time", _self.get_item_info("cool_time", INF))
