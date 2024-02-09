extends Obj_function
class_name Monster_function

static func follow_AI(_self:Obj_function ,delta):
	if _self.timer_get("follow_AI",0) == 0:
		var world:World = _self.get_father()
		var rider_pos = world.get_rider().get_obj_position()
		if randf() < _self.addon_info["follow_AI_miss_rate"] :
			_self.toward = Vector2(1,0).rotated(randf() * 2 * PI)
		else : _self.toward = (rider_pos - _self.position ).normalized()
		_self.timer_set("follow_AI", _self.addon_info["follow_AI_cool_time"])
	pass
	
static func spider_AI(_self:Obj_function ,delta):
	if _self.timer_get("spider_AI",0) == 0:
		if _self.speed.length() == 0 : _self.speed = Vector2(500.0, 0)
		else : _self.speed = Vector2(0.0, 0.0)
		_self.timer_set("spider_AI", _self.addon_info["spider_AI_cool_time"])
		

func AI_init():
	addon_info_append("spider_AI_cool_time", 0.5)
	addon_info_append("follow_AI_cool_time", 1.0)
	addon_info_append("follow_AI_miss_rate", 0.5)
	
	
	AI_append("follow")
	AI_append("spider")
	
func bump_handler_init():
	bump_handler_append("box")

func bump_info_init():
	addon_info_append("collider", lowlevel)
	addon_info_append("box", 10.0)
	addon_info_append("mass", 8.0)
	addon_info_append("type","monster")
	#bump_info_append("once",false)

static func _static_init():
	Register_table.obj_type["monster"] = Monster_function
	Register_table.AI["follow"] = Callable(Monster_function, "follow_AI")
	Register_table.AI["spider"] = Callable(Monster_function, "spider_AI")
	print("monster function static init done")

static func UI_instance() -> Obj_UI:
	var tscn=load("res://tscns/objs/monster/1.tscn")
	return tscn.instantiate()
