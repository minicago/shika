extends Node
class_name NPC_info

static func _static_init():
	Register_table.NPC_data["minicago"] = {
		"texture" : "res://images/NPC/minicago.png",
		"dialogue" : [
			"minicago0",
			"minicago1",
			"minicago2",
			"minicago3",
			"minicago4",
		],
	}

	Register_table.NPC_data["shopkeeper"] = {
		"texture" : "res://images/NPC/shopkeeper.png",
		"dialogue" : [
			"shopkeeper0",
			"shopkeeper1",
		],
	}

	Register_table.NPC_data["guppy"] = {
		"texture" : "res://images/NPC/guppy.png",
		"dialogue" : [
			
		],
	}

	Register_table.NPC_data["shoot_master"] = {
		"texture" : "res://images/NPC/shoot_master.png",
		"dialogue" : [
			
		],
	}
