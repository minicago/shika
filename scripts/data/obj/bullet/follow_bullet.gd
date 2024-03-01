extends Node
static func _static_init():
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