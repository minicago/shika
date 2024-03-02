extends Node
static func _static_init():
	Register_table.dialogue_data["shopkeeper1"] = {
		"text" : "shopkeeper1",
		"tag" : [
			"gun",
			"shopkeeper0",
		],
		"button" : [
			{
				"text" : "buy_gun_ammo",
				"type" : "buy",
				"cost" : 5,
				"reward_ammo" : {
					"gun" : 100,
				},
				"reward_brave" : 1,
				"fail" : "shopkeeper_lose",
				"next" : "shopkeeper1",
			},
			{
				"text" : "goodbye",
			}
		],
	}
