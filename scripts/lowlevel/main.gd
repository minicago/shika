extends Control
class_name Main
var game : Game
var level = 1

# Called when the node enters the scene tree for the first time.
@onready var gameBegin:TextureButton = $index/gameBegin
@onready var audioStreamPlayer2D:AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var index = $index
func _ready():
	gameBegin.pressed.connect(game_Begin_pressed)
	pass # Replace with function body.

func game_Begin_pressed():
	if game != null : game.all_free()
	game = preload("res://tscns/game.tscn").instantiate()
	game.game_init(Register_table.obj_data["rider"], Register_table.world_info_dic["level"+str(level)])
	add_child(game)
	index.visible = false
	audioStreamPlayer2D.stream_paused = true
	
func game_manager():
	if game != null:
		var result = game.game_result()
		if result.get("result", "running") != "running" :
			remove_child(game)
			game.all_free()
			index.visible = true
			audioStreamPlayer2D.stream_paused = false
			if result.get("result") == "win" :
				level += 1
				if level > 5 : level = 5
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#index.size = size
	game_manager()
	pass
