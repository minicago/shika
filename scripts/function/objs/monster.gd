extends Obj_function
class_name Monster_function

static func follow_AI(_self:Monster_function ,delta):
	_self.toward = _self.toward.rotated(delta)
	pass

func AI_init():
	AI_append("follow")
	speed = Vector2(100.0,0)
	

func bump_info_init():
	bump_info_append("collider", lowlevel)
	bump_info_append("type","monster")
	bump_info_append("once",false)

static func _static_init():
	Register_table.obj_type["monster"] = Monster_function
	Register_table.AI["follow"] = Callable(Monster_function, "follow_AI")
	
	print("monster function static init done")

static func UI_instance() -> Obj_UI:
	var tscn=load("res://tscns/objs/monster/1.tscn")
	return tscn.instantiate()
