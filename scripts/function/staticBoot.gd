extends Node
class_name StaticBoot

static func AIboot():
	Item_AI
	Modulate_AI
	Monster_AI
	Rider_AI
	print("AI boot finished")
	
static func handlerboot():
	BumpHandlerBoot
	OtherHandlerBoot
	print("Handler boot finished")
	
static func infoboot():
	World_info
	Home_info
	Item_info
	Monster_info
	Rider_info
	Dialogue_info
	NPC_info
	
	Userdata.all_load()
	print("Info boot finished")

static func _static_init():
	AIboot()
	handlerboot()
	infoboot()
	
	
