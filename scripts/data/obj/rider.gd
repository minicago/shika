extends Node
class_name Rider_info

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
			
			"shoot_cool" : 8,
			"bullet_num" : 1,
			"bullet" : "laser",
			"shoot" : ["shoot_around"],
			"bullet_damage" : {"damage" : 10.0, "ignore_invincible" : true},
		
			"process":[
				"rider_AI",
				"modulate_invincible",
				"modulate_hurt",
				"shoot",
			],
			"bump_handler":[
				"box",
				"home",
				"monster",
			],
		}
	}
	
	print("rider function static init done")
