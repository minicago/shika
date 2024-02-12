extends Obj_function
class_name Monster_function

static var follow_AI = func(_self:Obj_function ,delta):
	if _self.timer_get("follow_AI",0) == 0:
		var world:World = _self.get_father()
		var rider_pos = world.get_rider().get_obj_position()
		if randf() < _self.addon_info["follow_AI_miss_rate"] :
			_self.toward = Vector2(1,0).rotated(randf() * 2 * PI)
		else : _self.toward = (rider_pos - _self.position ).normalized()
		_self.timer_set("follow_AI", _self.addon_info["follow_AI_cool_time"])
	pass
	
static var spider_AI = func(_self:Obj_function ,delta):
	if _self.timer_get("spider_AI",0) == 0:
		if _self.speed.length() == 0 : _self.speed = Vector2(500.0, 0)
		else : _self.speed = Vector2(0.0, 0.0)
		_self.timer_set("spider_AI", _self.addon_info["spider_AI_cool_time"])
		
static var abandon_AI = func(_self:Obj_function ,delta):
	var world:World = _self.get_father()
	var rider_pos = world.get_rider().get_obj_position()
	if (_self.position-rider_pos).length() > _self.addon_info["abandon_dist"] :
		_self.kill()
		

func AI_data_init():
	maxhealth = 100.0
	health = 100.0
	addon_info_append("spider_AI_cool_time", 0.5)
	addon_info_append("follow_AI_cool_time", 1.0)
	addon_info_append("follow_AI_miss_rate", 0.5)
	addon_info_append("abandon_dist", 2000.0)
	
func AIs_append():
	AI_append("follow")
	AI_append("spider")
	AI_append("abandon")
	AI_append("modulate_hurt")
	
func bump_handler_init():
	bump_handler_append("box")
	bump_handler_append("rider")
	

func bump_info_init():
	addon_info_append("collider", lowlevel)
	addon_info_append("box", 10.0)
	addon_info_append("mass", 8.0)
	addon_info_append("type","monster")
	addon_info_append("attack",10.0)
	#bump_info_append("once",false)
	
static var bump_handler_rider = func(collidee : Obj_function, info : Dictionary):
	#print("kill")
	if info.get("type", "") == "rider":
		info.get("collider").take_damage(collidee.addon_info["attack"])
		

static func _static_init():
	Register_table.obj_type["monster"] = Monster_function
	Register_table.handlers["rider"] = bump_handler_rider
	Register_table.AI["follow"] = follow_AI
	Register_table.AI["spider"] = spider_AI
	Register_table.AI["abandon"] = abandon_AI
	print("monster function static init done")

static func UI_instance() -> Obj_UI:
	var tscn=load("res://tscns/objs/monster/1.tscn")
	return tscn.instantiate()
