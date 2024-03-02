extends Node
static func _static_init():
	Register_table.dialogue_data["minicago4"] = {
		"text" : "minicago4",
		"no_tag" : [
			"minicago4",
			],
		"brave" : 40,
		"button" : [
			{
				"text" : "send",
				"next" : "minicago4_1",
			},
			{
				"text" : "goodbye",
			}
		],
	}


	