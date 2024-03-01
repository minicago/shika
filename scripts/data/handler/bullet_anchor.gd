extends Node

static func _static_init():
	Register_table.handlers["bullet_anchor"] = func (_self : Obj_function, value) :
		var father = _self.get_item_info("father",null)
		if father == null : 
			_self.call_handler("die",{})
			return
		_self.set_obj_position( father.get_obj_position() + _self.get_item_info("anchor_offset",Vector2(100, 0)).rotated(father.toward.angle()))
		_self.toward = father.toward.rotated(_self.get_item_info("bullet_speed", Vector2(1800,0)).angle())
		pass

