extends Node
static func _static_init():
	Register_table.handlers["home"] = func(collidee :Obj_function, collider : Obj):
		if collider.get_addon_info("type") == "home":
			collidee.addon_info_append("win", true)
			print("back home")

	