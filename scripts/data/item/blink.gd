extends Node
static func _static_init():
	Register_table.item_data["blink"]={

		"export_dic":{
			"texture" : "res://images/item/blink.png",
			"descript" : "blink_descript",
		},

		"self_dic":{
			"texture" : "res://images/item/blink.png",
			"cool_time" : 10.0,
			"blink_dist" : 500.0,

			"cool_handler" : ["blink"],
			"action_handler" : ["cool_boot"],
		
			"process":[
				"just_action_boot",
				"show_cool",
			],
		}
	}
	