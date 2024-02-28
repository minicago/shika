extends SubViewportContainer
@onready var camera = $SubViewport/Camera2D
@onready var subviewport = $SubViewport
@onready var maps = $SubViewport/maps
var anchor_position

func go_to_map(map) :
	Userdata.common_data["position"] = map
	queue_free()

# Called when the node enters the scene tree for the first time.
func _ready():
	for map in Userdata.map :
		var texture_button = TextureButton.new()
		texture_button.texture_normal = load( Register_table.map[map]["texture"] )
		texture_button.set_position( Register_table.map[map]["location"] )
		texture_button.pressed.connect(func() : go_to_map(map))
		maps.add_child(texture_button)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if camera.get_position().x < camera.limit_top : camera.position.x = camera.limit_top
	if camera.get_position().y < camera.limit_left : camera.position.y = camera.limit_left
	if camera.get_position().x > camera.limit_bottom : camera.position.x = camera.limit_bottom
	if camera.get_position().y > camera.limit_right : camera.position.y = camera.limit_right
	if Input.is_action_pressed("up") :
		camera.set_position(camera.get_position() - Vector2 (0 , delta * get_viewport().size.y ) /  camera.zoom )
		
	if Input.is_action_pressed("down") :
		camera.set_position(camera.get_position() - Vector2 (0 , - delta * get_viewport().size.y ) /  camera.zoom )
		
	if Input.is_action_pressed("left") :
		camera.set_position(camera.get_position() - Vector2 (delta * get_viewport().size.x , 0) /  camera.zoom )
		
		
	if Input.is_action_pressed("right") :
		camera.set_position(camera.get_position() - Vector2 (- delta * get_viewport().size.x , 0) /  camera.zoom ) 
		
		
	if Input.is_action_pressed("click"):
		camera.set_position(camera.get_position() + (anchor_position - subviewport.get_mouse_position() )  /  camera.zoom )
	
	anchor_position = subviewport.get_mouse_position()
	if Input.is_action_just_pressed("zoom_up") :
		if camera.zoom.length() < 20: camera.zoom = camera.zoom * Vector2(1.25, 1.25)
	if Input.is_action_just_pressed("zoom_down") :
		if camera.zoom.length() > 0.2: camera.zoom = camera.zoom * Vector2(0.8, 0.8)
	pass
