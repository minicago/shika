extends Obj
class_name Rider


func rider_init(path : String ,binder : Obj_UI = null, father = null):
	if binder == null :
		UI = load(path).instantiate()
		if father != null : father.add_child(UI)
	else : 
		UI = binder
		
	function = Rider_function.new()
	UI.lowlevel = self
	function.lowlevel = self
	function.bump_init()
	
