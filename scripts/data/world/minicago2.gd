extends Node
static func _static_init():
	Register_table.world_info_dic["minicago2"]={
		"max_monsters" : 200,
		"monster_frequence" : 0.4,
		"home_position" : Vector2(25000.0, 0),
		"init_monster" : [
		],
		"monster_probility" :{
			"tank" : 1,
			"rushing_car" : 2,
		},
		
	}

	