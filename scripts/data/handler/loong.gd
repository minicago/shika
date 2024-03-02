extends Node
static func _static_init():
	Register_table.handlers["loong"] = func(_self : Obj_function, value):
		var followee = _self.get_item_info("follow_monster", null)
		if followee != null :
			_self.set_speed(followee.get_speed() ) 

	
