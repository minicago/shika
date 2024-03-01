extends Node
static func _static_init():	
#loong

	Register_table.obj_data["loong"] = {
		"export_dic":{
			"texture" : "res://images/monster/loong.png",
		},
		
		
		"addon_dic":{
			"UI_instance_path" : "res://tscns/objs/monster/loong.tscn",
			"spinable" : true,
			"maxhealth" : 100.0,
			"health" : 100.0,

			"type" : "monster",
			"boss" : true,
			"loong" : true,
			
			"bump_damage" : {"damage" : 10.0},
			
			"follow_AI_cool_time" : 0.0,
			"power" : 1200.0,
			"resist" : 0.9,
			
			"take_damage" : ["take_damage"],
			"die" : ["die"],
			"monster_init" : ["loong_init"],
			
			"shoot_cool" : 8,
			"bullet_num" : 1,
			"bullet" : "laser",
			"shoot" : ["shoot_around"],
			"bullet_damage" : {"damage" : 10.0,},
		
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
	
