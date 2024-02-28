extends Control
class_name Game

signal game_end
var world : World = World.new()
@onready var world_UI : World_UI = $SubViewportContainer/World
@onready var runawy = $runaway
var rider_data
var world_info
var quit = false

func game_init(_rider_data, _world_info):
	rider_data = _rider_data
	world_info = _world_info

	
func _ready():
	world.world_init("res://tscns/world.tscn",world_UI)
	world.set_world_info(world_info)
	world.set_rider_data(rider_data)
	runawy.pressed.connect(func(): quit = true)
	Register_table.control.set_bgm(world_info.get("bgm" , "res://voices/main.mp3" ))
	print("OK")
	
func game_result():
	if world.win():
		return {"result" : "win"}
	if world.lose() or quit:
		return {"result" : "lose"}
	return {"result" : "running"}

func _process(delta):
	if world == null : return
	if world.win() or world.lose() or quit: 
		game_end.emit()
		Register_table.control.set_bgm(Register_table.map[Userdata.common_data.get("position") ].get( "bgm", "res://voices/try.mp3") )
	# $SubViewportContainer.rect = ( get_viewport_rect() )
	pass

func all_free():
	queue_free()
	world.all_free()
