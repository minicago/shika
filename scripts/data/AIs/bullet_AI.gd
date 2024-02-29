extends Node
class_name Bullet_AI

static var bomb_AI = func(_self:Obj_function ,delta):
	_self.set_speed(Vector2(0,0))
	_self.lowlevel.UI.scale *= pow(_self.get_item_info("scale",500.0), delta)
	
static var clean_once_AI = func(_self:Obj_function, delta):
	if _self.timer_get(_self.item_name+"clean_once",0.0) == 0.0:
		_self.banlist.clear()
		_self.timer_set(_self.item_name+"clean_once", _self.get_item_info("clean_once_time", 0.5))
		
static var bullet_anchor_AI = func(_self:Obj_function, delta):
	var father = _self.get_item_info("father",null)
	if father == null : 
		_self.call_handler("die",{})
		return
	_self.set_obj_position( father.get_obj_position() + _self.get_item_info("anchor_offset",Vector2(100, 0)).rotated(father.toward.angle()))
	_self.toward = father.toward.rotated(_self.get_item_info("bullet_speed", Vector2(1800,0)).angle())
	
static var follow_bullet_AI = func(_self:Obj_function , delta):
	_self.speed = Vector2.ZERO
	var world:World = _self.get_father()
	var list = world.get_objs()
	for obj in list:
		if _self.allow_bump(obj) :
			var dist = obj.get_obj_position() - _self.get_obj_position()
			var follow_power = min (1.0 , 10000 / (dist.length() ** 1.5))
			_self.set_real_speed(_self.get_real_speed() + delta * dist.normalized() * follow_power * _self.get_item_info("follow_power", 3000.0))
static func _static_init():
	Register_table.AI["bomb"] = bomb_AI
	Register_table.AI["clean_once"] = clean_once_AI
	Register_table.AI["bullet_anchor"] = bullet_anchor_AI
	Register_table.AI["follow_bullet"] = follow_bullet_AI
