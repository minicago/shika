extends Control
class_name game

var world : World = World.new()
@onready var world_UI : World_UI = $SubViewportContainer/World
@onready var homepointer : Homepointer = $Homepointer

func _ready():
	world.world_init("res://tscns/world.tscn",world_UI)
	homepointer.bind(world)
	print("OK")

func _process(delta):
	$SubViewportContainer/World.size = get_viewport().size
	# $SubViewportContainer.rect = ( get_viewport_rect() )
	pass
