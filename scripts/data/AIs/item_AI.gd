extends Node
class_name Item_AI
	
static var burning_AI = func(_self:Obj_function ,delta):
	var world:World = _self.lowlevel.father
	for obj in world.get_objs():
		if obj.get_addon_info("type") == "monster" and (obj.get_obj_position() - _self.get_obj_position()).length() < 500.0:
			obj.take_damage(_self.get_addon_info("attack") * delta * 0.01)
			
static var suicide_AI = func(_self:Obj_function ,delta):
	_self.call_handler("take_damage", {"damage" : _self.get_addon_info("suicide_damage") * delta, "ignore_invincible" : true})
	
static var blink_AI = func(_self:Obj_function, delta):
	_self.item_info_append("display1", _self.timer_get(_self.AI_name + "cool", 0.0 ))
	_self.item_info_append("display2", _self.get_item_info("cool_time",10.0))
	if Input.is_action_just_pressed("item"+_self.AI_name):
		if _self.timer_get(_self.AI_name + "cool", 0.0 ) == 0.0:
			_self.set_obj_position( _self.get_obj_position() + _self.get_toward() * _self.get_item_info("blink_dist",50.0) )
			_self.timer_set(_self.AI_name + "cool", _self.get_item_info("cool_time",10.0) )

static var rush_AI = func(_self:Obj_function, delta):
	_self.item_info_append("display1", _self.timer_get(_self.AI_name + "cool", 0.0 ))
	_self.item_info_append("display2", _self.get_item_info("cool_time",10.0))
	if Input.is_action_just_pressed("item"+_self.AI_name):
		if _self.timer_get(_self.AI_name + "cool", 0.0 ) == 0.0:
			_self.speed.x +=  _self.get_item_info("rush_power",800.0)
			_self.timer_set(_self.AI_name + "cool", _self.get_item_info("cool_time",10.0) )

static func _static_init():
	Register_table.AI["burning"] = burning_AI
	Register_table.AI["suicide"] = suicide_AI
	Register_table.AI["blink"] = blink_AI
	Register_table.AI["rush"] = rush_AI
