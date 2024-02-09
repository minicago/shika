extends Obj_function
class_name Rider_function

func resist() : return addon_info.get("resist")
func lineResist() : return addon_info.get("lineResist")
func rtimes() :return addon_info.get("rtimes")
func brake() : return addon_info.get("brake")
func power() : return addon_info.get("power")

func spinRate() : return addon_info.get("spinRate") 
func spinLoss() : return addon_info.get("spinLoss")

static func rider_AI(_self:Obj_function ,delta):
	print(_self.get_real_speed()) 
	_self.speed *= exp(-_self.resist()*delta)
	
	if Input.is_action_pressed("up") : 
		_self.speed.x += _self.power() * delta
	 
		
	if Input.is_action_pressed("left") : 
		var tmp = - _self.spinRate() * delta
		_self.toward = _self.toward.rotated(tmp)
		_self.speed = _self.speed.rotated(tmp) * _self.spinLoss() + _self.speed * (1 - _self.spinLoss())
		
		
	if Input.is_action_pressed("right") : 
		var tmp = _self.spinRate() * delta
		_self.toward = _self.toward.rotated(tmp)
		_self.speed = _self.speed.rotated(tmp) * _self.spinLoss() + _self.speed * (1 - _self.spinLoss())
	
	
	if Input.is_action_pressed("down") :
		if (abs(_self.speed.x) < _self.brake() * delta) : _self.speed.x = 0
		else : if(_self.speed.x > 0) : _self.speed.x -= _self.brake()  * delta
		else : _self.speed.x += _self.brake() * delta
		
	else:
		
		if (abs(_self.speed.x) < _self.lineResist() * delta) : _self.speed.x = 0
		else : if(_self.speed.x > 0) : _self.speed.x -= _self.lineResist()  * delta
		else : _self.speed.x += _self.lineResist() * delta

		if (abs(_self.speed.y) < _self.lineResist() * _self.rtimes() * delta) : _self.speed.y = 0
		else : if(_self.speed.y > 0) : _self.speed.y -= _self.lineResist() * _self.rtimes() * delta
		else : _self.speed.y += _self.lineResist() * _self.rtimes() * delta

func bump_handler_init():
	bump_handler_append("once")
	bump_handler_append("box")
	bump_handler_append("home")
	bump_handler_append("monster")


func bump_info_init():
	addon_info_append("box", 10.0)
	addon_info_append("mass", 100.0)
	addon_info_append("collider", lowlevel)
	addon_info_append("type","rider")
	
func AI_data_init():
	spinable = true
	
	addon_info_append("resist", 0.9)
	addon_info_append("lineResist", 50.0)
	addon_info_append("rtimes", 20.0)
	addon_info_append("brake", 1000.0)
	addon_info_append("power", 1000.0)
	
	addon_info_append("spinRate", PI)
	addon_info_append("spinLoss", 0.8)
	
func AI_init():
	AI_data_init()
	AI_append("rider")
	AI_append("modulate_invincible")
	AI_append("modulate_hurt")

static func bump_handler_home(collidee :Obj_function, info : Dictionary):
	if info.get("type", "") == "home":
		print("back home")

static func bump_handler_monster(collidee :Obj_function, info : Dictionary):
	if info.get("type", "") == "monster":
		#info.get("collider",null).kill()
		if collidee.timer_get("invincible") == 0.0:
			print("hurt")
			collidee.timer_set("hurt", 0.20)
			collidee.timer_set("invincible", 1.0)

static func _static_init():
	Register_table.handlers["home"] = Callable(Rider_function,"bump_handler_home")
	Register_table.handlers["monster"] = Callable(Rider_function,"bump_handler_monster")
	
	Register_table.AI["rider"] = Callable(Rider_function,"rider_AI")
	
	Register_table.obj_type["rider"] = Rider_function
	
	print("rider function static init done")

static func UI_instance() -> Obj_UI:
	var tscn=load("res://tscns/objs/rider/glassy.tscn")
	return tscn.instantiate()
