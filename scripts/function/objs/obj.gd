extends Node
class_name Obj_function

var lowlevel : Obj

var spinable = false
var toward : Vector2 = Vector2(0,-1.0)
var position : Vector2
var bump_info : Dictionary
var global_polygon:PackedVector2Array = PackedVector2Array()
var banlist : Dictionary
var bump_handler_dic : Dictionary = {}
var speed : Vector2 = Vector2.ZERO
var AI_dic : Dictionary = {}

func get_speed():
	return speed

func get_toward():
	if spinable : 
		return toward
	else :
		return Vector2(0,-1.0)

func get_obj_position():
	return position
	
func set_obj_position(pos):
	position = pos
	refresh_polygon_in_world()

func get_bump_info():
	return bump_info

func get_polygon():
	return lowlevel.get_polygon()

func function_process(delta):
	for function in AI_dic:
		AI_dic[function].call(self, delta)
	set_obj_position(position + toward * speed.x * delta + toward.rotated(- PI / 2) * speed.y * delta)
	pass

func bump_handler(info : Dictionary):
	for handler in bump_handler_dic :
		bump_handler_dic[handler].call(self, info)
		
func all_init():
	bump_init()
	AI_init()

########################################################################
# bump
########################################################################

# bump_polygon:

func refresh_polygon_in_world():
	global_polygon = Transform2D(0,get_obj_position()) * get_polygon()
		
func get_polygon_in_world():
	return global_polygon

# bump_handler:

func bump_handler_append(name):
	bump_handler_dic[name] = Register_table.handlers[name]
	
func bump_init():
	bump_handler_init()
	bump_info_init()

func bump_info_append(key , value):
	bump_info[key] = value

func allow_bump(collider : Obj):
	return not banlist.get(collider, false)
	
########################################################################
# AI
########################################################################

func AI_append(name):
	AI_dic[name] = Register_table.AI[name]

func AI_init():
	pass
	
########################################################################
# customized
########################################################################
	
static func bump_handler_once(collidee :Obj_function, info : Dictionary):
	if info.get("once", true): 
		if not collidee.banlist.get(info.get("collider"), false):
			collidee.banlist[info.get("collider")] = true
		else : return

static func _static_init():
	Register_table.handlers["once"] = Callable(Obj_function, "bump_handler_once")
	Register_table.obj_type["obj"] = Obj_function
	print("obj function static init done")
	
func bump_handler_init():
	bump_handler_append("once")
	
func bump_info_init():
	bump_info_append("collider", lowlevel)

static func UI_instance() -> Obj_UI:
	var tscn=load("res://tscns/objs/default.tscn")
	return tscn.instantiate()
