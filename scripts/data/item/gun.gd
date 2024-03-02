extends Node
static func _static_init():
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
			"displaystr" : "{package_item__ammo__gun}", 
		
			"cool_handler" : ["shoot_ammo"],
			"action_handler" : ["cool_boot"],
			
			"process":[
				"action_boot",
				"show_info",
			],
		}
	}
	