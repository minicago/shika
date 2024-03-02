extends Node
static func _static_init():
	Register_table.dialogue_data["minicago1_1"] = {
		"text" : "minicago1_1",
		"button" : [
			{
				"text" : "ok",
				"type" : "game",
				"world_name" : "minicago1",
				"reward_fate" : 10,
				"reward_brave" : 10,
				"reward_tag" : [
					"minicago1",
				],
				"reward_item" : [
					"rush",
				],
				"fail" : "minicago_lose",
				"next" : "minicago1_2",
			}
		],
	}

	