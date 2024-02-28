extends Control
class_name GameControl

@onready var textedit = $TextEdit
@onready var audio = $AudioStreamPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_bgm(path):
	audio.stream = load(path)
	audio.play()
	

func execute(line):
	print(line)
	var list = line.split(" ")
	if list[0] == "give_item" :
		if list.size() != 2 : return
		if Register_table.item_data.get(list[1]) != null:
			Userdata.package_item["package"].append({"name":list[1]})
	if list[0] == "erase_tag" :
		if list.size() != 2 : return
		Userdata.common_data[list[1]] = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("enter") and not textedit.visible:
		textedit.visible = true
	if Input.is_action_just_pressed("exit") and textedit.visible:
		textedit.visible = false
	if textedit.visible :
		textedit.grab_focus()
		if textedit.text.contains("\n") :
			for line in textedit.text.split("\n"):
				execute(line)
			textedit.text = ""
	pass
