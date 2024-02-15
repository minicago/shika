extends Node
class_name Monster_AI


static var follow_AI = func(_self:Obj_function ,delta):
	if _self.timer_get("follow_AI",0) == 0:
		var world:World = _self.get_father()
		var follow_pos
		if  _self.get_addon_info("follow_monster", null) == null:
			follow_pos = world.get_rider().get_obj_position()
		else:
			follow_pos = _self.get_addon_info("follow_monster", null).get_obj_position() - _self.get_addon_info("follow_monster", null).get_toward() * _self.get_addon_info("follow_offset", 150.0)
		if randf() < _self.get_addon_info("follow_AI_miss_rate",0.0) :
			_self.toward = Vector2(1,0).rotated(randf() * 2 * PI)
		else : 
			var rotate_angle = _self.toward.angle_to( (follow_pos - _self.position ).normalized() )
			if (follow_pos - _self.position ).length() >_self.get_addon_info("turn_die_zone", 10.0) :
				if  rotate_angle > 0:
					_self.spin( min(rotate_angle, _self.get_addon_info("max_rotate_rate",4 * PI) * max(delta,_self.get_addon_info("follow_AI_cool_time",0.0)) ))
				else : 
					_self.spin( max(rotate_angle, - _self.get_addon_info("max_rotate_rate",4 * PI) * max(delta,_self.get_addon_info("follow_AI_cool_time",0.0)) ))
		_self.timer_set("follow_AI", _self.get_addon_info("follow_AI_cool_time",0.0))
	pass
	
static var spider_AI = func(_self:Obj_function ,delta):
	if _self.timer_get("spider_AI",0) == 0:
		if _self.speed.length() == 0 : _self.speed = Vector2(_self.get_addon_info("AI_speed"), 0)
		else : _self.speed = Vector2(0.0, 0.0)
		_self.timer_set("spider_AI", _self.get_addon_info("spider_AI_cool_time"))
		
static var maggot_AI = func(_self:Obj_function ,delta):
	_self.speed.x += _self.get_addon_info("power", 800) * delta
	_self.speed = _self.speed * exp(- _self.get_addon_info("resist") * delta)
	
	
static var abandon_AI = func(_self:Obj_function ,delta):
	var world:World = _self.get_father()
	var rider_pos = world.get_rider().get_obj_position()
	if (_self.position-rider_pos).length() > _self.get_addon_info("abandon_dist") :
		_self.kill()
		
static var butterfly_AI = func(_self:Obj_function ,delta):
	if _self.timer_get("butterfly_round",0) > 0.0:
		_self.speed = Vector2(_self.get_addon_info("butterfly_round_speed") , 0.0)
		_self.toward = _self.toward.rotated(_self.get_addon_info("rotation_speed") * delta)
	
	else :
		_self.speed = Vector2(_self.get_addon_info("butterfly_dash_speed") , 0.0)
		var world:World = _self.get_father()
		var rider_pos = world.get_rider().get_obj_position()
		_self.toward = (rider_pos - _self.position ).normalized()
		if (rider_pos - _self.position).length() < _self.get_addon_info("butterfly_round_dist") :
			_self.timer_set("butterfly_round", _self.get_addon_info("butterfly_round_time"))
			_self.toward = _self.toward.rotated(- PI / 2)
			

static var loong_AI = func(_self:Obj_function ,delta):

	if  _self.get_addon_info("follow_monster", null) == null:
		var world:World = _self.get_father()
		var follow_pos = world.get_rider().get_obj_position()
		if (follow_pos - _self.get_obj_position()).length() < _self.get_addon_info("rush_dist", 300.0):
			_self.speed.x += _self.get_addon_info("power", 800) * delta
		#_self.addon_info_append("power", 1400)
		_self.addon_info_append("max_rotate_rate",(randf() * 0.4 + 0.8) * _self.get_addon_info("loong_max_rotate_rate", 0.5 * PI))
	else:
		_self.speed = _self.get_addon_info("follow_monster", null).speed
		_self.addon_info_append("max_rotate_rate",10.0 * _self.get_addon_info("__max_rotate_rate", 0.5 * PI))



static func _static_init():
	Register_table.AI["follow"] = follow_AI
	Register_table.AI["spider"] = spider_AI
	Register_table.AI["maggot"] = maggot_AI
	Register_table.AI["abandon"] = abandon_AI
	Register_table.AI["butterfly"] = butterfly_AI
	Register_table.AI["loong"] = loong_AI
	
	