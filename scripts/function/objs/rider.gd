extends Obj_function
class_name Rider_function

var speed : Vector2 = Vector2.ZERO
var resist : float = 0.9
var lineResist : float = 50.0
var rtimes :float = 10.0
var brake : float = 1000.0
var power : float = 1000.0

var spinRate : float = PI
var spinLoss : float = 0.8

func get_speed():
	return speed

func function_process(delta):
	speed *= exp(-resist*delta)

	set_obj_position( position + toward * speed.x * delta + toward.rotated(- PI / 2) * speed.y * delta)
	
	
	if Input.is_action_pressed("up") : 
		
		speed.x += power * delta
	 
		
	if Input.is_action_pressed("left") : 
		var tmp = - spinRate * delta
		toward = toward.rotated(tmp)
		speed = speed.rotated(tmp) * spinLoss + speed * (1 - spinLoss)
		
		
		
	if Input.is_action_pressed("right") : 
		var tmp = spinRate * delta
		toward = toward.rotated(tmp)
		speed = speed.rotated(tmp) * spinLoss + speed * (1 - spinLoss)
	
	
	if Input.is_action_pressed("down") :
		if (abs(speed.x) < brake * delta) : speed.x = 0
		else : if(speed.x > 0) : speed.x -= brake  * delta
		else : speed.x += brake * delta
		
	else:
		
		if (abs(speed.x) < lineResist * delta) : speed.x = 0
		else : if(speed.x > 0) : speed.x -= lineResist  * delta
		else : speed.x += lineResist * delta

		if (abs(speed.y) < lineResist * rtimes * delta) : speed.y = 0
		else : if(speed.y > 0) : speed.y -= lineResist * rtimes * delta
		else : speed.y += lineResist * rtimes * delta

func bump_handler(info : Dictionary):
	if info.get("once",true):
		if not banlist.get(info.get("collider"), false):
			banlist[info.get("collider")] = true
		else : return
	if info.get("type", "") == "home":
		print("back home")
