extends Node
class_name Item_AI
	
static var burning_AI = func(_self:Obj_function ,delta):
	var world:World = _self.lowlevel.father
	for obj in world.get_objs():
		if obj.get_addon_info("type") == "monster" and (obj.get_obj_position() - _self.get_obj_position()).length() < 500.0:
			obj.take_damage(_self.get_addon_info("attack") * delta * 0.01)

static func _static_init():
	Register_table.AI["burning"] = burning_AI
