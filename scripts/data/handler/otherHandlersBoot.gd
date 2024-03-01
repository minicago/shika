extends Node
class_name OtherHandlerBoot

static var take_damage_handler = func(_self : Obj_function, value):
	var ammor = _self.get_addon_info("ammor", 0.0)
	var damage = value.get("damage", 0.0)
	var ignore_invincible = value.get("ignore_invincible", false)
	
	if damage > 0 :
		damage = max (1.0, damage - max(0.0,ammor - value.get("ignore_ammor",0.0)))
		damage *= 1.0 - _self.get_addon_info("damage_off", 0.0)
	else:
		ignore_invincible = true

	if _self.timer_get("invincible") == 0.0 or ignore_invincible:
		var maxhealth = _self.get_addon_info("maxhealth", 0.0)
		var health = _self.get_addon_info("health", 0.0)
		health -= damage
		if health < 0 : 
			damage += health
			health = 0
			
			
		if health > maxhealth :
			damage += maxhealth - health
			health = maxhealth
		
		_self.addon_info_append("health", health)
		if damage > 0 : 
			_self.timer_set("hurt", _self.addon_info.get("hurt_time", 0.2))
			if not ignore_invincible:_self.timer_set("invincible", _self.addon_info.get("invincible_time",0.2))
		else :
			_self.timer_set("heal", _self.addon_info.get("heal_time", 0.2))
		
		if health == 0 : _self.call_handler("die", {})
		
static var die_handler = func(_self : Obj_function, value): 
	_self.addon_info_append("go_die" , true)
	_self.call_handler("go_die_handler", {})
	if _self.get_addon_info("go_die", true):
		_self.kill()

static var die_call_handler = func(_self : Obj_function, value):
	var world:World = _self.get_father()
	for son in _self.get_item_info("die_call"):
		var monster:Obj = world.instance_monster(son)
		monster.set_obj_position(_self.get_obj_position())
	
static var loong_init_handler = func(_self : Obj_function, value):
	_self.addon_info_append("tail",_self)
	var world:World = _self.get_father()
	for monster:Obj in world.function.monsters:
		if monster.get_addon_info("loong", false):
			if monster != _self.lowlevel:
				_self.addon_info_append("follow_monster" , monster.get_addon_info("tail", null))
				if monster.get_addon_info("tail", null) == null : break
				_self.set_obj_position( monster.get_addon_info("tail", null).get_obj_position() - _self.get_item_info("follow_monster", null).get_toward() * _self.get_item_info("follow_offset", 250.0))
				_self.set_speed(monster.get_addon_info("tail", null).get_speed() )
				_self.toward = monster.get_addon_info("tail", null).get_toward()
				monster.addon_info_append("tail",_self)
				break
				
