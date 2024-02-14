extends Node
class_name Monster_function

static func _static_init():
	Register_table.register_obj_data(
		"monster",
		
		{
			"spinable" : false,
			"maxhealth" : 100.0,
			"health" : 100.0,
			"UI_instance_path" : "res://tscns/objs/monster/1.tscn"
		},
		
		{
			"box" : 10.0,
			"mass" : 8.0,

			"type" : "monster",
			"attack" : 10.0,

			"hurt_time" : 0.2,
			"invincible_time" : 0.0,
			
			"spider_AI_cool_time" : 0.5,
			"follow_AI_cool_time" : 1.0,
			"follow_AI_miss_rate" : 0.5,
			"abandon_dist" : 2000.0,
			
			"take_damage" : Register_table.handlers["take_damage"],
			"die" : Register_table.handlers["die"],
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
	print("monster function static init done")
