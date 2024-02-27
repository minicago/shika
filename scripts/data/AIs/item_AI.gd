extends Node
class_name Item_AI
	
static var burning_AI = func(_self:Obj_function ,delta):
	_self.item_info_append("display1", _self.get_item_info("damage", {}).get("damage", 0))
	if _self.timer_get(_self.item_name + "cool", 0.0 ) == 0.0:
		var world:World = _self.lowlevel.father
		for obj in world.get_objs():
			if obj.get_addon_info("type") == "monster" and (obj.get_obj_position() - _self.get_obj_position()).length() < _self.get_addon_info("dist",500.0):
				obj. call_handler("take_damage", _self.get_item_info("damage",{}))
		_self.timer_set(_self.item_name + "cool", _self.get_item_info("cool_time",1.0) )
			
static var suicide_AI = func(_self:Obj_function ,delta):
	_self.call_handler("take_damage", {"damage" : _self.get_item_info("suicide_damage") * delta, "ignore_invincible" : true})
	
static var blink_AI = func(_self:Obj_function, delta):
	_self.item_info_append("display1", _self.timer_get(_self.item_name + "cool", 0.0 ))
	_self.item_info_append("display2", _self.get_item_info("cool_time",10.0))
	if Input.is_action_just_pressed("item"+_self.item_name):
		if _self.timer_get(_self.item_name + "cool", 0.0 ) == 0.0:
			_self.set_obj_position( _self.get_obj_position() + _self.get_toward() * _self.get_item_info("blink_dist",50.0) )
			_self.timer_set(_self.item_name + "cool", _self.get_item_info("cool_time",10.0) )

static var rush_AI = func(_self:Obj_function, delta):
	_self.item_info_append("display1", _self.timer_get(_self.item_name + "cool", 0.0 ))
	_self.item_info_append("display2", _self.get_item_info("cool_time",10.0))
	if Input.is_action_just_pressed("item"+_self.item_name):
		if _self.timer_get(_self.item_name + "cool", 0.0 ) == 0.0:
			_self.speed.x +=  _self.get_item_info("rush_power",800.0)
			_self.timer_set(_self.item_name + "cool", _self.get_item_info("cool_time",10.0) )
			
static var gun_AI = func(_self:Obj_function, delta):
	var bullet_type = _self.get_item_info("bullet_type", "gun")
	var bullet_num = Userdata.package_item.get("ammo").get(bullet_type,0)
	_self.item_info_append("display1", bullet_num)
	if Input.is_action_pressed("item"+_self.item_name):
		if bullet_num <= 0 : return
		if _self.timer_get(_self.item_name + "cool", 0.0 ) == 0.0:
			Userdata.package_item.get("ammo")[bullet_type] -= 1
			var world:World = _self.get_father()
			world.function.instance_bullet("bullet", {"damage" : _self.get_item_info("damage", {}), "father" : _self} )
			_self.timer_set(_self.item_name + "cool", _self.get_item_info("cool_time",10.0) )
			
static var gravity_AI = func(_self:Obj_function, delta):
	var dist = _self.get_father().get_home().get_obj_position() - _self.get_obj_position()
	_self.set_real_speed( _self.get_real_speed() + dist.normalized() * _self.get_item_info("gravity", 200.0) * delta )

static func _static_init():
	Register_table.AI["burning"] = burning_AI
	Register_table.AI["suicide"] = suicide_AI
	Register_table.AI["blink"] = blink_AI
	Register_table.AI["rush"] = rush_AI
	Register_table.AI["gun"] = gun_AI
	Register_table.AI["gravity"] = gravity_AI
	
