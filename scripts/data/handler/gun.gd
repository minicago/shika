extends Node

static func _static_init():
	Register_table.handlers["shoot_ammo"] = func (_self : Obj_function, value) :
		var ammo_type = _self.get_item_info("ammo_type", "gun")
		var ammo_num = Userdata.package_item.get("ammo").get(ammo_type,0)
		var bullet_type = _self.get_item_info("bullet_type", "bullet")
		if ammo_num <= 0 : return
		Userdata.package_item.get("ammo")[ammo_type] = ammo_num - 1
		var world:World = _self.get_father()
		world.function.instance_bullet(bullet_type , {"damage" : _self.get_item_info("damage", {}), "father" : _self} )
		pass

