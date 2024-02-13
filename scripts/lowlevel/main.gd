extends Control
class_name Main
var game : Game

# Called when the node enters the scene tree for the first time.
@onready var gameBegin:TextureButton = $gameBegin
@onready var audioStreamPlayer2D:AudioStreamPlayer2D = $AudioStreamPlayer2D
func _ready():
	gameBegin.pressed.connect(game_Begin_pressed)
	pass # Replace with function body.

func game_Begin_pressed():
	if game != null : game.all_free()
	game = preload("res://tscns/game.tscn").instantiate()
	get_tree().root.add_child(game)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if game != null :
		visible = false
		audioStreamPlayer2D.stream_paused = true
	else :
		visible = true
		audioStreamPlayer2D.stream_paused = false
	if game == null:
		if get_tree().root.find_child("Game"):
			get_tree().root.remove_child(game)
	pass
