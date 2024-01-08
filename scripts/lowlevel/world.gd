extends Node
class_name World

var UI : World_UI
var function : World_function

func get_rider():
	return function.get_rider()

func get_rider_UI():
	return UI.get_rider_UI()
	
func get_home_UI():
	return UI.get_home_UI()

func get_objs() -> Array[Obj]:
	return UI.get_objs()
	
func instance_rider():
	return function.instance_rider()
	
func instance_home():
	return function.instance_home()

func world_init(path : String ,binder : World_UI = null, father = null):
	if binder == null :
		UI = load(path).instance()
		if father != null : father.add_child(UI)
	else : 
		UI = binder
	function = World_function.new()
	UI.lowlevel = self
	function.lowlevel = self
	instance_rider()
	instance_home()

func function_process(delta):
	return function.function_process(delta)
