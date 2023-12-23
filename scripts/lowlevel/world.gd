extends Node
class_name World

var tscn = preload("res://tscns/world.tscn")
var UI : World_UI
var function : World_function

func get_rider():
	return function.get_rider()

func get_rider_UI():
	return UI.get_rider_UI()
	
func get_home_UI():
	return UI.get_home_UI()
	
func instance_rider():
	return function.instance_rider()
	
func instance_home():
	return function.instance_home()

func world_init(binder : World_UI = null):
	if binder == null :
		UI = tscn.instantiate()
	else : 
		UI = binder
	function = World_function.new()
	UI.lowlevel = self
	function.lowlevel = self
	instance_rider()
	instance_home()
	
	
