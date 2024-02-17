extends Control
class_name DisplayBoard

@onready var anch = $anch
@onready var down = $down
@onready var up = $up
@onready var item = $item
@onready var rider = $rider

var block_offset:int = 0
var picked:int = -1
var show_list:Array
var texture_dic:Dictionary 
var width_block:int = 6
var height_block:int = 5
var displayMargin:Vector2 = Vector2(70.0,70.0)
var rider_mode = true
var wanna_drop = false

func set_show_list(value):
	show_list = value
	
func set_texture_dic(value):
	texture_dic = value

func set_block_offset(value):
	block_offset = value 
	
func page_down():
	if block_offset + width_block * height_block < show_list.size():
		block_offset += width_block * height_block

func page_up():
	block_offset -= width_block * height_block
	block_offset = max(0, block_offset)
	
func change_to_item():
	picked = -1
	rider_mode = false
	set_texture_dic(Register_table.item_data)
	set_show_list(Userdata.package_item["package"])

func change_to_rider():
	picked = -1
	rider_mode = true
	set_texture_dic(Register_table.obj_data)
	set_show_list(Userdata.riders["riders"])

## Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0, height_block):
		for j in range(0, width_block):
			var tmp = preload("res://tscns/UIcontrol/displayBlock.tscn").instantiate()
			tmp.block_offset = i * width_block + j
			tmp.father = self
			tmp.set_position(anch.get_position()+Vector2(1.0*j,1.0*i)*displayMargin)
			add_child(tmp)
			#tmp.owner = container
			
	up.pressed.connect(page_up)
	down.pressed.connect(page_down)
	rider.pressed.connect(change_to_rider)
	item.pressed.connect(change_to_item)


## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
