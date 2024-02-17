extends Control
class_name DisplayRing

var block_offset:int = 0
var picked:int = -1
var show_list:Array = []
var texture_dic:Dictionary = Register_table.item_data
var wanna_drop = false

@onready var anch = $anch
@export var item_num:int = 6
@export var r_dist: float = 200.0

func set_show_list(value):
	show_list = value
	
func set_texture_dic(value):
	texture_dic = value

func set_block_offset(value):
	block_offset = value 

## Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0, item_num):
		var tmp = preload("res://tscns/UIcontrol/displayBlock.tscn").instantiate()
		tmp.block_offset = i
		tmp.father = self
		tmp.set_position(anch.position + Vector2(0.0, -r_dist).rotated(2 * PI / item_num * i))
		add_child(tmp)



## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
