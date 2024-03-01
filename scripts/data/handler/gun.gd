extends Node

static func _static_init():
	Register_table.handlers["gun"] = func (_self : Obj_function, value) :
		var bullet_type = _self.get_item_info("bullet_type", "gun")
		var bullet_num = Userdata.package_item.get("ammo").get(bullet_type,0)
		_self.item_info_append("displaytext", str(bullet_num) )
		if Input.is_action_pressed("item"+_self.item_name):
			if bullet_num <= 0 : return
			if _self.timer_get(_self.item_name + "cool", 0.0 ) == 0.0:
				Userdata.package_item.get("ammo")[bullet_type] -= 1
				var world:World = _self.get_father()
				world.function.instance_bullet("bullet", {"damage" : _self.get_item_info("damage", {}), "father" : _self} )
				_self.timer_set(_self.item_name + "cool", _self.get_item_info("cool_time",10.0) )
		pass

