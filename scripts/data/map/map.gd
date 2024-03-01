extends Node
class_name Map_info

static func _static_init():
	Register_table.map["school_gate"] = {
		"texture" : "res://images/background/school_gate.png",
		"location" : Vector2(0,0),
		"NPC_list" :[
			"minicago",
		],
	}

	Register_table.map["shoot_place"] = {
		"texture" : "res://images/background/shoot_place.png",
		"location" : Vector2(800,400),
		"NPC_list" :[
			"shopkeeper",
			"shoot_master",
		],
	}
