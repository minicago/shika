extends Node
class_name Userdata

static var common_data:Dictionary = {}
static var package_item:Dictionary = {}
static var riders:Dictionary = {}

static func load_dic(dic, num):
	var list:Array = dic.keys()
	return list[num]
	
static func load_file(path, data , default = {}):
	var file = FileAccess.open(path , FileAccess.READ)
	var tmpdata 
	if file == null : 
		tmpdata = default
	else:
		var json_string = file.get_line()
		var json = JSON.new()
		json.parse(json_string)
		tmpdata = json.get_data()
		
	for key in tmpdata:
		data[key] = tmpdata[key]
	#print(data)
	#print(common_data.get("level"))
	
static func save_file(path, data):
	var file = FileAccess.open(path , FileAccess.WRITE)
	file.store_line( JSON.stringify(data) )
	
static func all_save():
	print("save")
	save_file("user://package_item.txt", package_item)
	save_file("user://common_data.txt", common_data)
	save_file("user://riders.txt", riders)

static func all_load():
	print("load")
	load_file("user://package_item.txt", package_item, {"package":[{"name" : "rush"}, {"name" : "blink"},]})
	load_file("user://common_data.txt", common_data)
	load_file("user://riders.txt", riders, {"riders":[{"name" : "rider"},]})
