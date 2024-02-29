extends Node
class_name Bullet_info

static func _static_init():
	Register_table.register_obj_data(
		"bullet",
		
		{
			"texture" : "res://images/bullet/bullet.png",
		},
		
		{
			"type" : "bullet",
			"UI_instance_path" : "res://tscns/objs/bullet/bullet.tscn",
			"bullet_init" : ["bullet_common_init"],
			"die" : ["die"],
		},
		
		[
			"abandon",
		],
		
		[
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
			"type" : "bullet",
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
			"bullet",
			"box",
		],
	)

	Register_table.register_obj_data(
		"follow_bullet",
		
		{
			"texture" : "res://images/bullet/bullet.png",
		},
		
		{
			"type" : "bullet",
			"UI_instance_path" : "res://tscns/objs/bullet/follow_bullet.tscn",
			"bullet_init" : ["bullet_common_init"],
			"die" : ["die"],
			"bullet_speed" : Vector2(600.0, 0.0),
		},
		
		[
			"abandon",
			"follow_bullet",
		],
		
		[
			"bullet",
			"bullet_kill",
			
		],
	)
	
	Register_table.register_obj_data(
		"laser",
		
		{
			"texture" : "res://images/bullet/laser.png",
		},
		
		{
			"spinable" : true,
			"type" : "bullet",
			"UI_instance_path" : "res://tscns/objs/bullet/laser.tscn",
			"bullet_init" : ["bullet_common_init"],
			"die" : ["die"],
			"bullet_speed" : Vector2(600.0, 0.0),
			"life_time" : 1.5,
			"clean_time_once" : 0.3,
			"abandon_dist" : INF,
		},
		
		[
			
			"abandon",
			"clean_once",
			"bullet_anchor",
		],
		
		[
			"bullet",
			"once",
		],
	)
	
	print("bullet function static init done")

