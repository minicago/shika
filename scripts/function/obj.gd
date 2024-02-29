extends Node
class_name Obj_function

var lowlevel : Obj

var spinable = false
#var health = 0.0
#var maxhealth = 0.0
var toward : Vector2 = Vector2(0,-1.0)
var position : Vector2
var addon_info : Dictionary
var global_polygon:PackedVector2Array = PackedVector2Array()
var banlist : Dictionary
#var bump_handler_dic : Dictionary = {}
var speed : Vector2 = Vector2.ZERO
var AI_dic : Dictionary = {}
#var life_time : float = 0.0 
var timers : Dictionary = {}
var modulate : Color = Color(1.0,1.0,1.0)
var item_name = ""

func call_handler(name, value):
	var tmp = item_name
	item_name = ""
	if get_item_info(name, null) != null:
		for handler in get_item_info(name, null):
			Register_table.handlers[handler].call(self,value)
	for i in range(1,7) :
		item_name = str(i)
		if get_item_info(name, null) != null:
			for handler in get_item_info(name, null):
				Register_table.handlers[handler].call(self,value)
	item_name = tmp

func kill():
	lowlevel.kill()

func get_func_modulate():
	return modulate

func get_father():
	return lowlevel.get_father()

func get_speed():
	return speed
	
func get_real_speed():
	return speed.rotated(toward.angle()) 
	
func set_speed(_speed):
	speed = _speed
	
func set_real_speed(_speed, _spin = false):
	if _spin :
		toward = _speed.normalized()
		speed = Vector2(_speed , 0)
	else :
		speed = _speed.rotated(- toward.angle())

func get_toward():
	if get_addon_info("spinable", false) : 
		return toward
	else :
		return Vector2(0,-1.0)

func get_obj_position():
	return position
	
func set_obj_position(pos):
	position = pos
	refresh_polygon_in_world()

func get_addon_info(key, default = null):
	return addon_info.get(key, default)
	
func get_item_info(key, default = null):
	return addon_info.get(item_name + key, default)
	
func get_addon_info_dic():
	return addon_info

func get_polygon():
	return lowlevel.get_polygon()

func function_process(delta):
	for timer in timers:
		timers[timer] = max(0, timers[timer] - delta)
	for function in AI_dic:
		item_name = function[0]
		if item_name < "1" or item_name > "6" : item_name = ""
		AI_dic[function].call(self, delta)
	item_name = ""
	if toward.length() > 0.5 :
		set_obj_position(position + speed.rotated(toward.angle()) * delta)
	pass

func load_addon(_dic):
	addon_info = _dic.duplicate()
	
func load_AI(_dic):
	AI_dic = _dic.duplicate()
	
func load_bump_handler(_dic):
	addon_info["bump_handler"] = _dic.duplicate()
	
func load_obj_data(name):
	#load_normal(Register_table.obj_data[name]["normal_dic"])
	load_addon(Register_table.obj_data[name]["addon_dic"])
	load_AI(Register_table.obj_data[name]["AI_dic"])
	load_bump_handler(Register_table.obj_data[name]["bump_handler_dic"])

########################################################################
# bump
########################################################################

# bump_polygon:

func refresh_polygon_in_world():
	global_polygon = Transform2D(0,get_obj_position()) * get_polygon()
		
func get_polygon_in_world():
	return global_polygon

# bump_handler:

func allow_bump(collider : Obj):
	return not banlist.get(collider, false) and get_addon_info("ban_group", []).find(collider.get_addon_info("type")) == -1 
	
########################################################################
# timer
########################################################################
	
func timer_set(key, value):
	timers[key] = value
	
func timer_get(key, value = 0.0):
	return timers.get(key , value)
	
func addon_info_append(key, value):
	addon_info[key] = value
	
func item_info_append(key, value):
	addon_info[item_name + key] = value

func UI_instance() -> Obj_UI:
	var tscn=load(get_addon_info("UI_instance_path"))
	return tscn.instantiate()
	
func spin(angle : float):
	toward = toward.rotated(angle)
	speed = speed.rotated(angle) * get_addon_info("spinLoss", 0.0) + speed * (1 - get_addon_info("spinLoss", 0.0))

