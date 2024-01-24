extends Control
class_name Homepointer

var father : World
@onready var pointer = $pointer
# Called when the node enters the scene tree for the first time.
func bind(world:World):
	father = world
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if father == null : return
	var _dist:Vector2 = (father.get_rider().get_obj_position() - father.get_home().get_obj_position())
	pointer.rotation = _dist.angle() - PI / 2
	pointer.position = Vector2(0,0) - _dist.normalized() * pointer.size.y * 0.6 + _dist.normalized().rotated(PI / 2) * pointer.size.x * 0.5
	pass