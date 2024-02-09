extends Node
class_name Obj

var father
var function : Obj_function
var UI : Obj_UI
var alive = true

func kill():
	alive = false

func get_father():
	return father

func get_speed():
	return function.get_speed()
	
func get_real_speed():
	return function.get_real_speed()
	
func set_speed(_speed):
	function.set_speed(_speed)

func set_real_speed(_speed):
	function.set_real_speed(_speed)

func get_func_modulate():
	return function.get_func_modulate()

func get_toward() -> Vector2:
	return function.get_toward()
	
func get_obj_position() -> Vector2:
	return function.get_obj_position()

func set_obj_position(pos : Vector2):
	function.set_obj_position(pos)

func get_addon_info() -> Dictionary:
	return function.get_addon_info()

func get_polygon() -> PackedVector2Array:
	return UI.get_polygon()

func get_polygon_in_world() -> PackedVector2Array:
	return function.get_polygon_in_world()
	
func bump_handler(info : Dictionary):
	return function.bump_handler(info) 
	
func function_process(delta):
	return function.function_process(delta)

func obj_init(func_type : String ,binder : Obj_UI = null , father = null):
	self.father = father
	function = Register_table.obj_type[func_type].new()
	if binder == null :
		UI = Register_table.obj_type[func_type].UI_instance()
		if father != null : father.UI.add_child(UI)
	else : 
		UI = binder
	UI.lowlevel = self
	function.lowlevel = self
	function.all_init()
	
func bump_info_append(key , value):
	function.bump_info_append(key, value)
	
func allow_bump(collider : Obj):
	return function.allow_bump(collider)

func free():
	UI.free()
	function.free()
