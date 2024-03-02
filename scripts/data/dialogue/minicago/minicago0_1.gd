extends Node
static func _static_init():
	Register_table.dialogue_data["minicago0_1"] = {
		"text" : "minicago0_1",
		"button" : [
			{
				"text" : "ok",
				"type" : "game",
				"world_name" : "minicago0",
				"reward_tag" : [
					"minicago0",
				],
				"reward_item" : [
					"blink",
				],
				"reward_fate" : 10,
				"reward_brave" : 10,
				"fail" : "minicago_lose",
				"next" : "minicago0_2",
			}
		],
	}

	