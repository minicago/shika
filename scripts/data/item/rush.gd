extends Node
static func _static_init():
	Register_table.item_data["rush"]={

		"export_dic":{
			"texture" : "res://images/item/rush.png",
			"descript" : "rush_descript",
		},

		"self_dic":{
			"texture" : "res://images/item/rush.png",
			"cool_time" : 5.0,
			"rush_power" : 400.0,
		
			"cool_handler" : ["rush"],
			"action_handler" : ["cool_boot"],
		
			"process":[
				"just_action_boot",
				"show_cool",
			],
		}
	}
