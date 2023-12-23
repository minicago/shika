extends Node
class_name Obj_function

var lowlevel : Obj

var toward : Vector2 = Vector2(0,-1.0)
var position : Vector2
var bump_info : Dictionary
signal bumped(info : Dictionary)
var global_polygon:PackedVector2Array = PackedVector2Array()
var banlist : Dictionary

func get_toward():
	return toward

func get_obj_position():
	return position
	
func set_obj_position(pos):
	position = pos
	refresh_polygon_in_world()

func get_bump_info():
	return bump_info

func get_polygon():
	return lowlevel.get_polygon()

func function_process(delta):
	pass

func bump_handler(info : Dictionary):
	if info.get("once",true):
		if not banlist.get(info.get("collider"), false):
			banlist[info.get("collider")] = true
		else : return

func get_bumped_signal():
	return bumped
	
func refresh_polygon_in_world():
	global_polygon = Transform2D(0,get_obj_position()) * get_polygon()
		
func get_polygon_in_world():
	return global_polygon
	
func bump_init():
	bump_info_append("collider", lowlevel)
	bumped.connect(bump_handler)

func bump_info_append(key , value):
	bump_info[key] = value

func allow_bump(collider : Obj):
	return not banlist.get(collider, false)
