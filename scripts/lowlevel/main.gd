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

var mycar

func runaway_pressed():
	if game != null:
		var result = game.game_result()
		if result.get("result", "running") == "running" :
			remove_child(game)
			game.all_free()
			index.visible = true
			audioStreamPlayer2D.stream_paused = false
			Userdata.all_save()
			return
	if workshop.visible:
		workshop.visible = false
		Userdata.all_save()
		return
	
	get_tree().quit()
	pass
	
func workshop_pressed():
	workshop.visible = true


func _ready():
	gameBegin.pressed.connect(game_Begin_pressed)
	workshopbutton.pressed.connect(workshop_pressed)
	runaway.pressed.connect(runaway_pressed)
	pass # Replace with function body.

func game_Begin_pressed():
	if game != null : game.all_free()
	game = preload("res://tscns/game.tscn").instantiate()
	var car_info = Userdata.riders["riders"][Userdata.riders.get("picked",0)]
	mycar = Register_table.obj_data[car_info["name"]].duplicate()
	for i in range(0,car_info.get("items").size()):
		if car_info["items"][i] != null:
			Register_table.equip_item(i, mycar, Register_table.item_data [car_info["items"][i]["name"]] )
	game.game_init(mycar, Register_table.world_info_dic["level"+str(Userdata.common_data.get("level", 1))])
	index.add_sibling(game)
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
				Userdata.common_data["level"] = Userdata.common_data.get("level", 1) + 1
				if Userdata.common_data.get("level", 1) > 5 : Userdata.common_data["level"] = 5
			Userdata.all_save()
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#index.size = 
	game_manager()
	pass
