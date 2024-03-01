extends Node

static func _static_init():
	Register_table.handlers["follow_bullet"] = func (_self : Obj_function, value) :
		_self.speed = Vector2.ZERO
		var world:World = _self.get_father()
		var list = world.get_objs()
		for obj in list:
			if _self.allow_bump(obj) :
				var dist = obj.get_obj_position() - _self.get_obj_position()
				var follow_power = min (1.0 , 10000 / (dist.length() ** 1.5))
				_self.set_real_speed(_self.get_real_speed() + value * dist.normalized() * follow_power * _self.get_item_info("follow_power", 3000.0))
		pass

