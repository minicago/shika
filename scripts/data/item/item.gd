extends Node
class_name Item_info

static func _static_init():
#blink
	Register_table.item_data["blink"]={

		"export_dic":{
			"texture" : "res://images/item/blink.png",
			"descript" : "blink_descript",
		},

		"self_dic":{
			"texture" : "res://images/item/blink.png",
			"cool_time" : 10.0,
			"blink_dist" : 500.0,

		"process":[
			"blink",
		],
		}
	}

#rush
	Register_table.item_data["rush"]={

		"export_dic":{
			"texture" : "res://images/item/rush.png",
			"descript" : "rush_descript",
		},

		"self_dic":{
			"texture" : "res://images/item/rush.png",
			"cool_time" : 5.0,
			"rush_power" : 400.0,
		
		"process":[
			"rush",
		],
		}
	}

#radiance
	Register_table.item_data["radiance"]={

		"export_dic":{
			"texture" : "res://images/item/radiance.png",
			"descript" : "radiance_descript",
		},

		"self_dic":{
			"texture" : "res://images/item/radiance.png",
			"damage" : {"damage" : 5.0, "ignore_invincible" :true , "ignore_ammor" : INF},
			"show_cool": false,
		
		"process":[
			"burning",
		],
		}
	}
	
#gun
	Register_table.item_data["gun"]={

		"export_dic":{
			"texture" : "res://images/item/gun.png",
			"descript" : "gun_descript",
		},

		"self_dic":{
			"texture" : "res://images/item/gun.png",
			"damage" : {"damage" : 10,  "ignore_invincible" : true, },
			"show_cool": false,
			"cool_time" : 0.1,
		
		"process":[
			"gun",
		],
		}
	}

#thanks
	Register_table.item_data["thanks"]={

		"export_dic":{
			"texture" : "res://images/item/thanks.png",
			"descript" : "thanks_descript",
		},

		"self_dic":{
			"texture" : "res://images/item/thanks.png",
		
		"process":[
			
		],
		}
	}

#gravity
	Register_table.item_data["gravity"]={

		"export_dic":{
			"texture" : "res://images/item/gravity.png",
			"descript" : "gravity_descript",
		},

		"self_dic":{
			"texture" : "res://images/item/gravity.png",
			"show_cool": false,
			"gravity" : 200.0,
		
		"process":[
			"gravity",
		],
		}
	}
	
#onemorechance
	Register_table.item_data["onemorechance"]={

		"export_dic":{
			"texture" : "res://images/item/onemorechance.png",
			"descript" : "onemorechance_descript",
		},

		"self_dic":{
			"texture" : "res://images/item/onemorechance.png",
			"show_cool": false,
			"bullet_num" : 8,
			"bullet_speed" : 500,
			"bullet_damage" : {
				"ignore_invincible" : true,
				"damage" : 1000,
			},
			"reborn_rate" : 0.5,
			"go_die_handler" : ["onemorechance"],
		
		"process":[
		],
		}
	}
	
#loong_heart
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
			"loong_heart_reward" : ["take_self_heal"],
			"loong_heart_penalty" : ["take_self_damage"],
		
		"process":[
			"loong_heart",
		],
		}
	}


	print("Item function static init done")
