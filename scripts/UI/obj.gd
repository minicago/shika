extends Node2D
class_name Obj_UI
var lowlevel : Obj

@onready var polygon : Polygon2D = $Polygon2D

func get_speed():
	return lowlevel.get_speed()
	
func get_toward():
	return lowlevel.get_toward()
	
func get_obj_position():
	return lowlevel.get_obj_position()
	
func get_polygon() -> PackedVector2Array :
	return Transform2D(0.0,scale * polygon.scale,0.0,Vector2.ZERO) * polygon.polygon

func set_obj_position(pos : Vector2):
	lowlevel.set_obj_position(pos)
	
func function_process(delta):
	return lowlevel.function_process(delta)

func _process(delta):
	if lowlevel != null : 
		function_process(delta)
		rotation = get_toward().angle() + PI / 2
		position = get_obj_position()
	
func free():
	get_parent().remove_child(self)
