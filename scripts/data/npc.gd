extends Node
class_name NPC_info

static func _static_init():
	Register_table.NPC_data["minicago"] = {
		"texture" : "res://images/NPC/minicago.png",
		"dialogue" : [
			"help",
		],
	}
