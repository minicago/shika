extends Node

static func _static_init():
	Register_table.handlers["modulate_invincible"] = func (_self : Obj_function, value) :
		if _self.timer_get("invincible") > 0:
			_self.modulate.a = cos(_self.timer_get("invincible") * PI * 4) * 0.4 + 0.6
		else : _self.modulate.a = 1.0
		pass

