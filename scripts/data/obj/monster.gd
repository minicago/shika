extends Node
class_name Monster_info

static func _static_init():
# spider	

	#Register_table.obj_data["spider"] = {
		#"export_dic":{
			#"texture" : "res://images/monster/spider.png",
		#},
		#
		#"addon_dic":{
			#"UI_instance_path" : "res://tscns/objs/monster/spider.tscn",
			#"spinable" : false,
			#"maxhealth" : 100.0,
			#"health" : 100.0,
			#"box" : 10.0,
			#"mass" : 8.0,
#
			#"type" : "monster",
			#"bump_damage" : {"damage" : 10.0},
			#
			#"spider_AI_cool_time" : 0.5,
			#"follow_AI_cool_time" : 1.0,
			#"follow_AI_miss_rate" : 0.5,
			#"abandon_dist" : 2000.0,
			#"AI_speed" : 1000.0,
			#
			#"take_damage" : ["take_damage"],
			#"die" : ["die"],
		#
			#"process":[
				#"follow",
				#"spider",
				#"abandon",
				#"modulate_hurt",
			#],
			#"bump_handler":[
				#"box",
				#"rider",
			#],
		#}
	#}
	
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
	
#butterfly

	Register_table.obj_data["butterfly"] = {
		"export_dic":{
			"texture" : "res://images/monster/butterfly.png",
		},
		
		"addon_dic":{
			"UI_instance_path" : "res://tscns/objs/monster/butterfly.tscn",
			"spinable" : true,
			"maxhealth" : 100.0,
			"health" : 100.0,
			"type" : "monster",
			"bump_damage" : {"damage" : 10.0},

			"abandon_dist" : 2000.0,
			
			"butterfly_round_time" : 1.0,
			"butterfly_round_dist" : 200,
			"butterfly_dash_speed" : 1400.0,
			"rotation_speed" : 2.0 * PI,
			"butterfly_round_speed" : 2000.0,
			"die_call" : ["maggot"],
			
			"take_damage" : ["take_damage"],
			"die" : ["die_call","die"],
			 
		
			"process":[
				"butterfly",
				"abandon",
				"modulate_hurt",
			],
			"bump_handler":[
				"rider",
			],
		}
	}
	
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
	
#rushing_car 
	Register_table.obj_data["rushing_car"] = {	
		"export_dic":{
			"texture" : "res://images/monster/rushing_car.png",
		},
		
		"addon_dic":{
			"UI_instance_path" : "res://tscns/objs/monster/rushing_car.tscn",
			"spinable" : true,
			"maxhealth" : 100.0,
			"health" : 100.0,
			"box" : 20.0,
			"mass" : 10.0,
			#"hard_box": true,

			"type" : "monster",
			"bump_damage" : {"damage" : 10.0},
			
			"power" : 1600.0,
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
			],
			"bump_handler":[
				"box",
				"rider",
			],
		}
	}

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
#rushing_car 
	Register_table.obj_data["rushing_car"] = {
		
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
			"shoot_cool" : 6,
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
	print("monster function static init done")
