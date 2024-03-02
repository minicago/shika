extends Node
static func _static_init():
	Register_table.item_data["radiance"]={

		"export_dic":{
			"texture" : "res://images/item/radiance.png",
			"descript" : "radiance_descript",
		},

		"self_dic":{
			"texture" : "res://images/item/radiance.png",
			"damage" : {"damage" : 5.0, "ignore_invincible" :true , "ignore_ammor" : INF},
			"show_cool": false,
			"displaystr" : "{item__damage__damage}",
			
			"cool_handler" : ["burning"],
			
			"process":[
				"cool_boot",
				"show_info",
			],
		}
	}