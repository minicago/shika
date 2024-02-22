extends Control
class_name HealthBar

@onready var textureProgressBar:TextureProgressBar = $TextureProgressBar
@export var fatherUI : World_UI

# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var father = fatherUI.lowlevel
	if father == null : return
	var max_value = father.get_rider().function.maxhealth
	var value = father.get_rider().function.health
	textureProgressBar.max_value=max_value
	textureProgressBar.value=value
	if value < 0.15 * max_value :
		modulate.s = 100.0
		modulate.a = sin(Time.get_ticks_msec() / 500.0) * 0.4 + 0.6
	else:
		modulate.s = 0.0
		modulate.a = 1.0
