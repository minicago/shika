extends Node
class_name StaticBoot

	
static func infoboot():
	register_file("res://scripts/data/dialogue")
	register_file("res://scripts/data/item")
	register_file("res://scripts/data/map")
	register_file("res://scripts/data/npc")
	register_file("res://scripts/data/obj")
	register_file("res://scripts/data/world")
	Userdata.all_load()
	print("Info boot finished")
	
static func register_file(path) :
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if not dir.current_is_dir():
				print(path + '/' + file_name)
				print (load(path + '/' + file_name) )
			else : register_file(path + '/' + file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
			#load(filename)

static func load_json(dic ,path) :
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if not dir.current_is_dir():
				print(path + '/' + file_name)
				print (load(path + '/' + file_name) )
				dic[file_name.left(-5)] =  load(path + '/' + file_name).data
			else : load_json(dic, path + '/' + file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")

static func _static_init():
	load_json(Register_table.obj_data,"res://scripts/data/obj/monster/")
	print(Register_table.obj_data["spider"])
	register_file("res://scripts/data/AI")
	register_file("res://scripts/data/handler")
	register_file("res://scripts/data/mod")
	infoboot()
	
	
