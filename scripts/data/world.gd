extends Node
class_name World_info

static func _static_init():
	Register_table.world_info_dic["level1"]={
		"max_monsters" : 10,
		"monster_frequence" : 0.3,
		"home_dist" : 10000,
		"init_monster" : [
 
		],
		"monster_probility" :{
			"maggot" : 1,
		},
		
	}

	Register_table.world_info_dic["level2"]={
		"max_monsters" : 15,
		"monster_frequence" : 0.3,
		"home_dist" : 20000,
		"init_monster" : [

		],
		"monster_probility" :{
			"spider" : 1,
		},
		
	}

	Register_table.world_info_dic["level3"]={
		"max_monsters" : 20,
		"monster_frequence" : 0.3,
		"home_dist" : 30000,
		"init_monster" : [

		],
		"monster_probility" :{
			"spider" : 1,
			"maggot" : 1,
		},
		
	}

	Register_table.world_info_dic["level4"]={
		"max_monsters" : 15,
		"monster_frequence" : 0.3,
		"home_dist" : 30000,
		"init_monster" : [

		],
		"monster_probility" :{
			"maggot" : 3,
			"butterfly" : 1,
		},
		
	}
	
	Register_table.world_info_dic["level5"]={
		"max_monsters" : 1,
		"monster_frequence" : 100.0,
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
		],
		"monster_probility" :{
			"maggot" : 1,
		},
		
	}
