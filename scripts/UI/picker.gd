extends Control
class_name Picker
var blocks = 3
@onready var container = $HBoxContainer
# Called when the node enters the scene tree for the first time.

func get_entry(npc):
	var dialogue_ins = preload("res://tscns/dialogue.tscn").instantiate()
	get_tree().root.add_child(dialogue_ins)
	dialogue_ins.load_as_index(npc)
	queue_free()

func _ready():
	var dic = {}
	for npc in Register_table.map[ Userdata.common_data["position"] ].get("NPC_list", []):
		if Userdata.NPC.get(npc,{}).get("weight", 0) != 0 :
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
