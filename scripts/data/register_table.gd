extends Object
class_name Register_table

static var handlers:Dictionary={}

static var obj_type:Dictionary={}

static var AI:Dictionary={}

static var obj_data : Dictionary = {}

static var world_info_dic : Dictionary = {}

static var item_data : Dictionary = {}

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

static func register_item_data(
	name,
	self_dic,
	addon_dic,
	AI_list,
):
	item_data[name] = {
		"self_dic":self_dic,
		"addon_dic":addon_dic,
		"AI_dic":{},
	}
	for _AI in AI_list:
		item_data[name]["AI_dic"][_AI] = AI[_AI]


static func equip_item(Num : int , dic : Dictionary , item_dic : Dictionary):
	for key in item_dic["AI_dic"]:
		dic["AI_dic"][str(Num) + key] = item_dic["AI_dic"][key]
	for key in item_dic["self_dic"]:
		dic["addon_dic"][str(Num) + key] = item_dic["self_dic"][key]
	for key in item_dic["addon_dic"]:
		dic["addon_info"][key] = dic["addon_dic"].get(key, 0.0) +  item_dic["addon_dic"][key]
	pass

