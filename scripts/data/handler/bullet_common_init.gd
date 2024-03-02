extends Node
static func _static_init():
	Register_table.handlers["bullet_common_init"] = func(_self : Obj_function, value):
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
			_self.set_real_speed( _self.get_addon_info("bullet_speed", Vector2(1800.0, 0)).rotated(_father.get_toward().angle() ) + _father.get_real_speed() )
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
		
		if _self.get_addon_info("aim", false):
			var world:World = _self.get_father()
			_self.set_speed(  _self.get_addon_info("bullet_speed", Vector2(1800.0, 0))  )
			_self.toward = (world.get_rider().get_obj_position() - _self.get_obj_position()).normalized()
		if _self.get_addon_info("smart_aim", false):
			var world:World = _self.get_father()
			_self.set_speed( _self.get_addon_info("bullet_speed", Vector2(1800.0, 0))  )
			var dist = (_self.get_obj_position() - world.get_rider().get_obj_position() )
			var real_spead = world.get_rider().get_real_speed()
			var bullet_speed =  _self.get_addon_info("bullet_speed", Vector2(1800.0, 0)) .length()
			var angle = real_spead.angle_to(dist)
			var sin_angle = sin(angle) / bullet_speed * real_spead.length() 
			var final_toward = (-dist).rotated(asin(sin_angle)).normalized()
			_self.toward = (final_toward)

	