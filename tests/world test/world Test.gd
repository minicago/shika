extends Control

var world : World = World.new()

func _ready():
	world.world_init($World)
