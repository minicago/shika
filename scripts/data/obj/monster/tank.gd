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
			

			"invincible_time" : 0.2,
			
			"power" : 1200.0,
			"resist" : 0.8,
			"cool_time" : INF,
			"abandon_dist" : 2000.0,
			
			"take_damage" : ["take_damage"],
			"die" : ["die"],
			"cool_handler" : ["follow"],
			
			"process":[
				"maggot",
				"abandon",
				"modulate_hurt",
				"cool_boot"
			],
			
			"0bullet_damage" : {"damage" : 5.0},
			"0cool_handler" : ["shoot_bullet"],
			"0cool_time" : 1.0,
			"0smart_aim" : true,
			"0process" : [
				"cool_boot",
			],
			
			"bump_handler":[
				"box",
				"rider",
			],
		}
	}
