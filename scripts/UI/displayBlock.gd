extends Control
class_name DisplayBlock

var block_offset:int
var father
@onready var textureButton:TextureButton = $TextureButton
# Called every frame. 'delta' is the elapsed time since the previous frame.
func button_pressed():
	if block_offset + father.block_offset < father.show_list.size(): 
		if father.picked == block_offset + father.block_offset:
			father.wanna_drop = true
		else :
			father.picked = block_offset + father.block_offset
	
func _ready():
	textureButton.pressed.connect(button_pressed)

func _process(delta):
	if father == null : return
	var list = father.show_list
	var texture_dic = father.texture_dic
	if list == null or texture_dic == null : return
	
	textureButton.texture_normal = load("res://images/item/default.png")
	if block_offset + father.block_offset  < list.size(): 
		if list[block_offset + father.block_offset] != null :
			if texture_dic.get( list[block_offset + father.block_offset]["name"] ) != null :
				textureButton.texture_normal = load(texture_dic[ list[block_offset + father.block_offset]["name"] ] ["export_dic"] ["texture"])
	if father.picked == block_offset + father.block_offset :
		textureButton.modulate = Color(0.8,0.8,1.0)
	else:
		textureButton.modulate = Color(1.0,1.0,1.0)
	pass
