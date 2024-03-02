extends Node

static func _static_init():
	Register_table.handlers["action_boot"] = func (_self : Obj_function, value) :
		if Input.is_action_pressed("item"+_self.item_name[0]):
			_self.call_handler("action_handler", value ,false)
		pass

