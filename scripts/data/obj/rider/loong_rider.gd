extends Node
static func _static_init():
	Register_table.obj_data["loong_rider"] = {
		"export_dic":{
			"texture" : "res://images/bike/loong_rider.png",
			"descript" : "loong_rider_descript",
		},
		
		"addon_dic":{
			"UI_instance_path" : "res://tscns/objs/rider/loong_rider.tscn",
			"spinable" : true,
			"maxhealth" : 180.0,
			"health" : 180.0,
			"box" : 10.0,
			"mass" : 120.0,

			"type" : "rider",
			"bump_damage" : {"damage" : 40.0},

			"resist" : 0.89,
			"lineResist" : 48.0,
			"rtimes" : 20.0,
			"brake" : 900.0,
			"power" : 1200.0,

			"spinRate" : 0.5 * PI,
			"spinLoss" : 0.6,

			"invincible_time" : 0.2,
			
			
			"take_damage" : ["take_damage"],
			"die" : ["die"],
			

		
			"process":[
				"rider_AI",
				"modulate_invincible",
				"modulate_hurt",
				
			],
			"0cool_time" : 8,
			"0bullet_num" : 1,
			"0bullet" : "laser",
			"0cool_handler" : ["shoot_bullet"],
			"0bullet_damage" : {"damage" : 10.0, "ignore_invincible" : true},			
			"0process":["cool_boot",],
			
			"bump_handler":[
				"box",
				"home",
				"monster",
			],
		}
	}
