extends Node
static func _static_init():
	Register_table.handlers["reborn_boot"] = func (_self : Obj_function, value):
		if _self.get_addon_info("go_die", true):
			if not _self.get_item_info("reborned", false):
				_self.addon_info_append("go_die", false)
				_self.call_handler("take_damage", 
				{"damage" :- _self.get_addon_info("maxhealth", 0.0) * _self.get_item_info("reborn_rate", 0.0 ) - _self.get_item_info("reborn_value", 0.0 ) } 
				) 
				_self.item_info_append("reborned" , true)
				_self.call_handler("reborn_handler", {}, false)
	
	
