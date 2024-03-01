extends Node
static func _static_init():
#spinning_car 
	Register_table.obj_data["spinning_car"] = {
		"export_dic":{
			"texture" : "res://images/monster/spinning_car.png",
		},
		
		"addon_dic":{
			"UI_instance_path" : "res://tscns/objs/monster/spinning_car.tscn",
			"spinable" : true,
			"maxhealth" : 100.0,
			"health" : 100.0,
			"box" : 20.0,
			"mass" : 10.0,
			#"hard_box": true,

			"type" : "monster",
			"bump_damage" : {"damage" : 15.0},

			"spin_rate" : 1,
			"spin_loss" : 0.6,
			
			"power" : 1600.0,
			"resist" : 0.8,
			"follow_AI_cool_time" : INF,
			"follow_AI_miss_rate" : 0,
			"abandon_dist" : 2000.0,
			
			"take_damage" : ["take_damage"],
			"die" : ["die"],
		
			"process":[
				"spin",
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