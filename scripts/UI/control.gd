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
	if list[0] == "give_rider" :
		if list.size() != 2 : return
		if Register_table.obj_data.get(list[1]) != null:
			Userdata.riders["riders"].append({"name":list[1]})
	if list[0] == "erase_tag" :
		if list.size() != 2 : return
		Userdata.common_data[list[1]] = false
	if list[0] == "reset_save" :
		if list.size() != 1 : return
		Userdata.reset_file()
	if list[0] == "go_dialogue" :
		if list.size() != 3 : return
		var dialogue_ins = preload("res://tscns/dialogue.tscn").instantiate()
		get_tree().root.add_child(dialogue_ins)
		dialogue_ins.load_from_dic(list[1], Register_table.dialogue_data[ list[2] ])
	
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
