extends Control
class_name Main
var game : Game

# Called when the node enters the scene tree for the first time.
@onready var gameBegin:TextureButton = $index/gameBegin
@onready var workshop:Workshop = $index/Workshop
@onready var workshopbutton:TextureButton = $index/workshopbutton
@onready var runaway:TextureButton = $runaway
@onready var audioStreamPlayer2D:AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var index = $index
@onready var backGround = $backGround
var picker

var mycar

func runaway_pressed():
	if workshop.visible:
		workshop.visible = false
		Userdata.all_save()
		return
	if picker != null:
		picker.queue_free()
		Userdata.all_save()
		return
	get_tree().root.add_child( preload("res://tscns/worldMap.tscn").instantiate() )
	#get_tree().quit()
	pass
	
func workshop_pressed():
	workshop.visible = true


func _ready():
	gameBegin.pressed.connect(game_Begin_pressed)
	workshopbutton.pressed.connect(workshop_pressed)
	runaway.pressed.connect(runaway_pressed)
	pass # Replace with function body.

func game_Begin_pressed():
	picker = preload("res://tscns/picker.tscn").instantiate()
	index.add_sibling(picker)

func _process(delta):
	#index.size = 
	#game_manager()
	backGround.texture = load(Register_table.map[Userdata.common_data.get("position") ]["texture"] )
	pass

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST or what == NOTIFICATION_WM_GO_BACK_REQUEST:
		Userdata.all_save()
