extends Node
class_name Userdata

static var common_data:Dictionary = {}
static var package_item:Dictionary = {}
static var riders:Dictionary = {}
static var NPC:Dictionary = {}
static var version:Dictionary = {}
static var map:Dictionary = {}

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
	
	data.clear()

	for key in tmpdata:
		data[key] = tmpdata[key]
	
static func save_file(path, data):
	var file = FileAccess.open(path , FileAccess.WRITE)
	file.store_line( JSON.stringify(data) )
	
static func all_save():
	print("save")
	save_file("user://version.txt", version)
	save_file("user://package_item.txt", package_item)
	save_file("user://common_data.txt", common_data)
	save_file("user://riders.txt", riders)
	save_file("user://NPC.txt", NPC)
	save_file("user://map.txt", map)

static func reset_file():
	version["version"] = 1
	load_file("user://null", package_item, {"package":[], "ammo":{}})
	load_file("user://null", common_data, {"fate" : 0, "position" : "school_gate"})
	load_file("user://null", riders, {"riders":[{"name" : "glassy"}, ], "picked":0})
	load_file("user://null", NPC, {"minicago" : {"brave" : 0, "weight" : 1},})
	load_file("user://null", map, {"school_gate" : true})

static func all_load():
	print("load")
	load_file("user://version.txt", version, {"version" : 0})
	if version.get("version",0) < 1:
		reset_file()
	else :
		
		load_file("user://package_item.txt", package_item)
		load_file("user://common_data.txt", common_data)
		load_file("user://riders.txt", riders)
		load_file("user://NPC.txt", NPC)
		load_file("user://map.txt", map)
