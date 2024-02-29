extends SubViewport
class_name World_UI

var lowlevel : World
	
@onready var camera : Camera2D = $Camera2D
@onready var background : TextureRect = $Camera2D/Background
@onready var shader : ShaderMaterial = background.material

func get_world_info():
	return lowlevel.get_world_info()

func get_size_float():
	return Vector2(size.x,size.y)

func get_rider():
	return lowlevel.get_rider()
	
func function_process(delta):
	return lowlevel.function_process(delta)

func get_camera_zoom():
	return max (0.8 * log(get_rider().get_speed().length() / 100),1)
	
func get_camera_offset():
	return get_size_float() * get_rider().get_toward() * get_rider().get_speed().length() / (6000)

func camera_aim_rider():
	camera.zoom = Vector2(1,1) / get_camera_zoom()
	camera.offset = get_camera_offset()
	camera.position = get_rider().get_obj_position() 
	background.size = get_size_float() * 10
	background.set_position((-background.size/2) )
	shader.set_shader_parameter("pos", get_rider().get_obj_position() )
	shader.set_shader_parameter("size", get_size_float() * 10)

func camera_aim_position(pos : Vector2 ):
	camera.zoom = Vector2(1,1)
	camera.offset = Vector2(0,0)
	camera.position = pos
	background.size = get_size_float() * 10
	background.set_position((-background.size/2) )
	shader.set_shader_parameter("pos", pos )
	shader.set_shader_parameter("size", get_size_float() * 10)
	
func get_objs() -> Array[Obj]:
	var ret : Array[Obj] = []

	if not get_rider().alive: return []

	for child:Obj_UI in find_children("*","Obj_UI",false,false) : 
		if child.lowlevel != null : 
			if child.lowlevel.alive : ret.append(child.lowlevel)
			else :
				remove_child(child)
				child.lowlevel.all_free()
	return ret

func _process(delta):
	var shader_type = get_world_info().get("shader_type" , 0)
	shader.set_shader_parameter("shader_type", shader_type)
	if lowlevel != null : 
		function_process(delta)
		if get_rider() != null :
			camera_aim_rider()
