extends Node
static func _static_init():
	Register_table.handlers["monster"] =  func(collidee :Obj_function, collider : Obj):
		if collider.get_addon_info("type") == "monster":
			collider.call_handler("take_damage", collidee.get_item_info("bump_damage", {}))

	
