extends Node
static func _static_init():
#rushing_car 
	Register_table.obj_data["rushing_car"] = {	
		"export_dic":{
			"texture" : "res://images/monster/rushing_car.png",
		},
		
		"addon_dic":{
			"UI_instance_path" : "res://tscns/objs/monster/rushing_car.tscn",
			"spinable" : true,
			"maxhealth" : 100.0,
			"health" : 100.0,
			"box" : 20.0,
			"mass" : 10.0,

			"type" : "monster",
			"bump_damage" : {"damage" : 10.0},
			
			"power" : 1600.0,
			"resist" : 0.8,
			"follow_AI_cool_time" : INF,
			"follow_AI_miss_rate" : 0,
			"abandon_dist" : 2000.0,
			
			"take_damage" : ["take_damage"],
			"die" : ["die"],
		
			"process":[
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