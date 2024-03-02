extends Node
static func _static_init():
	Register_table.handlers["bullet"] = func(collidee : Obj_function, collider : Obj):
		collider.call_handler("take_damage", collidee.get_item_info("damage", {}))

	