extends Node2D
class_name Obj_UI
var lowlevel : Obj

@onready var polygon : Polygon2D = $Polygon2D

func get_speed():
	return lowlevel.get_speed()

func get_real_speed():
	return lowlevel.get_real_speed()

func get_toward():
	return lowlevel.get_toward()

func get_obj_position():
	return lowlevel.get_obj_position()

func get_polygon() -> PackedVector2Array :
	return Transform2D(rotation ,scale * polygon.scale,0.0,scale * polygon.position) * polygon.polygon
	
func get_func_modulate():
	return lowlevel.get_func_modulate()

func set_obj_position(pos : Vector2):
	lowlevel.set_obj_position(pos)
	
func get_item_info(key, value):
	return lowlevel.get_item_info(key, value)
	
func function_process(delta):
	return lowlevel.function_process(delta)

func _process(delta):
	if lowlevel != null : 
		function_process(delta)
		rotation = get_toward().angle() + PI / 2
		set_position(get_obj_position())
		set_modulate(get_func_modulate())
	
func free():
	get_parent().remove_child(self)


