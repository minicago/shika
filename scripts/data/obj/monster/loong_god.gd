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
			"maxhealth" : 150.0,
			"health" : 150.0,

			"type" : "monster",
			"boss" : true,
			"loong" : true,
			"shoot_cool" : 5.5,
			"bump_damage" : {"damage" : 10.0},
			"bullet_num" : 3,

			"loong_max_rotate_rate": 0.6 * PI,
			
			"follow_AI_cool_time" : 0.0,
			"power" : 1300.0,
			"resist" : 0.9,
			
			"bullet_damage" : {"damage" : 15.0,},
			
			"take_damage" : ["take_damage"],
			"die" : ["die", "die_call"],
			"die_call" : ["loong_ex", "loong_ex"],
			"monster_init" : ["loong_init"],
			"bullet" : "laser",
			"shoot" : ["shoot_around"],
		
			"process":[
				"follow",
				"maggot",
				"loong",
				"modulate_hurt",
			],
			"bump_handler":[
				"rider",
			],
		}
	}
