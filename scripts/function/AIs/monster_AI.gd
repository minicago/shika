extends Node
class_name Monster_AI

static var follow_AI = func(_self:Obj_function ,delta):
	if _self.timer_get("follow_AI",0) == 0:
		var world:World = _self.get_father()
		var rider_pos = world.get_rider().get_obj_position()
		if randf() < _self.get_addon_info("follow_AI_miss_rate") :
			_self.toward = Vector2(1,0).rotated(randf() * 2 * PI)
		else : _self.toward = (rider_pos - _self.position ).normalized()
		_self.timer_set("follow_AI", _self.get_addon_info("follow_AI_cool_time"))
	pass
	
static var spider_AI = func(_self:Obj_function ,delta):
	if _self.timer_get("spider_AI",0) == 0:
		if _self.speed.length() == 0 : _self.speed = Vector2(500.0, 0)
		else : _self.speed = Vector2(0.0, 0.0)
		_self.timer_set("spider_AI", _self.get_addon_info("spider_AI_cool_time"))
		
static var abandon_AI = func(_self:Obj_function ,delta):
	var world:World = _self.get_father()
	var rider_pos = world.get_rider().get_obj_position()
	if (_self.position-rider_pos).length() > _self.get_addon_info("abandon_dist") :
		_self.kill()

static func _static_init():
	Register_table.AI["follow"] = follow_AI
	Register_table.AI["spider"] = spider_AI
	Register_table.AI["abandon"] = abandon_AI
