extends Node

static func _static_init():
	Register_table.handlers["modulate_hurt"] = func (_self : Obj_function, value) :
		if _self.timer_get("hurt") > 0 :
			_self.modulate = Color.RED
			return
	#
		if _self.timer_get("heal") > 0 :
			_self.modulate = Color.GREEN
			return
			
		_self.modulate = Color.WHITE
		pass

