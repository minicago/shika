extends Node
static func _static_init():
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