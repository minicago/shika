extends Node
class_name Rider_info

static func _static_init():
	Register_table.register_obj_data(
		"glassy",

		{
			"texture" : "res://images/bike/glassy.png",
			"descript" : "glassy_descript",
		},
		
		{
			"UI_instance_path" : "res://tscns/objs/rider/glassy.tscn",
			"spinable" : true,
			"maxhealth" : 100.0,
			"health" : 100.0,
			"box" : 10.0,
			"mass" : 100.0,

			"type" : "rider",
			"bump_damage" : {"damage" : 30.0},

			"resist" : 0.9,
			"lineResist" : 50.0,
			"rtimes" : 20.0,
			"brake" : 1000.0,
			"power" : 1000.0,

			"spinRate" : 0.5 * PI,
			"spinLoss" : 0.6,

			"hurt_time" : 0.2,
			"invincible_time" : 0.2,
			
			"take_damage" : ["take_damage"],
			"die" : ["die"],
		},
		
		[
			"rider",
			"modulate_invincible",
			"modulate_hurt",
		],
		
		[
			"box",
			"home",
			"monster",
		],
	)
	
	print("rider function static init done")
