extends Node
static func _static_init():
	Register_table.handlers["shoot_bullet"] = func(_self:Obj_function ,value):
		var world:World = _self.get_father()
		var bullet_num = _self.get_item_info("bullet_num", 1)
		var bullet_speed = _self.get_item_info("bullet_speed", 1800.0)
		for i in range(0, bullet_num):
			world.instance_bullet(_self.get_item_info("bullet", "bullet") , 
			{
				"damage" : _self.get_item_info("bullet_damage", {}), 
				"father" : _self , 
				"bullet_speed" : Vector2(bullet_speed, 0 ).rotated(_self.get_item_info("bullet_angle", 2 * PI) * i  / bullet_num),
				"smart_aim" : _self.get_item_info("smart_aim", false) ,
				"aim" : _self.get_item_info("aim", false) ,
				"all_hurt" : _self.get_item_info("bullet_all_hurt", false),
			} 
			)
