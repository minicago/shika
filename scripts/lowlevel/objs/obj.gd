extends Node
class_name Obj

var function : Obj_function
var UI : Obj_UI
	
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
	
func get_bumped_signal() -> Signal:
	return function.get_bumped_signal()

func get_polygon_in_world() -> PackedVector2Array:
	return function.get_polygon_in_world()
	
func function_process(delta):
	return function.function_process(delta)

func obj_init( path : String ,binder : Obj_UI = null ):
	if binder == null :
		UI = load(path).instantiate()
	else : 
		UI = binder
	function = Obj_function.new()
	UI.lowlevel = self
	function.lowlevel = self
	function.bump_init()
	
func bump_info_append(key , value):
	function.bump_info_append(key, value)
	
func allow_bump(collider : Obj):
	return function.allow_bump(collider)

func _ready():
		
	pass
	#get_parent().add_child(function)

func free():
	UI.free()
	function.free()
