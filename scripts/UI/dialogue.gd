extends Control
class_name Dialogue

@onready var label = $Label
@onready var label2 = $Label2
@onready var label3 = $Label3
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
			Register_table.equip_item(i + 1, mycar, Register_table.item_data [car_info["items"][i]["name"]] )
	game.game_init(mycar, world_info)

func give_reward(dic):
	for item in dic.get("reward_item", []):
		Userdata.package_item["package"].append({"name":item})

	for rider in dic.get("reward_riders", []):
		Userdata.riders["riders"].append({"name":rider})

	for NPC in dic.get("reward_NPC", []):
		Userdata.NPC[NPC] = Register_table.NPC_data[NPC].get("init",{"brave":0, "weight":1})
		
	for tag in dic.get("reward_tag", []):
		Userdata.common_data[tag] = true
		
	for map in dic.get("reward_place", []):
		Userdata.map[map] = true
		
	for tag in dic.get("erase_tag", []):
		Userdata.common_data[tag] = false
		
	for ammo in dic.get("reward_ammo", {}):
		Userdata.package_item["ammo"][ammo] = Userdata.package_item["ammo"].get(ammo, 0) + dic["reward_ammo"][ammo]

	Userdata.NPC[NPC_name]["brave"] += dic.get("reward_brave",0)
	Userdata.common_data["fate"] +=  dic.get("reward_fate",0)

func button_pressed(dic):
	var type = dic.get("type","default")
	var win_flag = true
	if type == "game":
		start_game(Register_table.world_info_dic[dic.get("world_name","default")] )
		game.z_index = 1
		add_child(game)
		await game.game_end
		if game.game_result().get("result","lose") == "lose":
			win_flag = false
		game.all_free()

	if type == "get_item":
		win_flag = false
		for item in Userdata.package_item.get("package",[]):
			if item.get("name") == dic.get("item_want"):
				Userdata.package_item["package"].erase(item)
				win_flag = true
				break

	if type == "buy":
		if Userdata.common_data.get("fate", -1) >= dic.get("cost", 0):
			Userdata.common_data["fate"] -= dic.get("cost", 0)
		else : 
			win_flag = false

	var rate = dic.get("rate", 1.0)
	if randf() > rate : 
		win_flag = false

	if win_flag:
		give_reward(dic)
		Userdata.all_save()
		var next = dic.get("next","quit")
		if next != "quit":
			load_from_dic(NPC_name, Register_table.dialogue_data[next])
		else : queue_free()

	else:
		var next = dic.get("fail","quit")
		Userdata.all_save()
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
	texture.texture = load(Register_table.NPC_data[npc].get("texture","res://images/NPC/taxi_normal.png"))
	label.text = tr(dic.get("text","default"))
	for child in button_box.get_children(true):
		child.queue_free()
	for button_dic in dic.get("button",[]):
		instance_button(button_dic)
		
func dialogue_available(npc, dialogue):
	for no_tag in Register_table.dialogue_data[dialogue].get("no_tag",[]):
		if Userdata.common_data.get(no_tag, false) : return false
		
	for tag in Register_table.dialogue_data[dialogue].get("tag",[]):
		if not Userdata.common_data.get(tag, false) : return false
	
	if Register_table.dialogue_data[dialogue].get("brave", -1) > Userdata.NPC[npc].get("brave", 0): return false
	
	return true

func load_as_index(npc ):
	NPC_name = npc
	texture.texture = load(Register_table.NPC_data[npc].get("texture","res://images/NPC/taxi_normal.png"))
	label.text = tr(npc + "_hello")
	for child in button_box.get_children(true):
		child.queue_free()
	var dialogue_list = Register_table.NPC_data[npc].get("dialogue",[])
	
	for dialogue in dialogue_list:
		if dialogue_available(npc ,dialogue):
			if randf() <= Register_table.dialogue_data.get("weight", 1):
				instance_button({"text": dialogue+"_index",  "next" : dialogue})
	instance_button({"text": "goodbye"})
#func _ready():
	#load_from_dic(Register_table.dialogue_data["help"])
	
func _process(delta):
	label2.text = tr("fate") + ":" + str( Userdata.common_data.get("fate",0) )
	if Userdata.NPC.get(NPC_name) != null : 
		label3.text = tr("brave") + ":" + str ( Userdata.NPC[NPC_name].get("brave",0) )
