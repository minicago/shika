extends Node
static func _static_init():
#loong_ex
	Register_table.obj_data["loong_ex"] = {
		"export_dic":{
			"texture" : "res://images/monster/loong.png",
		},
		
		
		"addon_dic":{
			"UI_instance_path" : "res://tscns/objs/monster/loong.tscn",
			"spinable" : true,
			"maxhealth" : 120.0,
			"health" : 120.0,

			"type" : "monster",
			"boss" : true,
			"loong" : true,
			"cool_time" : 6,
			"bump_damage" : {"damage" : 10.0},
			"bullet_num" : 1,

			"loong_max_rotate_rate": 0.6 * PI,
			
			"follow_AI_cool_time" : 0.0,
			"power" : 1300.0,
			"resist" : 0.9,
			
			"bullet_damage" : {"damage" : 15.0,},
			
			"take_damage" : ["take_damage"],
			"die" : ["die"],
			"monster_init" : ["loong_init"],
			"bullet" : "laser",
			"cool_handler" : ["shoot_around"],
		
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
