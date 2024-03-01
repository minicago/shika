extends Node

static func _static_init():
	Register_table.handlers["burning"] = func (_self : Obj_function, value) :
		var world:World = _self.lowlevel.father
		for obj in world.get_objs():
			if obj.get_addon_info("type") == "monster" and (obj.get_obj_position() - _self.get_obj_position()).length() < _self.get_addon_info("dist",500.0):
				obj. call_handler("take_damage", _self.get_item_info("damage",{}))
		pass

