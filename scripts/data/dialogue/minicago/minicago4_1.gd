extends Node
static func _static_init():
	Register_table.dialogue_data["minicago4_1"] = {
		"text" : "minicago4_1",
		"button" : [
			{
				"text" : "ok",
				"type" : "game",
				"world_name" : "minicago4",
				"reward_fate" : 10,
				"reward_brave" : 10,
				"reward_tag" : [
					"minicago4",
				],
				"reward_item" : [
					"loong_heart",
				],
				"fail" : "minicago_lose",
				"next" : "minicago4_2",
			}
		],
	}

	