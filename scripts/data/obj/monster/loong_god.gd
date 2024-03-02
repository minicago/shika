extends Node
static func _static_init():
#loong_god
	Register_table.obj_data["loong_god"] = {		
		"export_dic":{
			"texture" : "res://images/monster/loong.png",
		},
		
		 
		"addon_dic":{
			"UI_instance_path" : "res://tscns/objs/monster/loong.tscn",
			"spinable" : true,
			"maxhealth" : 140.0,
			"health" : 140.0,

			"type" : "monster",
			"boss" : true,
			"loong" : true,
			"cool_time" : 6,
			"bump_damage" : {"damage" : 20.0},
			"bullet_num" : 1,
			
			"power" : 1450.0,
			"resist" : 0.86,
			
			
			"take_damage" : ["take_damage"],
			"monster_init" : ["loong_init"],

			"0bullet_num" : 3,
			"0bullet" : "laser",
			
			"0cool_time" : 8,
			"0cool_handler" : ["shoot_bullet"],
			"0bullet_damage" : {"damage" : 20.0,},
			
			"0value" : 0.8 * PI,
			"0value_name" : "max_rotate_rate",
			"0follow_rider_handler" : ["cool_boot","set_value"],
			
			"1value" : 4 * PI,
			"1value_name" : "max_rotate_rate",
			"1follow_other_handler" : ["set_value"],
			
			"2value" : Vector2(1200.0, 0.0),
			"2value_name" : "speed",
			"2straight_handler" : ["add_value_delta"],
			
			"3value" : Vector2(4000.0, 0.0),
			"3value_name" : "speed",
			"3close_handler" : ["add_value_delta"],
			
			"close_dist" : 2000.0,
			
			"process":[
				"follow",
				"maggot",
				"modulate_hurt",
				
				"follow_boot",
				"straight_boot",
				"close_boot",
				"loong",
			],
		
			"bump_handler":[
				"rider",
			],
			
			"die" : ["die", "die_call"],
			"die_call" : ["loong_ex", "loong_ex"],
			
		}
	}
