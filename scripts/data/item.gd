extends Node
class_name Item_info

static func _static_init():
#blink
	Register_table.register_item_data(
		"blink",

		{
			"texture" : "res://images/item/blink.png",
			"descript" : "blink_descript",
		},

		{
			"texture" : "res://images/item/blink.png",
			"cool_time" : 10.0,
			"blink_dist" : 500.0,
		},

		{


		},

		[
			"blink",
		],
	)

#rush
	Register_table.register_item_data(
		"rush",

		{
			"texture" : "res://images/item/rush.png",
			"descript" : "rush_descript",
		},

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

#radiance
	Register_table.register_item_data(
		"radiance",

		{
			"texture" : "res://images/item/radiance.png",
			"descript" : "radiance_descript",
		},

		{
			"texture" : "res://images/item/radiance.png",
			"damage" : {"damage" : 5.0, "ignore_invincible" :true , "ignore_ammor" : INF},
			"show_cool": false,
		},
		
		{

		},
		
		[
			"burning",
		],
	)
	
#gun
	Register_table.register_item_data(
		"gun",

		{
			"texture" : "res://images/item/gun.png",
			"descript" : "gun_descript",
		},

		{
			"texture" : "res://images/item/gun.png",
			"damage" : {"damage" : 10,  "ignore_invincible" : true, },
			"show_cool": false,
			"cool_time" : 0.1,
		},
		
		{

		},
		
		[
			"gun",
		],
	)

#thanks
	Register_table.register_item_data(
		"thanks",

		{
			"texture" : "res://images/item/thanks.png",
			"descript" : "thanks_descript",
		},

		{
			"texture" : "res://images/item/thanks.png",
		},
		
		{

		},
		
		[
			
		],
	)

#gravity
	Register_table.register_item_data(
		"gravity",

		{
			"texture" : "res://images/item/gravity.png",
			"descript" : "gravity_descript",
		},

		{
			"texture" : "res://images/item/gravity.png",
			"show_cool": false,
			"gravity" : 200.0,
		},
		
		{

		},
		
		[
			"gravity",
		],
	)
	
#onemorechance
	Register_table.register_item_data(
		"onemorechance",

		{
			"texture" : "res://images/item/onemorechance.png",
			"descript" : "onemorechance_descript",
		},

		{
			"texture" : "res://images/item/onemorechance.png",
			"show_cool": false,
			"bullet_num" : 8,
			"bullet_speed" : 500,
			"damage" : {
				"ignore_invincible" : true,
				"damage" : 1000,
			},
			"reborn_rate" : 0.5,
			"go_die_handler" : ["onemorechance"],
		},
		
		{
		},
		
		[
		],
	)	
	print("Item function static init done")
