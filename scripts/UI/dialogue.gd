extends Control
class_name Dialogue

@onready var label = $Label
@onready var button_box = $VBoxContainer
@onready var texture = $TextureRect
var game:Game
var NPC_name
func start_game(world_info):
	game = preload("res://tscns/game.tscn").instantiate()
	var car_info = Userdata.riders["riders"][Userdata.riders.get("picked",0)]
	var mycar = Register_table.obj_data[car_info["name"]].duplicate(true)
	for i in range(0,car_info.get("items").size()):
		if car_info["items"][i] != null:
			Register_table.equip_item(i, mycar, Register_table.item_data [car_info["items"][i]["name"]] )
	game.game_init(mycar, world_info)

func give_reward(dic):
	for item in dic.get("reward_item",[]):
		Userdata.package_item["package"].append(item)

	for rider in dic.get("reward_riders",[]):
		Userdata.riders["riders"].append(rider)

	for NPC in dic.get("reward_NPC",[]):
		Userdata.NPC[NPC] = Register_table.NPC_data[NPC].get("init",{"brave":0, "weight":1})
		
	for tag in dic.get("reward_tag",[]):
		Userdata.common_data[tag] = true

	Userdata.NPC[NPC_name]["brave"] += dic.get("reward_brave",0)

func button_pressed(dic):
	var type = dic.get("type","default")
	var win_flag = true
	if type == "game":
		start_game(Register_table.world_info_dic[dic.get("world_name","default")] )
		#visible = false
		game.z_index = 1
		add_child(game)
		await game.game_end
		#visible = true
		if game.game_result().get("result","lose") == "lose":
			win_flag = false
		game.all_free()

	if win_flag:
		give_reward(dic)
		Userdata.all_save()
		var next = dic.get("next","quit")
		if next != "quit":
			load_from_dic(NPC_name, Register_table.dialogue_data[next])
		else : queue_free()
		
	else:
		var next = dic.get("fail","quit")
		if next != "quit":
			load_from_dic(NPC_name, Register_table.dialogue_data[next])
		else : queue_free()

func instance_button(dic):
	var button = Button.new()
	button_box.add_child(button)
	button.text = tr(dic.get("text","default"))
	button.pressed.connect(func(): button_pressed(dic))

func load_from_dic(npc, dic):
	NPC_name = npc
	texture.texture = load(Register_table.NPC_data[dic.get("name","minicago")].get("texture","res://images/NPC/taxi_normal.png"))
	label.text = tr(dic.get("text","default"))
	for button_dic in dic.get("button",[]):
		instance_button(button_dic)

#func _ready():
	#load_from_dic(Register_table.dialogue_data["help"])
