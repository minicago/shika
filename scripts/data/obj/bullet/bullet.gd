extends Node
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