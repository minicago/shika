extends Node
class_name Bullet_info

static func _static_init():
	Register_table.obj_data["bullet"] = {
		
		"export_dic":{
			"texture" : "res://images/bullet/bullet.png",
		},

		"addon_dic":{
			"type" : "bullet",
			"UI_instance_path" : "res://tscns/objs/bullet/bullet.tscn",
			"bullet_init" : ["bullet_common_init"],
			"die" : ["die"],
		
		"process":[
			"abandon",
		],
		"bump_handler":[
			"bullet",
			"bullet_kill",
			
		],
		}
	}
	
	Register_table.obj_data["bomb"] = {
		
		"export_dic":{
			"texture" : "res://images/bullet/bullet.png",
		},
		
		"addon_dic":{
			"type" : "bullet",
			"UI_instance_path" : "res://tscns/objs/bullet/bullet.tscn",
			"bullet_init" : ["bullet_common_init"],
			"die" : ["die"],
			"life_time" : 0.5,
			"mass" : 6000.0,
			"box" : 100.0,
			"hard_box" : true,
		
		"process":[
			"abandon",
			"bomb",
		],
		"bump_handler":[
			"bullet",
			"box",
		],
		}
	}

	Register_table.obj_data["follow_bullet"] = {		
		"export_dic":{
			"texture" : "res://images/bullet/bullet.png",
		},

		"addon_dic":{
			"type" : "bullet",
			"UI_instance_path" : "res://tscns/objs/bullet/follow_bullet.tscn",
			"bullet_init" : ["bullet_common_init"],
			"die" : ["die"],
			"bullet_speed" : Vector2(600.0, 0.0),
		
		"process":[
			"abandon",
			"follow_bullet",
		],
		"bump_handler":[
			"bullet",
			"bullet_kill",
			
		],
		}
	}
	
	Register_table.obj_data["laser"] = {
		"export_dic":{
			"texture" : "res://images/bullet/laser.png",
		},

		"addon_dic":{
			"spinable" : true,
			"type" : "bullet",
			"UI_instance_path" : "res://tscns/objs/bullet/laser.tscn",
			"bullet_init" : ["bullet_common_init"],
			"die" : ["die"],
			"bullet_speed" : Vector2(600.0, 0.0),
			"life_time" : 1.5,
			"clean_time_once" : 0.3,
			"abandon_dist" : INF,
		
		"process":[
			
			"abandon",
			"clean_once",
			"bullet_anchor",
		],
		"bump_handler":[
			"bullet",
			"once",
		],
		}
	}
	
	print("bullet function static init done")

