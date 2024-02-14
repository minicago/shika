extends Node2D
class_name World_function

var rider : Obj
var home : Obj
var lowlevel : World

var monsters:Array
var world_info:Dictionary = {}
var rider_data:Dictionary = Register_table.obj_data["rider"]

func get_rider():
	return rider
	
func get_home():
	return home

func lose():
	return not get_rider().alive
	
func win():
	return get_rider().get_addon_info("win",false)
	
func set_world_info(value :Dictionary):
	world_info = value
	
func set_rider_data(value : Dictionary):
	rider_data = value

func instance_rider():
	rider = Obj.new()
	Register_table.obj_data["customized"] = rider_data
	rider.obj_init("customized",null,lowlevel)

func instance_home():
	home = Obj.new()
	home.obj_init("home",null,lowlevel)
	home.set_obj_position(world_info.get("home_dist", 10000)*Vector2(1.0,0).rotated(randf_range(0,2*PI)))
	
func instance_monster(name = "monster"):
	# print("instance")
	var monster = Obj.new()
	monster.obj_init(name,null,lowlevel)
	monster.set_obj_position(randf_range(1000.0,1500.0)*get_rider().get_toward().rotated(randf_range(-0.3*PI,0.3*PI))+get_rider().get_obj_position())
	monsters.append(monster)

func get_objs() -> Array[Obj]:
	return lowlevel.get_objs()

func monster_manager():
	for monster in monsters:
		if monster == null :
			monsters.erase(monster)
	if(monsters.size()<world_info.get("max_monsters",10)): 
		var monster_dic = world_info.get("monster_probility",{"monster":100})
		var maxprob = 0
		for monster_type in monster_dic:
			maxprob += monster_dic[monster_type]
		var prob = randi_range(0,maxprob - 1)
		for monster_type in monster_dic:
			if maxprob < monster_dic[monster_type]:
				instance_monster(monster_type)
				break
			else :
				maxprob -= monster_dic[monster_type]
		instance_monster()

func function_process(delta):
	Bump_manager.manager_process(get_objs(), delta) 
	monster_manager()

func all_free():
	queue_free()
	for monster in monsters :
		monster.all_free()
	rider.all_free()
	home.all_free()



