extends Node
static func _static_init():
	Register_table.obj_data["glassy"] = {
		"export_dic" : {
			"texture" : "res://images/bike/glassy.png",
			"descript" : "glassy_descript",
		},
		"addon_dic": {
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
			"rtimes" : 10.0,
			"brake" : 1000.0,
			"power" : 1000.0,

			"spinRate" : 0.5 * PI,
			"spinLoss" : 0.6,

			"invincible_time" : 0.2,
			
			"take_damage" : ["take_damage"],
			"die" : ["die"],
		
			"process" : [
				"rider_AI",
				"modulate_invincible",
				"modulate_hurt",
			],
		
			"bump_handler" : [
				"box",
				"home",
				"monster",
			],
		}
	}
