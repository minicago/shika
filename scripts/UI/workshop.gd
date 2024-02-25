extends Control
class_name Workshop

@onready var displayRing = $DisplayRing
@onready var displayOne = $DisplayOne
@onready var displayBoard = $DisplayBoard
@onready var label = $Label
@onready var label2 = $Label2

# Called when the node enters the scene tree for the first time.
func _ready():
	displayBoard.change_to_rider()
	displayOne.set_texture_dic(Register_table.obj_data)
	displayRing.set_texture_dic(Register_table.item_data)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if displayBoard.rider_mode and displayBoard.picked >= 0 :
		Userdata.riders["picked"] = displayBoard.picked
	if displayBoard.rider_mode and displayBoard.picked < 0 :
		displayBoard.picked = Userdata.riders["picked"]
	
	var picked_rider = Userdata.riders["riders"][Userdata.riders.get("picked",0)]
	displayOne.set_show_list([picked_rider])
	if picked_rider.get("items") == null :picked_rider["items"] = [null,null,null,null,null,null,]
	displayRing.set_show_list(picked_rider.get("items"))
	displayOne.picked = -1 
	

	
	
	if not displayBoard.rider_mode :
		if displayBoard.picked >= 0 and displayRing.picked >= 0:
			if picked_rider["items"][displayRing.picked] != null : Userdata["package_item"]["package"].append(picked_rider["items"][displayRing.picked])
			picked_rider["items"][displayRing.picked] = Userdata["package_item"]["package"][displayBoard.picked]
			Userdata["package_item"]["package"].remove_at(displayBoard.picked)
			displayBoard.picked = -1
			displayRing.picked = -1
	if displayRing.picked >= 0 and displayRing.wanna_drop:
		displayRing.wanna_drop = false
		if picked_rider["items"][displayRing.picked] != null :
			Userdata["package_item"]["package"].append(picked_rider["items"][displayRing.picked])
			picked_rider["items"][displayRing.picked] = null
		displayRing.picked = -1
		
	if not displayBoard.rider_mode and displayBoard.picked < 0:
		label.text = ""
		label2.text = ""
	
	if not displayBoard.rider_mode and displayBoard.picked >= 0:
		label.text = tr(Userdata["package_item"]["package"][displayBoard.picked]["name"])
		label2.text = Register_table.dic_format(
			tr(Register_table.item_data[ Userdata["package_item"]["package"][displayBoard.picked]["name"] ]["export_dic"].get("descript","") ),
			Register_table.item_data[ Userdata["package_item"]["package"][displayBoard.picked]["name"] ] )
		
	
	if displayBoard.rider_mode and displayBoard.picked >= 0:
		label.text = tr(picked_rider["name"])
		label2.text = Register_table.dic_format(
			tr(Register_table.obj_data[ picked_rider["name"] ]["export_dic"] .get("descript","") ),
			Register_table.obj_data[ picked_rider["name"] ] )
	
	pass
