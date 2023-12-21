extends Node2D
class_name Rider

var speed : Vector2 = Vector2.ZERO
var resist : float = 0.9
var lineResist : float = 50.0
var rtimes :float = 10.0
var brake : float = 1000.0
var power : float = 1000.0
var toward : Vector2 = Vector2(0,-1.0)
var spinRate : float = PI
var spinLoss : float = 0.8
@onready var camera : Camera2D = $Camera2D
@onready var background : TextureRect = $Background
@onready var shader : ShaderMaterial = background.material

func _process(delta):
	
	camera.zoom = Vector2(1,1) /  max (0.8 * log(speed.length() / 100),1)
	camera.offset = get_viewport_rect().size * toward * speed.length() / (6000)
	background.size = get_viewport_rect().size * 5.0
	rotation = toward.angle() + PI / 2
	background.rotation = -rotation
	background.set_position((-background.size/2).rotated(-rotation))
	shader.set_shader_parameter("pos",position)
	shader.set_shader_parameter("size", get_viewport_rect().size * 5.0)
	

	position += toward * speed.x * delta + toward.rotated(- PI / 2) * speed.y * delta
	
	if Input.is_action_pressed("up") : 
		speed.x += power * delta
	 
		
	if Input.is_action_pressed("left") : 
		var tmp = - spinRate * delta
		toward = toward.rotated(tmp)
		speed = speed.rotated(tmp) * spinLoss + speed * (1 - spinLoss)
		
		
		
	if Input.is_action_pressed("right") : 
		var tmp = spinRate * delta
		toward = toward.rotated(tmp)
		speed = speed.rotated(tmp) * spinLoss + speed * (1 - spinLoss)
	
	speed *= exp(-resist*delta)
	if Input.is_action_pressed("down") :
		if (abs(speed.x) < brake * delta) : speed.x = 0
		else : if(speed.x > 0) : speed.x -= brake  * delta
		else : speed.x += brake * delta
		
	else:
		
		if (abs(speed.x) < lineResist * delta) : speed.x = 0
		else : if(speed.x > 0) : speed.x -= lineResist  * delta
		else : speed.x += lineResist * delta

		if (abs(speed.y) < lineResist * rtimes * delta) : speed.y = 0
		else : if(speed.y > 0) : speed.y -= lineResist * rtimes * delta
		else : speed.y += lineResist * rtimes * delta
	
	print (speed )
