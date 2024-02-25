extends Node
class_name OtherHandlerBoot

static var take_damage_handler = func(_self : Obj_function, value):
	var ammor = _self.get_addon_info("ammor", 0.0)
	var damage = value.get("damage", 0.0)
	
	damage = max (1.0, damage - max(0.0,ammor - value.get("ignore_ammor",0.0)))
	damage *= 1.0 - _self.get_addon_info("damage_off", 0.0)
	var ignore_invincible = value.get("ignore_invincible", false)

	if _self.timer_get("invincible") == 0.0 or ignore_invincible:
		var maxhealth = _self.get_addon_info("maxhealth", 0.0)
		var health = _self.get_addon_info("health", 0.0)
		health -= damage
		if health < 0 : 
			health = 0
			_self.call_handler("die", {})
		if health > maxhealth :
			health = maxhealth
		
		_self.addon_info_append("health", health)
		_self.timer_set("hurt", _self.addon_info.get("hurt_time", 0.0))
		if not ignore_invincible:_self.timer_set("invincible", _self.addon_info.get("invincible_time",0.0))
		
static var die_handler = func(_self : Obj_function, value):
	_self.kill()



static var die_call_handler = func(_self : Obj_function, value):
	var world:World = _self.get_father()
	for son in _self.get_addon_info("die_call"):
		var monster:Obj = world.instance_monster(son)
		monster.set_obj_position(_self.get_obj_position())
	
static var loong_init_handler = func(_self : Obj_function, value):
	_self.addon_info_append("tail",_self)
	var world:World = _self.get_father()
	for monster:Obj in world.function.monsters:
		if monster.get_addon_info("loong", false):
			if monster != _self.lowlevel:
				_self.addon_info_append("follow_monster" , monster.get_addon_info("tail", null))
				_self.set_obj_position( monster.get_addon_info("tail", null).get_obj_position() )
				monster.addon_info_append("tail",_self)
				break
				
static var bullet_common_init_handler = func(_self : Obj_function, value):
	var _father:Obj_function = value.get("father", null)
	if _father == null:
		_self.set_obj_position(value.get("position", Vector2(0, 0)))
		_self.set_speed(value.get("init_speed", Vector2(0,0) ) )
		_self.toward = value.get("toward", Vector2(0,0) )
		_self.addon_info_append("ban_group", value.get("ban_group", []) )
	else :
		_self.set_obj_position(_father.get_obj_position() + _father.get_toward() * value.get("offset", 20.0))
		_self.toward = _father.get_toward()
		#print("bullet_speed =", _father.get_toward() * value.get("bullet_speed", 1000.0) + _father.get_real_speed())
		_self.set_real_speed(_father.get_toward() * value.get("bullet_speed", 1800.0) + _father.get_real_speed() )
		#print("bullet_toward == ", _self.speed)
		var type = _father.get_addon_info("type", null)
		if value.get("all_hurt", false):
			_self.addon_info_append("ban_group", [ "home", "bullet"] )
		else :
			if type == "rider" :
				_self.addon_info_append("ban_group", ["rider", "home", "bullet"] )
			elif type == "monster": 
				_self.addon_info_append("ban_group", ["monster", "home", "bullet"] )
			elif type == "bullet" :
				_self.addon_info_append("ban_group", _father.get_addon_info("ban_group", []))
	
	_self.timer_set("life_time", _self.get_addon_info("life_time", 5.0) )
	
	_self.addon_info_append("damage", value.get("damage", {}) )
	
	if value.get("aim", false):
		var world:World = _self.get_father()
			#print("bullet_speed =", _father.get_toward() * value.get("bullet_speed", 1000.0) + _father.get_real_speed())
		_self.set_speed( Vector2(value.get("bullet_speed", 1800.0) , 0 ) )
		_self.toward = (world.get_rider().get_obj_position() - _self.get_obj_position()).normalized()
	
static var die_bomb_handler = func(_self : Obj_function, value):
	var world:World = _self.get_father()
	world.instance_bullet("bomb", {"all_hurt" : true, "damage" : _self.get_addon_info("die_damage", {}) , "father" : _self})

static func _static_init():
	Register_table.handlers["take_damage"] = take_damage_handler
	Register_table.handlers["die"] = die_handler
	Register_table.handlers["die_call"] = die_call_handler
	Register_table.handlers["loong_init"] = loong_init_handler
	Register_table.handlers["bullet_common_init"] = bullet_common_init_handler
	Register_table.handlers["die_bomb"] = die_bomb_handler
	
