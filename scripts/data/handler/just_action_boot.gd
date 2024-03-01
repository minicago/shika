extends Node

static func _static_init():
	Register_table.handlers["just_action_boot"] = func (_self : Obj_function, value) :
		if Input.is_action_just_pressed("item"+_self.item_name):
			_self.call_handler("action_handler", value ,false)
	
		pass

