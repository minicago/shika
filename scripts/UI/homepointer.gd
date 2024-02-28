extends Control
class_name Homepointer

@export var fatherUI : World_UI
@onready var pointer = $pointer
@onready var label = $Label
# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var father = fatherUI.lowlevel
	if father == null : return
	var _dist:Vector2 = (father.get_rider().get_obj_position() - father.get_home().get_obj_position())
	pointer.rotation = _dist.angle() - PI / 2
	pointer.position = Vector2(0,0) - _dist.normalized() * pointer.size.y * 0.6 + _dist.normalized().rotated(PI / 2) * pointer.size.x * 0.5
	label.text = str(snapped(_dist.length() , 1))
	pass
