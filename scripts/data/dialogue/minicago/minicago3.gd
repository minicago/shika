extends Node
static func _static_init():
	Register_table.dialogue_data["minicago3"] = {
		"text" : "minicago3",
		"no_tag" : [
			"minicago3",
			],
		"brave" : 30,
		"button" : [
			{
				"text" : "send",
				"next" : "minicago3_1",
			},
			{
				"text" : "goodbye",
			}
		],
	}


	