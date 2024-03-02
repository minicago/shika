extends Node
static func _static_init():
	Register_table.handlers["bullet_kill"] = func(collidee : Obj_function, collider : Obj):
		collidee.call_handler("die", {})

