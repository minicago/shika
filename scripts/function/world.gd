extends Node2D
class_name World_function

var rider : Obj
var home : Obj
var lowlevel : World

var monsters:Array

func get_rider_UI():
	return lowlevel.get_rider_UI()
	
func get_home_UI():
	return lowlevel.get_home_UI()

func get_rider():
	return rider
	
func get_home():
	return home

func instance_rider():
	rider = Obj.new()
	rider.obj_init("rider",get_rider_UI(),lowlevel)

func instance_home():
	home = Obj.new()
	home.obj_init("home",get_home_UI(),lowlevel)
	home.set_obj_position(Vector2(500,500))
	
func instance_monster():
	var monster = Obj.new()
	monster.obj_init("monster",null,lowlevel)
	monster.set_obj_position(Vector2(randi_range(-200,200),randi_range(-200,200)))
	monsters.append(monster)

func get_objs() -> Array[Obj]:
	return lowlevel.get_objs()

func function_process(delta):
	Bump_manager.manager_process(get_objs(), delta)
	if(monsters.size()<3): instance_monster()
