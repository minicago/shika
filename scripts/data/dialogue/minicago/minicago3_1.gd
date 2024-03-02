extends Node
static func _static_init():
	Register_table.dialogue_data["minicago3_1"] = {
		"text" : "minicago3_1",
		"button" : [
			{
				"text" : "ok",
				"type" : "game",
				"world_name" : "minicago3",
				"reward_fate" : 10,
				"reward_brave" : 10,
				"reward_tag" : [
					"minicago3",
				],
				"reward_item" : [
					"radiance",
				],

				"fail" : "minicago_lose",
				"next" : "minicago3_2",
			}
		],
	}

	