extends Control
class_name game

var world : World = World.new()
@onready var world_UI : World_UI = $SubViewportContainer/World
@onready var homepointer : Homepointer = $Homepointer
@onready var healthBar : HealthBar = $HealthBar

func _ready():
	world.world_init("res://tscns/world.tscn",world_UI)
	homepointer.bind(world)
	healthBar.bind(world)
	print("OK")

func _process(delta):
	if world == null : return
	$SubViewportContainer/World.size = get_viewport().size
	if world.win() :
		world.all_free()
		pass
	elif world.lose():
		world.all_free()
		pass
	# $SubViewportContainer.rect = ( get_viewport_rect() )
	pass
