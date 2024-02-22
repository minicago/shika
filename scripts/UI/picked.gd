extends Control
class_name Picker
var blocks = 3
@onready var container = $HBoxContainer
# Called when the node enters the scene tree for the first time.
func dialogue_available(npc, dialogue):
	for no_tag in Register_table.dialogue_data[dialogue].get("no_tag",[]):
		 
		
		if Userdata.common_data.get(no_tag, false) : return false
		
	for tag in Register_table.dialogue_data[dialogue].get("tag",[]):
		if not Userdata.common_data.get(tag, false) : return false
		
	if Register_table.dialogue_data[dialogue].get("brave", -1) > Userdata.NPC[npc].get("brave", 0): return false
	
	return true

func get_entry(npc):
	var brave = Userdata.NPC[npc].get("brave", 0)
	var dialogue_list = Register_table.NPC_data[npc].get("dialogue",[])
	var dic = {}
	
	for dialogue in dialogue_list:
		
		if dialogue_available(npc ,dialogue):
			dic[dialogue] = Register_table.dialogue_data.get("weight", 1)
	if dic.is_empty() : return
	var dialogue_ins = preload("res://tscns/dialogue.tscn").instantiate()
	dialogue_ins.z_index = 1
	get_tree().root.add_child(dialogue_ins)
	dialogue_ins.load_from_dic(npc, Register_table.dialogue_data[ Register_table.rand_from_dic(dic) ])
	queue_free()

func _ready():
	var dic = {}
	for NPC in Userdata.NPC:
		if Userdata.NPC[NPC].get("weight", 1) != 0 : dic[NPC] = Userdata.NPC[NPC].get("weight", 1)
	for i in range(0, min(blocks, dic.size() ) ):
		var npc = Register_table.rand_from_dic(dic)
		dic.erase(npc)
		var texture_button = TextureButton.new()
		texture_button.stretch_mode = TextureButton.STRETCH_SCALE
		texture_button.texture_normal = load(Register_table.NPC_data[npc].get("texture") )
		texture_button.size = Vector2( container.size.x / blocks , container.size.y)
		texture_button.pressed.connect(func() : get_entry(npc))
		container.add_child(texture_button)
	pass	
	#reset()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
