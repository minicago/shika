extends Node
static func _static_init():
	Register_table.dialogue_data["minicago1"] = {
		"text" : "minicago1",
		"no_tag" : [
			"minicago1",
			],
		"brave" : 10,
		"button" : [
			{
				"text" : "send",
				"next" : "minicago1_1",
			},
			{
				"text" : "goodbye",
			}
		],
	}


	