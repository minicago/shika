extends Node
class_name Obj

var father : World
var function : Obj_function
var UI : Obj_UI
var alive = true
var timestamp

func call_handler(name, value):
	function.call_handler(name, value)

func kill():
	if get_addon_info("type", "monster") : father.world_info_append( "monster_num", father.get_world_info("monster_num", 0 ) - 1 )
	alive = false

func get_father():
	return father

func get_speed():
	return function.get_speed()
	
func get_real_speed():
	return function.get_real_speed()
	
func set_speed(_speed):
	function.set_speed(_speed)

func set_real_speed(_speed, _spin = false):
	function.set_real_speed(_speed , _spin)

func get_func_modulate():
	return function.get_func_modulate()

func get_toward() -> Vector2:
	return function.get_toward()

func get_obj_position() -> Vector2:
	return function.get_obj_position()

func set_obj_position(pos : Vector2):
	function.set_obj_position(pos)

func get_addon_info(key, default = null):
	return function.get_addon_info(key, default)

func timer_get(key, default = 0.0):
	return function.timer_get(key, default)
	
func timer_set(key, default):
	return function.timer_set(key, default)

func get_addon_info_dic():
	return function.get_addon_info_dic()

func get_polygon() -> PackedVector2Array:
	return UI.get_polygon()

func get_polygon_in_world() -> PackedVector2Array:
	return function.get_polygon_in_world()

func bump_handler(collider : Obj):
	return function.bump_handler(collider) 

func addon_info_append(key, value):
	function.addon_info_append(key, value)

func function_process(delta):
	return function.function_process(delta)

func obj_init(func_type : String ,binder : Obj_UI = null , father = null):
	self.father = father
	function = Obj_function.new()
	function.lowlevel = self
	function.load_obj_data(func_type)
	if binder == null :
		UI = function.UI_instance()
		UI.set_position(Vector2(-INF, -INF))
		if father != null : father.UI.add_child(UI)
	else : 
		UI = binder
	timestamp = father.timestamp
	father.timestamp += 1
	UI.lowlevel = self

func allow_bump(collider : Obj):
	return function.allow_bump(collider)

func all_free():
	queue_free()
	UI.queue_free()
	function.queue_free()
