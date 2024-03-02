extends Node
static func _static_init():
	Register_table.handlers["abandon"] = func(_self:Obj_function ,value):
		var world:World = _self.get_father()
		var rider_pos = world.get_rider().get_obj_position()
		if (_self.position-rider_pos).length() > _self.get_item_info("abandon_dist", 2000.0) :
			_self.kill()
		if _self.timer_get("life_time", 1.0) <= 0.0 :
			_self.kill()