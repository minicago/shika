extends Node
class_name Obj_function

var lowlevel : Obj

var spinable = false
var health = 0.0
var maxhealth = 0.0
var toward : Vector2 = Vector2(0,-1.0)
var position : Vector2
var addon_info : Dictionary
var global_polygon:PackedVector2Array = PackedVector2Array()
var banlist : Dictionary
var bump_handler_dic : Dictionary = {}
var speed : Vector2 = Vector2.ZERO
var AI_dic : Dictionary = {}
#var life_time : float = 0.0 
var timers : Dictionary = {}
var modulate : Color = Color(1.0,1.0,1.0)
var UI_instance_path

func call_handler(name, value):
	if get_addon_info(name, null) != null:
		get_addon_info(name).call(self,value)

func kill():
	lowlevel.kill()

func get_func_modulate():
	return modulate

func get_father():
	return lowlevel.get_father()

func get_speed():
	return speed
	
func get_real_speed():
	return speed.rotated(-toward.angle()) 
	
func set_speed(_speed):
	speed = _speed
	
func set_real_speed(_speed):
	speed = _speed.rotated(toward.angle())

func get_toward():
	if spinable : 
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
	
func get_addon_info_dic():
	return addon_info

func get_polygon():
	return lowlevel.get_polygon()

func function_process(delta):
	for timer in timers:
		timers[timer] = max(0, timers[timer] - delta)
	for function in AI_dic:
		AI_dic[function].call(self, delta)
	set_obj_position(position + toward * speed.x * delta + toward.rotated(- PI / 2) * speed.y * delta)
	pass

func bump_handler(collider : Obj):
	for handler in bump_handler_dic :
		#print(handler)
		bump_handler_dic[handler].call(self, collider)

func load_normal(_dic):
	spinable = _dic.get("spinable", false)
	maxhealth = _dic.get("maxhealth", 0.0)
	health = _dic.get("health", 0.0)
	UI_instance_path = _dic.get("UI_instance_path", "res://tscns/objs/default.tscn")

func load_addon(_dic):
	addon_info = _dic.duplicate()
	
func load_AI(_dic):
	AI_dic = _dic.duplicate()
	
func load_bump_handler(_dic):
	bump_handler_dic = _dic.duplicate()
	
func load_obj_data(name):
	load_normal(Register_table.obj_data[name]["normal_dic"])
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

func UI_instance() -> Obj_UI:
	var tscn=load(UI_instance_path)
	return tscn.instantiate()
