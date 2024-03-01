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
			"follow_AI_cool_time" : INF,
			"follow_AI_miss_rate" : 0,
			"abandon_dist" : 2000.0,
			
			"take_damage" : ["take_damage"],
			"die" : ["die_bomb","die"],
		
			"process":[
				"self_bomb",
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