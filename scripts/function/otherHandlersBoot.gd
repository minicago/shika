extends Node
class_name OtherHandlerBoot

static var take_damage_handler = func(_self : Obj_function, value):
	var damage = value.get("damage", 0.0)
	var ignore_invincible = value.get("ignore_invincible", false)
	if _self.timer_get("invincible") == 0.0 or ignore_invincible:
		_self.health -= damage
		if _self.health < 0 : 
			_self.health = 0
			_self.call_handler("die", {})
		if _self.health > _self.maxhealth :
			_self.health = _self.maxhealth
		if not ignore_invincible:_self.timer_set("hurt", _self.addon_info.get("hurt_time", 0.0))
		if not ignore_invincible:_self.timer_set("invincible", _self.addon_info.get("invincible_time",0.0))
		
static var die_handler = func(_self : Obj_function, value):
	_self.kill()



static var die_call_handler = func(_self : Obj_function, value):
	var world:World = _self.get_father()
	for son in _self.get_addon_info("die_call"):
		var monster:Obj = world.instance_monster(son)
		monster.set_obj_position(_self.get_obj_position())
	_self.kill()

static func _static_init():
	Register_table.handlers["take_damage"] = take_damage_handler
	Register_table.handlers["die"] = die_handler
	Register_table.handlers["die_call"] = die_call_handler
