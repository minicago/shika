extends Obj
class_name Rider

func get_speed():
	return function.get_speed()
	
func get_toward():
	return function.get_toward()
	
func function_process(delta):
	function.function_process(delta)

func rider_init(path : String ,binder : Obj_UI = null):
	if binder == null :
		UI = load(path).instantiate()
	else : 
		UI = binder
	function = Rider_function.new()
	UI.lowlevel = self
	function.lowlevel = self
	function.bump_init()
	bump_info_append("type","rider")

func _ready():
		
	pass
	#get_parent().add_child(function)
	
