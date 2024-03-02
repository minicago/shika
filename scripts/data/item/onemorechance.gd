extends Node
static func _static_init():
	Register_table.item_data["onemorechance"]={

		"export_dic":{
			"texture" : "res://images/item/onemorechance.png",
			"descript" : "onemorechance_descript",
		},

		"self_dic":{
			"texture" : "res://images/item/onemorechance.png",
			"bullet_num" : 8,
			"bullet_speed" : 500,
			"bullet_damage" : {
				"ignore_invincible" : true,
				"damage" : 1000,
			},
			"cool_time" : 99999,
			"reborn_rate" : 0.5,
			"reborn_handler" : ["cool_boot", "shoot_bullet"],
			"go_die_handler" : ["reborn_boot"],
		
		"process":[
			"show_cool",
		],
		}
	}
	
	
