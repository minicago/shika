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
	rider.rider_init("res://tscns/objs/rider/glassy.tscn",get_rider_UI())

func instance_home():
	home = Obj.new()
	home.obj_init("res://tscns/objs/home.tscn",get_home_UI())
	home.set_obj_position(Vector2(500,500))
	home.bump_info_append("type","home")

