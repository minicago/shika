extends Node
static func _static_init():
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

