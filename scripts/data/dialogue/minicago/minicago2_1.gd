extends Node
static func _static_init():
	Register_table.dialogue_data["minicago2_1"] = {
		"text" : "minicago2_1",
		"button" : [
			{
				"text" : "ok",
				"type" : "game",
				"world_name" : "minicago2",
				"reward_fate" : 10,
				"reward_brave" : 10,
				"reward_tag" : [
					"minicago2",
					"gun",
				],
				"reward_item" : [
					"gun",
				],
				"reward_ammo" : {
					"gun" : 200,
				},
				"reward_NPC" : [
					"shopkeeper",
				],
				"reward_place" : [
					"shoot_place",
				],
				"fail" : "minicago_lose",
				"next" : "minicago2_2",
			},
		],
	}

	