extends Node
class_name Monster_AI

static func _static_init():
	Register_table.handlers["follow"] = func(_self:Obj_function ,value):
		var delta = value.get("delta", 0.0)
		var world:World = _self.get_father()
		var follow_pos
		if  _self.get_item_info("follow_monster", null) == null:
			follow_pos = world.get_rider().get_obj_position()
		else:
			follow_pos = _self.get_item_info("follow_monster", null).get_obj_position() - _self.get_item_info("follow_monster", null).get_toward() * _self.get_item_info("follow_offset", 150.0)

		var rotate_angle = _self.toward.angle_to( (follow_pos - _self.position ).normalized() )
		if (follow_pos - _self.position ).length() >_self.get_item_info("turn_die_zone", 10.0) :
			if  rotate_angle > 0:
				_self.spin( min(rotate_angle, _self.get_item_info("max_rotate_rate",4 * PI) * max(delta,_self.get_item_info("follow_AI_cool_time",0.0)) ))
			else : 
				_self.spin( max(rotate_angle, - _self.get_item_info("max_rotate_rate",4 * PI) * max(delta,_self.get_item_info("follow_AI_cool_time",0.0)) ))

	Register_table.handlers["spider"] = func(_self:Obj_function ,value):
		if _self.timer_get("spider_AI",0) == 0:
			if _self.speed.length() == 0 : _self.speed = Vector2(_self.get_item_info("AI_speed"), 0)
			else : _self.speed = Vector2(0.0, 0.0)
			_self.timer_set("spider_AI", _self.get_item_info("spider_AI_cool_time"))

	Register_table.handlers["maggot"] = func(_self:Obj_function ,value):
		var delta = value.get("delta", 0.0)
		_self.speed.x += _self.get_item_info("power", 800) * delta
		_self.speed = _self.speed * exp(- _self.get_item_info("resist", 0.9) * delta)

	Register_table.handlers["abandon"] = func(_self:Obj_function ,value):
		var world:World = _self.get_father()
		var rider_pos = world.get_rider().get_obj_position()
		if (_self.position-rider_pos).length() > _self.get_item_info("abandon_dist", 2000.0) :
			_self.kill()
		if _self.timer_get("life_time", 1.0) <= 0.0 :
			_self.kill()

	Register_table.handlers["butterfly"] = func(_self:Obj_function ,value):
		if _self.timer_get("butterfly_round",0) > 0.0:
			_self.speed = Vector2(_self.get_item_info("butterfly_round_speed") , 0.0)
			_self.toward = _self.toward.rotated(_self.get_item_info("rotation_speed") * value)

		else :
			_self.speed = Vector2(_self.get_item_info("butterfly_dash_speed") , 0.0)
			var world:World = _self.get_father()
			var rider_pos = world.get_rider().get_obj_position()
			_self.toward = (rider_pos - _self.position ).normalized()
			if (rider_pos - _self.position).length() < _self.get_item_info("butterfly_round_dist") :
				_self.timer_set("butterfly_round", _self.get_item_info("butterfly_round_time"))
				_self.toward = _self.toward.rotated(- PI / 2)

	Register_table.handlers["cool_boot"] = func(_self:Obj_function ,value):
		if _self.timer_get(_self.item_name + "cool_time", _self.get_item_info("offset_cool_time", 0.0) ) <= 0.0:
			_self.call_handler("cool_handler", {"delta" : _self.get_item_info("cool_time", INF)} , false)
			_self.timer_set(_self.item_name + "cool_time", _self.get_item_info("cool_time", INF))

	Register_table.handlers["loong"] = func(_self:Obj_function ,value):
		var delta = value.get("delta", 0.0)
		if  _self.get_item_info("follow_monster", null) == null:
			Register_table.handlers["cool_boot"].call(_self, {"delta" : delta})
			var world:World = _self.get_father()
			var follow_pos = world.get_rider().get_obj_position()
			if (follow_pos - _self.get_obj_position()).length() < _self.get_item_info("rush_dist", 800.0):
				_self.speed.x += _self.get_item_info("power", 800) * delta
			var rotate_angle = _self.toward.angle_to( (follow_pos - _self.position ).normalized() )
			if (abs(rotate_angle) < 0.1 * PI ):
				_self.speed.x += _self.get_item_info("power", 800) * delta
			_self.addon_info_append("max_rotate_rate",_self.get_item_info("loong_max_rotate_rate", 0.4 * PI))
		else:
			_self.speed = _self.get_item_info("follow_monster", null).speed + Vector2(1,0)
			_self.addon_info_append("max_rotate_rate",10.0 * _self.get_item_info("__max_rotate_rate", 0.4 * PI)
			)

	Register_table.handlers["spin"] = func(_self:Obj_function ,value):
		var delta = value.get("delta", 0.0)
		_self.spin( _self.get_item_info("spin_rate", 0) * delta)

	Register_table.handlers["self_bomb"] = func(_self:Obj_function ,value):
		var delta = value.get("delta", 0.0)
		var world:World = _self.get_father()
		var follow_pos = world.get_rider().get_obj_position()
		if (follow_pos - _self.get_obj_position()).length() < _self.get_item_info("bomb_dist", 400.0):
			_self.call_handler("die",{})

	Register_table.handlers["aim_bullet"] = func(_self:Obj_function ,value):
		var world:World = _self.get_father()
		world.instance_bullet("bullet",{"damage" : _self.get_item_info("bullet_damage", {}) , "father" : _self , "smart_aim" : true})


	
