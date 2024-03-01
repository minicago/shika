extends Node
static func _static_init():
#tank 
	Register_table.obj_data["tank"] = {
		
		"export_dic":{
			"texture" : "res://images/monster/tank.png",
		},
		
		"addon_dic":{
			"UI_instance_path" : "res://tscns/objs/monster/tank.tscn",
			"spinable" : true,
			"maxhealth" : 100.0,
			"health" : 100.0,
			"box" : 20.0,
			"mass" : 20.0,
			#"hard_box": true,

			"type" : "monster",
			"bump_damage" : {"damage" : 15.0},
			"bullet_damage" : {"damage" : 15.0},

			"invincible_time" : 0.2,
			
			"power" : 1200.0,
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
				"aim_bullet",
			],
			"bump_handler":[
				"box",
				"rider",
			],
		}
	}