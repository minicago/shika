extends Node
class_name Monster_info

static func _static_init():
# spider	

	Register_table.register_obj_data(
		"spider",
		
		{
			"texture" : "res://images/monster/spider.png",
		},
		
		{
			"UI_instance_path" : "res://tscns/objs/monster/spider.tscn",
			"spinable" : false,
			"maxhealth" : 100.0,
			"health" : 100.0,
			"box" : 10.0,
			"mass" : 8.0,

			"type" : "monster",
			"bump_damage" : {"damage" : 10.0},

			"hurt_time" : 0.2,
			"invincible_time" : 0.2,
			
			"spider_AI_cool_time" : 0.5,
			"follow_AI_cool_time" : 1.0,
			"follow_AI_miss_rate" : 0.5,
			"abandon_dist" : 2000.0,
			"AI_speed" : 1000.0,
			
			"take_damage" : ["take_damage"],
			"die" : ["die"],
		},
		
		[
			"follow",
			"spider",
			"abandon",
			"modulate_hurt",
		],
		
		[
			"once",
			"box",
			"rider",
		],
	)
	
# maggot

	Register_table.register_obj_data(
		"maggot",
		
		{
			"texture" : "res://images/monster/maggot.png",
		},
		
		{
			"UI_instance_path" : "res://tscns/objs/monster/maggot.tscn",
			"spinable" : true,
			"maxhealth" : 100.0,
			"health" : 100.0,
			
			"box" : 10.0,
			"mass" : 8.0,

			"type" : "monster",
			"bump_damage" : {"damage" : 10.0},

			"hurt_time" : 0.2,
			"invincible_time" : 0.2,
			
			"follow_AI_cool_time" : 0.1,
			"follow_AI_miss_rate" : 0.0,
			"power" : 800.0,
			"resist" : 3,
			"abandon_dist" : 2000.0,
			#"suicide_damage" : 20.0,
			
			"take_damage" : ["take_damage"],
			"die" : ["die"],
		},
		
		[
			"follow",
			"maggot",
			"abandon",
			"modulate_hurt",
			#"suicide",
		],
		
		[
			"once",
			"box",
			"rider",
		],
	)
	
#butterfly

	Register_table.register_obj_data(
		"butterfly",
		
		{
			"texture" : "res://images/monster/butterfly.png",
		},
		
		{
			"UI_instance_path" : "res://tscns/objs/monster/butterfly.tscn",
			"spinable" : true,
			"maxhealth" : 100.0,
			"health" : 100.0,
			"type" : "monster",
			"bump_damage" : {"damage" : 10.0},

			"hurt_time" : 0.2,
			"invincible_time" : 0.2,
			"abandon_dist" : 2000.0,
			
			"butterfly_round_time" : 1.0,
			"butterfly_round_dist" : 200,
			"butterfly_dash_speed" : 1400.0,
			"rotation_speed" : 2.0 * PI,
			"butterfly_round_speed" : 2000.0,
			"die_call" : ["maggot"],
			
			"take_damage" : ["take_damage"],
			"die" : ["die_call","die"],
			 
		},
		
		[
			"butterfly",
			"abandon",
			"modulate_hurt",
		],
		
		[
			"once",
			"rider",
		],
	)
	
#loong

	Register_table.register_obj_data(
		"loong",
		
		{
			"texture" : "res://images/monster/loong.png",
		},
		
		
		{
			"UI_instance_path" : "res://tscns/objs/monster/loong.tscn",
			"spinable" : true,
			"maxhealth" : 100.0,
			"health" : 100.0,

			"type" : "monster",
			"boss" : true,
			"loong" : true,
			"bump_damage" : {"damage" : 10.0},

			"hurt_time" : 0.2,
			"invincible_time" : 0.2,
			
			"follow_AI_cool_time" : 0.0,
			"power" : 1200.0,
			"resist" : 0.9,
			
			"bullet_damage" : {"damage" : 10,},
			
			"take_damage" : ["take_damage"],
			"die" : ["die"],
			"monster_init" : ["loong_init"],
			"shoot" : ["shoot_around"],
		},
		
		[
			"follow",
			"maggot",
			"loong",
			"modulate_hurt",
		],
		
		[
			"once",
			"rider",
		],
	)
	
