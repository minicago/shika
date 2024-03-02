extends Node
static func _static_init():
	Register_table.dialogue_data["minicagoc1_1"] = {
		"text" : "minicagoc1_1",
		"button" : [
			{
				"text" : "ok",
				"type" : "game",
				"world_name" : "minicagoc1",
				"reward_fate" : 20,
				"reward_brave" : 5,
				"reward_tag" : [
					"minicagoc1",
				],

				"fail" : "minicago_lose",
				"next" : "minicagoc1_2",
			}
		],
	}

	