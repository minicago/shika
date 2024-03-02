extends Node
static func _static_init():
#oil_car 
	Register_table.obj_data["oil_car"] = {
		"export_dic":{
			"texture" : "res://images/monster/oil_car.png",
		},
		
		"addon_dic":{
			"UI_instance_path" : "res://tscns/objs/monster/oil_car.tscn",
			"spinable" : true,
			"maxhealth" : 10.0,
			"health" : 10.0,
			"box" : 20.0,
			"mass" : 10.0,
			#"hard_box": true,

			"type" : "monster",
			"bump_damage" : {"damage" : 10.0},
			"die_damage" : {"damage" : 20.0},
			
			"power" : 1600.0,
			"resist" : 0.8,
			"abandon_dist" : 2000.0,
			
			"take_damage" : ["take_damage"],
			
			"bullet" : "bomb",
			"all_hurt" : true,
			
			"die" : ["shoot_bullet","die"],
			"handler_name" : "die",
			"close_handler" : ["call_handler"],
			"close_dist" : 300.0,
			
			"process":[
				"close_boot",
				"follow",
				"maggot",
				"abandon",
				"modulate_hurt",
			],
			"bump_handler":[
				"box",
				"rider",
			],
		}
	}
