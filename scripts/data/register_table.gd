extends Object
class_name Register_table

static var control:GameControl = preload("res://tscns/control.tscn").instantiate()

static var handlers:Dictionary={}

static var obj_data : Dictionary = {}

static var world_info_dic : Dictionary = {}

static var item_data : Dictionary = {}

static var dialogue_data : Dictionary = {}

static var NPC_data : Dictionary = {}

static var map : Dictionary = {}

static func equip_item(Num : int , dic : Dictionary , item_dic : Dictionary):
	for key in item_dic.get("AI_dic", {}):
		dic["AI_dic"][str(Num) + key] = item_dic["AI_dic"][key]
	for key in item_dic.get("self_dic",{}):
		dic["addon_dic"][str(Num) + key] = item_dic["self_dic"][key]
	for key in item_dic.get("addon_dic", {}):
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
	var prob = randf_range(0 , maxprob)
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
