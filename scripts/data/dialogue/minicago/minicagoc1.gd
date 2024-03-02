extends Node
static func _static_init():
	Register_table.dialogue_data["minicagoc1"] = {
		"text" : "minicagoc1",
		"tag" : [
			"minicago4",
		],
		"button" : [
			{
				"text" : "send",
				"next" : "minicagoc1_1",
			},
			{
				"text" : "goodbye",
			}
		],
	}


	