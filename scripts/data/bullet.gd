extends Node
class_name Bullet_info

static func _static_init():
	Register_table.register_obj_data(
		"bullet",
		
		{
			"texture" : "res://images/bullet/bullet.png",
		},
		
		{
			"UI_instance_path" : "res://tscns/objs/bullet/bullet.tscn",
			"bullet_init" : ["bullet_common_init"],
			"die" : ["die"],
		},
		
		[
			"abandon",
		],
		
		[
			"once",
			"bullet",
			"bullet_kill",
			
		],
	)
	
	Register_table.register_obj_data(
		"bomb",
		
		{
			"texture" : "res://images/bullet/bullet.png",
		},
		
		{
			"UI_instance_path" : "res://tscns/objs/bullet/bullet.tscn",
			"bullet_init" : ["bullet_common_init"],
			"die" : ["die"],
			"life_time" : 0.5,
			"mass" : 6000.0,
			"box" : 100.0,
			"hard_box" : true,
		},
		
		[
			"abandon",
			"bomb",
		],
		
		[
			"once",
			"bullet",
			"box",
		],
	)	
	print("bullet function static init done")

