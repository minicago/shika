extends Object
class_name Register_table

static var handlers:Dictionary={}

static var obj_type:Dictionary={}

static var AI:Dictionary={}

static var obj_data : Dictionary = {}

static var world_info_dic : Dictionary = {}

static func register_obj_data(
	name,
	normal_dic,
	addon_dic,
	AI_list,
	bump_handler_list
):
	obj_data[name] = {
		"normal_dic":normal_dic,
		"addon_dic":addon_dic,
		"AI_dic":{},
		"bump_handler_dic":{},
	}

	for _AI in AI_list:
		obj_data[name]["AI_dic"][_AI] = AI[_AI]

	for _bump_handler in bump_handler_list:
		obj_data[name]["bump_handler_dic"][_bump_handler] = handlers[_bump_handler]


