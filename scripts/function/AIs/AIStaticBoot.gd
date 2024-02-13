extends Node
class_name AIStaticBoot

static func _static_init():
	Modulate_AI
	Rider_AI
	Item_AI
	Monster_AI
	
	print("AI static init done")
