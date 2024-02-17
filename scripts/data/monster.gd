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
			"spinable" : false,
			"maxhealth" : 100.0,
			"health" : 100.0,
			"UI_instance_path" : "res://tscns/objs/monster/spider.tscn",
			#"texture" : "res://images/monster/spider.png",
		},
		
		{
			"box" : 10.0,
			"mass" : 8.0,

			"type" : "monster",
			"attack" : 10.0,

			"hurt_time" : 0.2,
			"invincible_time" : 0.2,
			
			"spider_AI_cool_time" : 0.5,
			"follow_AI_cool_time" : 1.0,
			"follow_AI_miss_rate" : 0.5,
			"abandon_dist" : 2000.0,
			"AI_speed" : 1000.0,
			
			"take_damage" : [Register_table.handlers["take_damage"]],
			"die" : [Register_table.handlers["die"]],
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
			"spinable" : true,
			"maxhealth" : 100.0,
			"health" : 100.0,
			"UI_instance_path" : "res://tscns/objs/monster/maggot.tscn"
		},
		
		{
			"box" : 10.0,
			"mass" : 8.0,

			"type" : "monster",
			"attack" : 10.0,

			"hurt_time" : 0.2,
			"invincible_time" : 0.2,
			
			"follow_AI_cool_time" : 0.1,
			"follow_AI_miss_rate" : 0.0,
			"power" : 800.0,
			"resist" : 3,
			"abandon_dist" : 2000.0,
			#"suicide_damage" : 20.0,
			
			"take_damage" : [Register_table.handlers["take_damage"]],
			"die" : [Register_table.handlers["die"]],
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
			"spinable" : true,
			"maxhealth" : 100.0,
			"health" : 100.0,
			"UI_instance_path" : "res://tscns/objs/monster/butterfly.tscn"
		},
		
		{
			"type" : "monster",
			"attack" : 10.0,

			"hurt_time" : 0.2,
			"invincible_time" : 0.2,
			"abandon_dist" : 2000.0,
			
			"butterfly_round_time" : 1.0,
			"butterfly_round_dist" : 200,
			"butterfly_dash_speed" : 1400.0,
			"rotation_speed" : 2.0 * PI,
			"butterfly_round_speed" : 2000.0,
			"die_call" : ["maggot"],
			
			"take_damage" : [Register_table.handlers["take_damage"]],
			"die" : [Register_table.handlers["die_call"]],
			 
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
	
	# loong

	Register_table.register_obj_data(
		"loong",
		
		{
			"texture" : "res://images/monster/loong.png",
		},
		
		{
			"spinable" : true,
			"maxhealth" : 100.0,
			"health" : 100.0,
			"UI_instance_path" : "res://tscns/objs/monster/loong.tscn"
		},
		
		{
			#"box" : 10.0,
			#"mass" : 8.0,

			"type" : "monster",
			"boss" : true,
			"loong" : true,
			"attack" : 10.0,

			"hurt_time" : 0.2,
			"invincible_time" : 0.2,
			
			"follow_AI_cool_time" : 0.0,
			#"follow_AI_miss_rate" : 0.0,
			"power" : 1200.0,
			"resist" : 0.9,
			#"abandon_dist" : 2000.0,
			#"suicide_damage" : 20.0,
			
			"take_damage" : [Register_table.handlers["take_damage"]],
			"die" : [Register_table.handlers["die"]],
			"monster_init" : [Register_table.handlers["loong_init"]],
		},
		
		[
			"follow",
			"maggot",
			#"abandon",
			"loong",
			"modulate_hurt",
			#"suicide",
		],
		
		[
			"once",
			#"box",
			"rider",
		],
	)
	
	print("monster function static init done")