static var bullet_common_init_handler = func(_self : Obj_function, value):
	var _father:Obj_function = value.get("father", null)
	for key in value :
		_self.addon_info_append(key,value[key])
	if _father == null:
		_self.set_obj_position(_self.get_addon_info("position", Vector2(0, 0)))
		_self.set_speed(_self.get_addon_info("bullet_speed", Vector2(0,0) ) )
		_self.toward = _self.get_addon_info("toward", Vector2(0,0) )
		_self.addon_info_append("ban_group", value.get("ban_group", []) )
	else :
		_self.set_obj_position(_father.get_obj_position() + _father.get_toward() * value.get("offset", 20.0))
		_self.toward = _self.get_addon_info("bullet_speed", Vector2(1800.0, 0)).rotated(_father.get_toward().angle() ).normalized()
		#print("bullet_speed =", _father.get_toward() * value.get("bullet_speed", 1000.0) + _father.get_real_speed())
		_self.set_real_speed( _self.get_addon_info("bullet_speed", Vector2(1800.0, 0)).rotated(_father.get_toward().angle() ) + _father.get_real_speed() )
		#print("bullet_toward == ", _self.speed)
		var type = _father.get_addon_info("type", null)
		if _self.get_addon_info("all_hurt", false):
			_self.addon_info_append("ban_group", [ "home", "bullet"] )
		else :
			if type == "rider" :
				_self.addon_info_append("ban_group", ["rider", "home", "bullet"] )
			elif type == "monster": 
				_self.addon_info_append("ban_group", ["monster", "home", "bullet"] )
			elif type == "bullet" :
				_self.addon_info_append("ban_group", _father.get_addon_info("ban_group", []))
	
	_self.timer_set("life_time", _self.get_addon_info("life_time", 5.0) )
	
	#_self.addon_info_append("damage", value.get("damage", {}) )
	
	if _self.get_addon_info("aim", false):
		var world:World = _self.get_father()
			#print("bullet_speed =", _father.get_toward() * value.get("bullet_speed", 1000.0) + _father.get_real_speed())
		_self.set_speed(  _self.get_addon_info("bullet_speed", Vector2(1800.0, 0))  )
		_self.toward = (world.get_rider().get_obj_position() - _self.get_obj_position()).normalized()
	if _self.get_addon_info("smart_aim", false):
		var world:World = _self.get_father()
			#print("bullet_speed =", _father.get_toward() * value.get("bullet_speed", 1000.0) + _father.get_real_speed())
		_self.set_speed( _self.get_addon_info("bullet_speed", Vector2(1800.0, 0))  )
		var dist = (_self.get_obj_position() - world.get_rider().get_obj_position() )
		var real_spead = world.get_rider().get_real_speed()
		var bullet_speed =  _self.get_addon_info("bullet_speed", Vector2(1800.0, 0)) .length()
		var angle = real_spead.angle_to(dist)
		var sin_angle = sin(angle) / bullet_speed * real_spead.length() 
		var final_toward = (-dist).rotated(asin(sin_angle))
		_self.toward = (final_toward).normalized()
	
	
static var die_bomb_handler = func(_self : Obj_function, value):
	var world:World = _self.get_father()
	world.instance_bullet("bomb", {"all_hurt" : true, "damage" : _self.get_item_info("die_damage", {}) , "father" : _self}) 
	
static var shoot_around_handler = func(_self : Obj_function, value):
	var world:World = _self.get_father()
	var bullet_num = _self.get_item_info("bullet_num", 8)
	var bullet_speed = _self.get_item_info("bullet_speed", 1800.0)
	for i in range(0, bullet_num):
		world.instance_bullet(_self.get_item_info("bullet", "bullet") , 
		{"damage" : _self.get_item_info("bullet_damage", {}), "father" : _self , "bullet_speed" : Vector2(bullet_speed, 0 ).rotated(2 * i * PI / bullet_num)} )

static var reborn_handler = func (_self : Obj_function, value):
	if _self.get_addon_info("go_die", true):
		if not _self.get_item_info("reborned", false):
			_self.addon_info_append("go_die", false)
			_self.call_handler("take_damage", 
			{"damage" :- _self.get_addon_info("maxhealth", 0.0) * _self.get_item_info("reborn_rate", 0.0 ) - _self.get_item_info("reborn_value", 0.0 ) } 
			) 
			_self.item_info_append("reborned" , true)
			return true
	return false
	
static var onemorechance_handler =  func (_self : Obj_function, value):
	if Register_table.handlers["reborn"].call(_self, value) :
		Register_table.handlers["shoot_around"].call(_self, value)
		
static var take_self_damage_handler = func (_self : Obj_function, value) :
	_self.call_handler("take_damage", _self.get_item_info("self_damage", {}) )
	
static var take_self_heal_handler = func (_self : Obj_function, value) :
	_self.call_handler("take_damage", _self.get_item_info("self_heal", {}) ) 
	
static func _static_init():
	Register_table.handlers["take_damage"] = take_damage_handler
	Register_table.handlers["die"] = die_handler
	Register_table.handlers["die_call"] = die_call_handler
	Register_table.handlers["loong_init"] = loong_init_handler
	Register_table.handlers["bullet_common_init"] = bullet_common_init_handler
	Register_table.handlers["die_bomb"] = die_bomb_handler
	Register_table.handlers["shoot_around"] = shoot_around_handler
	Register_table.handlers["reborn"] = reborn_handler
	Register_table.handlers["onemorechance"] = onemorechance_handler
	Register_table.handlers["take_self_damage"] = take_self_damage_handler
	Register_table.handlers["take_self_heal"] = take_self_heal_handler
