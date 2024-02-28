extends Object
class_name Register_table

static var control:GameControl = preload("res://tscns/control.tscn").instantiate()

static var handlers:Dictionary={}

static var AI:Dictionary={}

static var obj_data : Dictionary = {}

static var world_info_dic : Dictionary = {}

static var item_data : Dictionary = {}

static var dialogue_data : Dictionary = {}

static var NPC_data : Dictionary = {}

static var map : Dictionary = {}

static func register_obj_data(
	name,
	export_dic,
	#normal_dic,
	addon_dic,
	AI_list,
	bump_handler_list
):
	obj_data[name] = {
		"export_dic":export_dic,
		#"normal_dic":normal_dic,
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
	export_dic,
	self_dic,
	addon_dic,
	AI_list,
):
	item_data[name] = {
		"export_dic":export_dic,
		"self_dic":self_dic,
		"addon_dic":addon_dic,
		"AI_dic":{},
	}
	for _AI in AI_list:
		item_data[name]["AI_dic"][_AI] = AI[_AI]


static func equip_item(Num : int , dic : Dictionary , item_dic : Dictionary):
	print(item_dic)
	for key in item_dic["AI_dic"]:
		dic["AI_dic"][str(Num) + key] = item_dic["AI_dic"][key]
	for key in item_dic["self_dic"]:
		dic["addon_dic"][str(Num) + key] = item_dic["self_dic"][key]
	for key in item_dic["addon_dic"]:
		var type = typeof(item_dic["addon_dic"][key])
		
		if type == TYPE_DICTIONARY :
			dic["addon_dic"][key] = dic["addon_dic"].get(key, {}) 
			dic["addon_dic"][key].merge( item_dic["addon_dic"][key] )
		elif type == TYPE_ARRAY:
			dic["addon_dic"][key] = dic["addon_dic"].get(key, []) 
			dic["addon_dic"][key].append_array( item_dic["addon_dic"][key] )
		else : dic["addon_dic"][key] = dic["addon_dic"].get(key, 0.0) +  item_dic["addon_dic"][key]
	pass

static func rand_from_dic(dic:Dictionary):
	var maxprob = 0
	for type in dic:
		maxprob += dic[type]
	var prob = randi_range(0 , maxprob - 1)
	for type in dic:
		if prob < dic[type]:
			return type
			break
		else :
			prob -= dic[type]

static func dic_format(str:String , dic:Dictionary , prefix = ""):
	#print (str , dic ,prefix)
	for key in dic :
		if typeof(key) != TYPE_STRING: continue
		if typeof(dic[key]) == TYPE_DICTIONARY:
			str = dic_format(str, dic[key] , prefix + key + "__")
		else :
			str = str.format({prefix + key : dic[key]})
	return str
