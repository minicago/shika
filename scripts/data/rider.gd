extends Node
class_name Rider_info

static func _static_init():
	Register_table.register_obj_data(
		"rider",
		
		{
			"spinable" : true,
			"maxhealth" : 100.0,
			"health" : 100.0,
			"UI_instance_path" : "res://tscns/objs/rider/glassy.tscn"
		},
		
		{
			"box" : 10.0,
			"mass" : 100.0,

			"type" : "rider",
			"attack" : 50.0,

			"resist" : 0.9,
			"lineResist" : 50.0,
			"rtimes" : 20.0,
			"brake" : 1000.0,
			"power" : 1000.0,

			"spinRate" : PI,
			"spinLoss" : 0.6,

			"hurt_time" : 0.2,
			"invincible_time" : 0.2,
			
			"take_damage" : [Register_table.handlers["take_damage"]],
			"die" : [Register_table.handlers["die"]],
		},
		
		[
			"rider",
			"modulate_invincible",
			"modulate_hurt",
		],
		
		[
			"once",
			"box",
			"home",
			"monster",
		],
	)
	
	print("rider function static init done")
