extends Node
static func _static_init():
	Register_table.handlers["add_value"] = func (_self : Obj_function, value) :
		var value_name = _self.get_item_info("value_name","")
		var _value = _self.get_item_info("value")
		if value_name == "speed" : 
			_self.speed += _value
		elif value_name == "position" :
			_self.position += _value
		else : 
			if  _self.get_item_info("item_value", false) : _self.item_info_append(value_name,  _self.get_item_info(value_name, 0.0) + _value)
			else : _self.addon_info_append(value_name,  _self.get_addon_info(value_name, 0.0) + _value)
