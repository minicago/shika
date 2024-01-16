extends Obj_function
class_name Rider_function

var resist : float
var lineResist : float
var rtimes :float
var brake : float
var power : float

var spinRate : float 
var spinLoss : float

static func rider_AI(_self:Rider_function ,delta):
	_self.speed *= exp(-_self.resist*delta)
	
	if Input.is_action_pressed("up") : 
		_self.speed.x += _self.power * delta
	 
		
	if Input.is_action_pressed("left") : 
		var tmp = - _self.spinRate * delta
		_self.toward = _self.toward.rotated(tmp)
		_self.speed = _self.speed.rotated(tmp) * _self.spinLoss + _self.speed * (1 - _self.spinLoss)
		
		
	if Input.is_action_pressed("right") : 
		var tmp = _self.spinRate * delta
		_self.toward = _self.toward.rotated(tmp)
		_self.speed = _self.speed.rotated(tmp) * _self.spinLoss + _self.speed * (1 - _self.spinLoss)
	
	
	if Input.is_action_pressed("down") :
		if (abs(_self.speed.x) < _self.brake * delta) : _self.speed.x = 0
		else : if(_self.speed.x > 0) : _self.speed.x -= _self.brake  * delta
		else : _self.speed.x += _self.brake * delta
		
	else:
		
		if (abs(_self.speed.x) < _self.lineResist * delta) : _self.speed.x = 0
		else : if(_self.speed.x > 0) : _self.speed.x -= _self.lineResist  * delta
		else : _self.speed.x += _self.lineResist * delta

		if (abs(_self.speed.y) < _self.lineResist * _self.rtimes * delta) : _self.speed.y = 0
		else : if(_self.speed.y > 0) : _self.speed.y -= _self.lineResist * _self.rtimes * delta
		else : _self.speed.y += _self.lineResist * _self.rtimes * delta

func bump_handler_init():
	bump_handler_append("once")
	bump_handler_append("box")
	bump_handler_append("home")
	bump_handler_append("monster")


func bump_info_init():
	bump_info_append("box", 10.0)
	bump_info_append("collider", lowlevel)
	bump_info_append("type","rider")
	
func AI_data_init():
	spinable = true
	resist = 0.9
	lineResist = 50.0
	rtimes = 10.0
	brake = 1000.0
	power = 1000.0

	spinRate = PI
	spinLoss = 0.8
	
func AI_init():
	AI_data_init()
	AI_append("rider")

static func bump_handler_home(collidee :Rider_function, info : Dictionary):
	if info.get("type", "") == "home":
		print("back home")
		
static func bump_handler_monster(collidee :Rider_function, info : Dictionary):
	if info.get("type", "") == "monster":
		print("hurt")

static func _static_init():
	Register_table.handlers["home"] = Callable(Rider_function,"bump_handler_home")
	Register_table.handlers["monster"] = Callable(Rider_function,"bump_handler_monster")
	
	Register_table.AI["rider"] = Callable(Rider_function,"rider_AI")
	
	Register_table.obj_type["rider"] = Rider_function
	
	print("rider function static init done")

static func UI_instance() -> Obj_UI:
	var tscn=load("res://tscns/objs/rider/glassy.tscn")
	return tscn.instantiate()
