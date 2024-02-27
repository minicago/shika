extends Node
class_name Dialogue_info

static func _static_init():

#minicago

	Register_table.dialogue_data["minicago_lose"] = {
		"text" : "minicago_lose",
		"button" : [
			{
				"text" : "ok",
			}
		],
	}

	Register_table.dialogue_data["minicago0"] = {
		"text" : "minicago0",
		"no_tag" : [
			"minicago0",
			],
		"button" : [
			{
				"text" : "ok",
				"next" : "minicago0_1"
			}
		],
	}

	Register_table.dialogue_data["minicago0_1"] = {
		"text" : "minicago0_1",
		"button" : [
			{
				"text" : "ok",
				"type" : "game",
				"world_name" : "minicago0",
				"reward_tag" : [
					"minicago0",
				],
				"reward_item" : [
					"blink",
				],
				"reward_fate" : 10,
				"reward_brave" : 10,
				"fail" : "minicago_lose",
				"next" : "minicago0_2",
			}
		],
	}

	Register_table.dialogue_data["minicago0_2"] = {
		"text" : "minicago0_2",
		"button" : [
			{
				"text" : "thanks",
			}
		],
	}

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


	Register_table.dialogue_data["minicago1_1"] = {
		"text" : "minicago1_1",
		"button" : [
			{
				"text" : "ok",
				"type" : "game",
				"world_name" : "minicago1",
				"reward_fate" : 10,
				"reward_brave" : 10,
				"reward_tag" : [
					"minicago1",
				],
				"reward_item" : [
					"rush",
				],
				"fail" : "minicago_lose",
				"next" : "minicago1_2",
			}
		],
	}

	Register_table.dialogue_data["minicago1_2"] = {
		"text" : "minicago1_2",
		"button" : [
			{
				"text" : "thanks",
			}
		],
	}

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
				"fail" : "minicago_lose",
				"next" : "minicago2_2",
			},
		],
	}

	Register_table.dialogue_data["minicago2_2"] = {
		"text" : "minicago2_2",
		"button" : [
			{
				"text" : "thanks",
			}
		],
	}

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


	Register_table.dialogue_data["minicago3_1"] = {
		"text" : "minicago3_1",
		"button" : [
			{
				"text" : "ok",
				"type" : "game",
				"world_name" : "minicago3",
				"reward_fate" : 10,
				"reward_brave" : 10,
				"reward_tag" : [
					"minicago3",
				],
				"reward_item" : [
					"radiance",
				],
				"fail" : "minicago_lose",
				"next" : "minicago3_2",
			}
		],
	}

	Register_table.dialogue_data["minicago3_2"] = {
		"text" : "minicago3_2",
		"button" : [
			{
				"text" : "thanks",
			}
		],
	}

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
					"thanks",
				],
				"fail" : "minicago_lose",
				"next" : "minicago4_2",
			}
		],
	}

	Register_table.dialogue_data["minicago4_2"] = {
		"text" : "minicago4_2",
		"button" : [
			{
				"text" : "thanks",
			}
		],
	}

#shopkeeper

	Register_table.dialogue_data["shopkeeper_lose"] = {
		"text" : "shopkeeper_lose",
		"button" : [
			{
				"text" : "ok",
			}
		],
	}

	Register_table.dialogue_data["shopkeeper0"] = {
		"text" : "shopkeeper0",
		"no_tag" : [
			"shopkeeper0",
		],
		"button" : [
			{
				"text" : "ok",
				"reward_tag" : [
					"shopkeeper0",
				],
			}
		],
	}

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
