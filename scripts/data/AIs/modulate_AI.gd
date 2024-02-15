extends Node
class_name Modulate_AI

static var modulate_hurt_AI = func(_self : Obj_function, delta):
	if _self.timer_get("hurt") > 0 :
			_self.modulate.s = 100.0
	else : _self.modulate.s = 0.0

static var modulate_invincible_AI = func(_self : Obj_function, delta):
	if _self.timer_get("invincible") > 0:
		_self.modulate.a = cos(_self.timer_get("invincible") * PI * 4) * 0.4 + 0.6
	else : _self.modulate.a = 1.0
	
static func _static_init():
	Register_table.AI["modulate_invincible"] = modulate_invincible_AI
	Register_table.AI["modulate_hurt"] = modulate_hurt_AI
