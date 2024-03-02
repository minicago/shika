extends Node
static func _static_init():
	Register_table.handlers["call_handler"] = func (_self : Obj_function, value) :
		_self.call_handler(_self.get_item_info("handler_name", ""), _self.get_item_info("handler_value", {}) )
