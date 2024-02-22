extends Node
class_name Dialogue_info

static func _static_init():
	Register_table.dialogue_data["help"] = {
		"text" : "help",
		"no_tag" : [
			"helped_tag",
			],
		"button" : [
			{
				"text" : "ok",
				"type" : "game",
				"world_name" : "level1",
				"reward_tag" : [
					"helped_tag",
					]
			}
		],
	}
