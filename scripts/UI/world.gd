extends Node2D
class_name World_UI

var lowlevel : World
	
@onready var camera : Camera2D = $Camera2D
@onready var background : TextureRect = $Camera2D/Background
@onready var shader : ShaderMaterial = background.material
@onready var rider_UI : Obj_UI = $Rider
@onready var home_UI : Obj_UI = $Home 

func get_rider_UI():
	return rider_UI

func get_home_UI():
	return home_UI

func get_rider():
	return lowlevel.get_rider()

func get_camera_zoom():
	return max (0.8 * log(get_rider().get_speed().length() / 100),1)
	
func get_camera_offset():
	return get_viewport_rect().size * get_rider().get_toward() * get_rider().get_speed().length() / (6000)

func camera_aim_rider():
	camera.zoom = Vector2(1,1) / get_camera_zoom()
	camera.offset = get_camera_offset()
	camera.position = get_rider().get_obj_position() 
	background.size = get_viewport_rect().size * 10
	background.set_position((-background.size/2) )
	shader.set_shader_parameter("pos", get_rider().get_obj_position() )
	shader.set_shader_parameter("size", get_viewport_rect().size * 10)

func camera_aim_position(pos : Vector2 ):
	camera.zoom = Vector2(1,1)
	camera.offset = Vector2(0,0)
	camera.position = pos
	background.size = get_viewport_rect().size * 10
	background.set_position((-background.size/2) )
	shader.set_shader_parameter("pos", pos )
	shader.set_shader_parameter("size", get_viewport_rect().size * 10)
	
func get_objs():
	var ret : Array[Obj]
	for child:Obj_UI in find_children("*","Obj_UI") : 
		ret.append(child.lowlevel)
	return ret

func _process(delta):
	Bump_manager.manager_process(get_objs(), delta)
	if Input.is_action_pressed("click"):
		camera_aim_position(Vector2(0,0))
	else:
		if get_rider() != null :
			camera_aim_rider()
	
	pass
