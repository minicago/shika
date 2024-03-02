extends Node
static func _static_init():
	Register_table.handlers["die"] = func(_self : Obj_function, value): 
		_self.addon_info_append("go_die" , true)
		_self.call_handler("go_die_handler", {})
		if _self.get_addon_info("go_die", true):
			_self.kill()

	