#rushing_car 
	Register_table.register_obj_data(
		"rushing_car",
		
		{
			"texture" : "res://images/monster/rushing_car.png",
		},
		
		{
			"UI_instance_path" : "res://tscns/objs/monster/rushing_car.tscn",
			"spinable" : true,
			"maxhealth" : 100.0,
			"health" : 100.0,
			"box" : 20.0,
			"mass" : 10.0,
			#"hard_box": true,

			"type" : "monster",
			"bump_damage" : {"damage" : 10.0},

			"hurt_time" : 0.2,
			"invincible_time" : 0.2,
			
			"power" : 1600.0,
			"resist" : 0.8,
			"follow_AI_cool_time" : INF,
			"follow_AI_miss_rate" : 0,
			"abandon_dist" : 2000.0,
			
			"take_damage" : ["take_damage"],
			"die" : ["die"],
		},
		
		[
			"follow",
			"maggot",
			"abandon",
			"modulate_hurt",
		],
		
		[
			"once",
			"box",
			"rider",
		],
	)

#spinning_car 
	Register_table.register_obj_data(
		"spinning_car",
		
		{
			"texture" : "res://images/monster/spinning_car.png",
		},
		
		{
			"UI_instance_path" : "res://tscns/objs/monster/spinning_car.tscn",
			"spinable" : true,
			"maxhealth" : 100.0,
			"health" : 100.0,
			"box" : 20.0,
			"mass" : 10.0,
			#"hard_box": true,

			"type" : "monster",
			"bump_damage" : {"damage" : 15.0},

			"hurt_time" : 0.2,
			"invincible_time" : 0.2,
			"spin_rate" : 1,
			"spin_loss" : 0.6,
			
			"power" : 1600.0,
			"resist" : 0.8,
			"follow_AI_cool_time" : INF,
			"follow_AI_miss_rate" : 0,
			"abandon_dist" : 2000.0,
			
			"take_damage" : ["take_damage"],
			"die" : ["die"],
		},
		
		[
			"spin",
			"follow",
			"maggot",
			"abandon",
			"modulate_hurt",
		],
		
		[
			"once",
			"box",
			"rider",
		],
	)

#oil_car 
	Register_table.register_obj_data(
		"oil_car",
		
		{
			"texture" : "res://images/monster/oil_car.png",
		},
		
		{
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

			"hurt_time" : 0.2,
			"invincible_time" : 0.2,
			
			"power" : 1600.0,
			"resist" : 0.8,
			"follow_AI_cool_time" : INF,
			"follow_AI_miss_rate" : 0,
			"abandon_dist" : 2000.0,
			
			"take_damage" : ["take_damage"],
			"die" : ["die_bomb","die"],
		},
		
		[
			"self_bomb",
			"follow",
			"maggot",
			"abandon",
			"modulate_hurt",
		],
		
		[
			"once",
			"box",
			"rider",
		],
	)
#rushing_car 
	Register_table.register_obj_data(
		"tank",
		
		{
			"texture" : "res://images/monster/tank.png",
		},
		
		{
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

			"hurt_time" : 0.2,
			"invincible_time" : 0.2,
			
			"power" : 1200.0,
			"resist" : 0.8,
			"follow_AI_cool_time" : INF,
			"follow_AI_miss_rate" : 0,
			"abandon_dist" : 2000.0,
			
			"take_damage" : ["take_damage"],
			"die" : ["die"],
		},
		
		[
			"follow",
			"maggot",
			"abandon",
			"modulate_hurt",
			"aim_bullet",
		],
		
		[
			"once",
			"box",
			"rider",
		],
	)
	print("monster function static init done")
