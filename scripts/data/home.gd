extends Node
class_name Home_info

static func _static_init():
	Register_table.register_obj_data(
		"home",
		
		{
			"UI_instance_path" : "res://tscns/objs/home.tscn"
		},
		
		{

			"type" : "home",
			"once" : true,
		},
		
		[
		],
		
		[
			"once",
		],
	)
	print("home function static init done")

