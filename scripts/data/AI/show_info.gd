extends Node

static func _static_init():
	Register_table.handlers["show_info"] = func (_self : Obj_function, value) :
		_self.item_info_append("displaytext" , 
		Register_table.dic_format(_self.get_item_info("displaystr","") , _self.get_addon_info_dic() , _self.item_name))
		pass

