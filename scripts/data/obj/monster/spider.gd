extends Node
static func _static_init():
# spider	

	Register_table.obj_data["spider"] = {
		"export_dic":{
			"texture" : "res://images/monster/spider.png",
		},
		
		"addon_dic":{
			"UI_instance_path" : "res://tscns/objs/monster/spider.tscn",
			"spinable" : false,
			"maxhealth" : 100.0,
			"health" : 100.0,
			"box" : 10.0,
			"mass" : 8.0,

			"type" : "monster",
			"bump_damage" : {"damage" : 10.0},
			
			"spider_AI_cool_time" : 0.5,
			"follow_AI_cool_time" : 1.0,
			"follow_AI_miss_rate" : 0.5,
			"abandon_dist" : 2000.0,
			"AI_speed" : 1000.0,
			
			"take_damage" : ["take_damage"],
			"die" : ["die"],
		
			"process":[
				"follow",
				"spider",
				"abandon",
				"modulate_hurt",
			],
			"bump_handler":[
				"box",
				"rider",
			],
		}
	}