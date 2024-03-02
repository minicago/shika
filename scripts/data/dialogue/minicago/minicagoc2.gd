extends Node
static func _static_init():
	Register_table.dialogue_data["minicagoc2"] = {
		"text" : "minicagoc2",
		"tag" : [
			"minicago4",
		],
		"button" : [
			{
				"text" : "send",
				"next" : "minicagoc2_1",
			},
			{
				"text" : "goodbye",
			}
		],
	}


	