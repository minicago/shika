extends Node
static func _static_init():
	Register_table.dialogue_data["minicago2"] = {
		"text" : "minicago2",
		"no_tag" : [
			"minicago2",
			],
		"brave" : 20,
		"button" : [
			{
				"text" : "send",
				"next" : "minicago2_1",
			},
			{
				"text" : "goodbye",
			}
		],
	}


	