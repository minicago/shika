extends Node

static func _static_init():
	Register_table.handlers["show_info"] = func (_self : Obj_function, value) :
		var str = _self.get_item_info("displaystr","")
		str = Register_table.dic_format_item(str , _self.get_addon_info_dic() , _self.item_name , "item__")
		str = Register_table.dic_format(str , Userdata.common_data , "common_data__")
		str = Register_table.dic_format(str , Userdata.package_item , "package_item__")
		_self.item_info_append("displaytext" ,  str)
		pass

