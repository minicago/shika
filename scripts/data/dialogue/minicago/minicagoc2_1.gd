extends Node
static func _static_init():
	Register_table.dialogue_data["minicagoc2_1"] = {
		"text" : "minicagoc2_1",
		"button" : [
			{
				"text" : "ok",
				"type" : "game",
				"world_name" : "minicagoc2",
				"reward_fate" : 20,
				"reward_brave" : 5,
				"reward_tag" : [
					"minicagoc2",
				],

				"fail" : "minicago_lose",
				"next" : "minicagoc2_2",
			}
		],
	}

	