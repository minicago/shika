extends Obj_function
class_name Monster_function

static func follow_AI(_self:Monster_function ,delta):
	if _self.cool_down_check(delta , 2.0) > 0:
		var world:World = _self.get_father()
		var rider_pos = world.get_rider().get_obj_position()
		_self.toward = (rider_pos - _self.position ).normalized()
	pass
	
	if _self.cool_down_check(delta , 1.0):
		_self.speed = Vector2(500.0,0) - _self.speed
		

func AI_init():
	AI_append("follow")
	
func bump_handler_init():
	bump_handler_append("box")

func bump_info_init():
	bump_info_append("collider", lowlevel)
	bump_info_append("box", 10.0)
	bump_info_append("type","monster")
	#bump_info_append("once",false)

static func _static_init():
	Register_table.obj_type["monster"] = Monster_function
	Register_table.AI["follow"] = Callable(Monster_function, "follow_AI")
	
	print("monster function static init done")

static func UI_instance() -> Obj_UI:
	var tscn=load("res://tscns/objs/monster/1.tscn")
	return tscn.instantiate()
