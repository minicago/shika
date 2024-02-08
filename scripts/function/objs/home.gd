extends Obj_function
class_name Home_function

func bump_info_init():
	addon_info_append("collider", lowlevel)
	addon_info_append("type","home")
	addon_info_append("once", true)

static func _static_init():
	Register_table.obj_type["home"] = Home_function
	print("home function static init done")

static func UI_instance() -> Obj_UI:
	var tscn=load("res://tscns/objs/home.tscn")
	return tscn.instantiate()
