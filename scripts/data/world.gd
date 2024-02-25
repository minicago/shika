extends Node
class_name World_info

static func _static_init():
	Register_table.world_info_dic["minicago0"]={
		"max_monsters" : 100,
		"monster_frequence" : 0.3,
		"home_dist" : 10000,
		"init_monster" : [
 
		],
		"monster_probility" :{
			"rushing_car" : 1,
		},
		
	}

	Register_table.world_info_dic["minicago1"]={
		"max_monsters" : 150,
		"monster_frequence" : 0.3,
		"home_dist" : 20000,
		"init_monster" : [

		],
		"monster_probility" :{
			"rushing_car" : 1,
			"spinning_car" : 1,
		},
		
	}

	Register_table.world_info_dic["minicago2"]={
		"max_monsters" : 200,
		"monster_frequence" : 0.3,
		"home_dist" : 30000,
		"init_monster" : [

		],
		"monster_probility" :{
			"tank" : 1,
			"rushing_car" : 3,
		},
		
	}

	Register_table.world_info_dic["minicago3"]={
		"max_monsters" : 150,
		"monster_frequence" : 0.3,
		"home_dist" : 30000,
		"init_monster" : [

		],
		"monster_probility" :{
			"oil_car" : 1,
			"rushing_car" : 1,
		},
		
	}
	
	Register_table.world_info_dic["minicago4"]={
		"max_monsters" : 1,
		"monster_frequence" : INF,
		"home_dist" : 30000,
		"init_monster" : [
			"loong",
			"loong",
			"loong",
			"loong",
			"loong",
			"loong",
			"loong",
			"loong",
			"loong",
			"loong",
			"loong",
			"loong",
			"loong",
			"loong",
			"loong",
			"loong",
			"loong",
			"loong",
		],
		"monster_probility" :{
			"maggot" : 1,
		},
		
	}
