extends Node
static func _static_init():
	Register_table.handlers["rand_boot"] = func(_self:Obj_function ,value):
		if randf() < _self.get_item_info("rand_rate", 1.0) :
			_self.call_handler("rand_handler", value , false)
