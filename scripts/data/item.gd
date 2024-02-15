extends Node
class_name Item_info

static func _static_init():
	Register_table.register_item_data(
		"blink",
		
		{
			"texture" : "res://images/item/blink.png",
			"cool_time" : 10.0,
			"blink_dist" : 200.0,
		},
		
		{


		},
		
		[
			"blink",
		],
	)

	Register_table.register_item_data(
		"rush",
		
		{
			"texture" : "res://images/item/rush.png",
			"cool_time" : 5.0,
			"rush_power" : 400.0,
		},
		
		{


		},
		
		[
			"rush",
		],
	)
	print("Item function static init done")
