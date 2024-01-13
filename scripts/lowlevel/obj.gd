extends Node
class_name Obj

var function : Obj_function
var UI : Obj_UI

func get_speed():
	return function.get_speed()
	
func get_toward() -> Vector2:
	return function.get_toward()
	
func get_obj_position() -> Vector2:
	return function.get_obj_position()

func set_obj_position(pos : Vector2):
	function.set_obj_position(pos)

func get_bump_info() -> Dictionary:
	return function.get_bump_info()

func get_polygon() -> PackedVector2Array:
	return UI.get_polygon()

func get_polygon_in_world() -> PackedVector2Array:
	return function.get_polygon_in_world()
	
func bump_handler(info : Dictionary):
	return function.bump_handler(info) 
	
func function_process(delta):
	return function.function_process(delta)

func obj_init(func_type : String ,path : String ,binder : Obj_UI = null , father = null):
	if binder == null :
		UI = load(path).instantiate()
		if father != null : father.add_child(UI)
	else : 
		UI = binder
	function = Register_table.obj_type[func_type].new()
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
