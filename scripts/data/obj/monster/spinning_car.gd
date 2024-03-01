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
			"cool_time" : INF,
			
			"abandon_dist" : 2000.0,
			
			"take_damage" : ["take_damage"],
			"die" : ["die"],
			"cool_handler" : ["follow"],
		
			"process":[
				"spin",
				"maggot",
				"abandon",
				"modulate_hurt",
				"cool_boot",
			],
			"bump_handler":[
				"box",
				"rider",
			],
		}
	}
