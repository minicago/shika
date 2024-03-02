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
		var show_cool = father.get_rider().get_addon_info(str(item_num)+"show_cool", true)
		if show_cool:
			var time1 = father.get_rider().get_addon_info(str(item_num)+"display1",0.0)
			var time2 = father.get_rider().get_addon_info(str(item_num)+"display2",0.0)
			#print(item_num," ",time1," ",time2)
			if time1 == 0.0 : labeltime.visible = false
			else : labeltime.visible = true
			if time1 > 999 : labeltime.text = ""
			else : labeltime.text = str(snappedf( time1, 0.01))
			var coolr:float = time1 / (time2 + 0.01)
			shader.set_shader_parameter("available", true)
			shader.set_shader_parameter("coolt", coolr)
		else: 
			labeltime.text = father.get_rider().get_addon_info(str(item_num)+"displaytext","")
			shader.set_shader_parameter("available", false)
		
	pass
