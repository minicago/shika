extends Node
static func _static_init():
	Register_table.handlers["die_call"] = func(_self : Obj_function, value):
		var world:World = _self.get_father()
		for son in _self.get_item_info("die_call"):
			var monster:Obj = world.instance_monster(son)
			monster.set_obj_position(_self.get_obj_position())

	
