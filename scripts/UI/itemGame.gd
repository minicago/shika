extends Control
class_name ItemGame

@onready var label:Label = $Label
@onready var labeltime:Label = $Labeltime
@onready var texture:TextureRect = $TextureRect
var textureloaded = false
@onready var shader : ShaderMaterial = texture.material
@export var item_num : int
@export var fatherUI : World_UI




func _process(delta):
	var father = fatherUI.lowlevel
	if father != null:
		if not textureloaded : 
			texture.texture = load(father.get_rider().get_addon_info(str(item_num)+"texture","res://images/item/default.png"))
			textureloaded = true
		label.text = str(item_num)
		var time1 = father.get_rider().get_addon_info(str(item_num)+"display1",0.0)
		var time2 = father.get_rider().get_addon_info(str(item_num)+"display2",0.0)
		if time1 == 0.0 : labeltime.visible = false
		else : labeltime.visible = true
		var coolr:float = time1 / (time2 + 0.01)
		shader.set_shader_parameter("coolt", coolr)
		labeltime.text = str(snappedf( time1, 0.01))
	pass
