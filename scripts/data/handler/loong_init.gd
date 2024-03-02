extends Node
static func _static_init():
	Register_table.handlers["loong_init"] = func(_self : Obj_function, value):
		var world:World = _self.get_father()
		var followee = world.get_world_info("loong_tail", null)
		_self.addon_info_append("follow_monster" , followee)
		world.world_info_append("loong_tail",_self)
		if followee == null : return
		_self.set_obj_position( followee.get_obj_position() - _self.get_item_info("follow_monster", null).get_toward() * _self.get_item_info("follow_offset", 250.0))
		_self.set_speed(followee.get_speed() )
		_self.toward = followee.get_toward()

	
