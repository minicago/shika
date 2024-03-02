extends Node
static func _static_init():
	Register_table.handlers["take_damage"] = func(_self : Obj_function, value):
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
