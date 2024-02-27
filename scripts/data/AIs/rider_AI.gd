extends Node
class_name Rider_AI

static var rider_AI = func(_self:Obj_function ,delta):
	var resist = _self.get_item_info("resist", 0.9)
	var lineResist = _self.get_item_info("lineResist")
	var rtimes = _self.get_item_info("rtimes")
	var brake = _self.get_item_info("brake")
	var power = _self.get_item_info("power")

	var spinRate = _self.get_item_info("spinRate")
	var spinLoss = _self.get_item_info("spinLoss")
	#print(_self.get_real_speed()) 
	
	
	if Input.is_action_pressed("up") : 
		_self.speed.x += power * delta
	 
		
	if Input.is_action_pressed("left") : 
		_self.spin( - spinRate * delta)
		
		
	if Input.is_action_pressed("right") : 
		_self.spin( spinRate * delta)
	
	_self.speed *= exp(- resist * delta)
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
