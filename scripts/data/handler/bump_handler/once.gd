extends Node
static func _static_init():
	Register_table.handlers["once"] = func(collidee :Obj_function, collider : Obj):
		if not collidee.banlist.get(collider, false):
			collidee.banlist[collider] = true
		else : return

	