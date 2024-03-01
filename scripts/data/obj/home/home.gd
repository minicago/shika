extends Node
static func _static_init():
	Register_table.obj_data["home"] = {
		
		"export_dic":{
			"texture" : "res://images/normal/home.png",
		},
		
		"addon_dic":{
			"UI_instance_path" : "res://tscns/objs/home.tscn",
			"type" : "home",
			"once" : true,
		
			"process":[
			],
			"bump_handler":[
				"once",
			],
		}
	}
	print("home function static init done")

