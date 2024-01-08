extends Node2D
class_name World_function

var rider : Rider
var home : Obj
var lowlevel : World

func get_rider_UI():
	return lowlevel.get_rider_UI()
	
func get_home_UI():
	return lowlevel.get_home_UI()

func get_rider():
	return rider

func instance_rider():
	rider = Rider.new()
	rider.rider_init("res://tscns/objs/rider/pain.tscn",get_rider_UI(),lowlevel.UI)

func instance_home():
	home = Obj.new()
	home.obj_init("res://tscns/objs/home.tscn",get_home_UI(),lowlevel.UI)
	home.set_obj_position(Vector2(500,500))
	home.bump_info_append("type","home")

func get_objs() -> Array[Obj]:
	return lowlevel.get_objs()

func function_process(delta):
	Bump_manager.manager_process(get_objs(), delta)
