extends Node
static func _static_init():
	Register_table.item_data["loong_heart"]={

		"export_dic":{
			"texture" : "res://images/item/loong_heart.png",
			"descript" : "loong_heart_descript",
		},

		"self_dic":{
			"texture" : "res://images/item/loong_heart.png",
			"self_heal" : {
				"damage" : -10,
			},
			"self_damage" : {
				"damage" : 10,
				"ignore_invincible" : true,
				"ignore_ammor" : INF,
			},
			"exact_time" : 4.0,
			"penalty_time" : 0.3,
			"tick_reward" : ["take_self_heal"],
			"tick_penalty" : ["take_self_damage"],
		
		"process":[
			"tick_boot",
		],
		}
	}