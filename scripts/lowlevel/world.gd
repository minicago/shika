extends Node
class_name World

var UI : World_UI
var function : World_function
var timestamp = 0

func set_world_info(value :Dictionary):
	function.set_world_info(value)
	
func set_rider_data(value : Dictionary):
	function.set_rider_data(value)

func get_rider():
	return function.get_rider()
	
func get_home():
	return function.get_home()

func get_objs() -> Array[Obj]:
	return UI.get_objs()
	
func instance_rider():
	return function.instance_rider()
	
func instance_home():
	return function.instance_home()
	
func instance_monster(name):
	return function.instance_monster(name)
	pass

func lose():
	return function.lose()

func win():
	return function.win()

func world_init(path : String ,binder : World_UI = null, father = null):
	print(path)
	if binder == null :
		UI = load(path).instantiate()
		if father != null : father.add_child(UI)
	else : 
		UI = binder
	function = World_function.new()
	UI.lowlevel = self
	function.lowlevel = self

func function_process(delta):
	return function.function_process(delta)

func all_free():
	queue_free()
	UI.queue_free()
	function.all_free()
