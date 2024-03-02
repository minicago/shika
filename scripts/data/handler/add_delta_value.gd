extends Node
static func _static_init():
	Register_table.handlers["add_value_delta"] = func (_self : Obj_function, value) :
		var value_name = _self.get_item_info("value_name","")
		var _value = _self.get_item_info("value") * value.get("delta", 0.0)
		var delta = value.get("delta", 0.0)
		if value_name == "speed" : 
			_self.speed += _value
		elif value_name == "position" :
			_self.position += _value
		else : 
			if  _self.get_item_info("item_value", false) : _self.item_info_append(value_name,  _self.get_item_info(value_name, 0.0) + _value * delta)
			else : _self.addon_info_append(value_name,  _self.get_addon_info(value_name, 0.0) + _value * delta)
