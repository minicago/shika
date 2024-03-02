extends Node
static func _static_init():
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
