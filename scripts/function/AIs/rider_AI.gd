extends Node
class_name Rider_AI

static var rider_AI = func(_self:Obj_function ,delta):
	var resist = _self.get_addon_info("resist")
	var lineResist = _self.get_addon_info("lineResist")
	var rtimes = _self.get_addon_info("rtimes")
	var brake = _self.get_addon_info("brake")
	var power = _self.get_addon_info("power")

	var spinRate = _self.get_addon_info("spinRate")
	var spinLoss = _self.get_addon_info("spinLoss")
	#print(_self.get_real_speed()) 
	_self.speed *= exp(- resist * delta)
	
	if Input.is_action_pressed("up") : 
		_self.speed.x += power * delta
	 
		
	if Input.is_action_pressed("left") : 
		var tmp = - spinRate * delta
		_self.toward = _self.toward.rotated(tmp)
		_self.speed = _self.speed.rotated(tmp) * spinLoss + _self.speed * (1 - spinLoss)
		
		
	if Input.is_action_pressed("right") : 
		var tmp = spinRate * delta
		_self.toward = _self.toward.rotated(tmp)
		_self.speed = _self.speed.rotated(tmp) * spinLoss + _self.speed * (1 - spinLoss)
	
	
	if Input.is_action_pressed("down") :
		if (abs(_self.speed.x) < brake * delta) : _self.speed.x = 0
		else : if(_self.speed.x > 0) : _self.speed.x -= brake  * delta
		else : _self.speed.x += brake * delta
		
	else:
		
		if (abs(_self.speed.x) < lineResist * delta) : _self.speed.x = 0
		else : if(_self.speed.x > 0) : _self.speed.x -= lineResist  * delta
		else : _self.speed.x += lineResist * delta

		if (abs(_self.speed.y) < lineResist * rtimes * delta) : _self.speed.y = 0
		else : if(_self.speed.y > 0) : _self.speed.y -= lineResist * rtimes * delta
		else : _self.speed.y += lineResist * rtimes * delta

static func _static_init():
	Register_table.AI["rider"] = rider_AI
