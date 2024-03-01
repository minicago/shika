extends Node
static func _static_init():
	
# maggot
	Register_table.obj_data["maggot"] = {
		"export_dic":{
			"texture" : "res://images/monster/maggot.png",
		},
		
		"addon_dic":{
			"UI_instance_path" : "res://tscns/objs/monster/maggot.tscn",
			"spinable" : true,
			"maxhealth" : 100.0,
			"health" : 100.0,
			
			"box" : 10.0,
			"mass" : 8.0,

			"type" : "monster",
			"bump_damage" : {"damage" : 10.0},
			
			"follow_AI_cool_time" : 0.1,
			"follow_AI_miss_rate" : 0.0,
			"power" : 800.0,
			"resist" : 3,
			"abandon_dist" : 2000.0,
			#"suicide_damage" : 20.0,
			
			"take_damage" : ["take_damage"],
			"die" : ["die"],
		
			"process":[
				"follow",
				"maggot",
				"abandon",
				"modulate_hurt",
				#"suicide",
			],
			"bump_handler":[
				"box",
				"rider",
			],
		}
	}