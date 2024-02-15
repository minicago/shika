extends Node2D
class_name World_function

var rider : Obj
var home : Obj
var lowlevel : World

var init_flag:bool = true
var monsters:Array
var world_info:Dictionary = {}
var rider_data:Dictionary = Register_table.obj_data["rider"]

func get_rider():
	return rider
	
func get_home():
	return home

func lose():
	if get_rider() == null : return false
	return not get_rider().alive
	
func win():
	if get_rider() == null : return false
	return get_rider().get_addon_info("win",false)
	
func set_world_info(value :Dictionary):
	world_info = value
	instance_home()
		
	
func set_rider_data(value : Dictionary):
	rider_data = value
	instance_rider()

func instance_rider():
	rider = Obj.new()
	Register_table.obj_data["customized"] = rider_data.duplicate(true)
	#print(Register_table.obj_data["customized"])
	rider.obj_init("customized",null,lowlevel)

func instance_home():
	home = Obj.new()
	home.obj_init("home",null,lowlevel)
	home.set_obj_position(world_info.get("home_dist", 10000)*Vector2(1.0,0).rotated(randf_range(0,2*PI)))
	
func instance_monster(name = "monster"):
	var monster = Obj.new()
	monster.obj_init(name,null,lowlevel)
	monster.set_obj_position(randf_range(1200.0,1500.0)*get_rider().get_toward().rotated(randf_range(-0.3*PI,0.3*PI))+get_rider().get_obj_position())
	monsters.append(monster)
	monster.call_handler("monster_init" , monsters)
	return monster

func get_objs() -> Array[Obj]:
	return lowlevel.get_objs()
	
var time_total = 0

func monster_manager(delta):
	var penalty = 1.0
	for monster in monsters:
		if monster == null :
			monsters.erase(monster)
			
	if(monsters.size() >= world_info.get("max_monsters",10)):
		penalty *= 3.0
		
	if(monsters.size() > world_info.get("max_monsters",10)):
		for monster in monsters:
			if not monster.get_addon_info("boss", false) :
				monsters.erase(monster)
				monster.kill()
				break
			
	
	time_total += delta
	if(time_total > penalty * world_info.get("monster_frequence")):
		time_total -=  penalty * world_info.get("monster_frequence")
		var monster_dic = world_info.get("monster_probility",{"monster":100})
		var maxprob = 0
		for monster_type in monster_dic:
			maxprob += monster_dic[monster_type]
		var prob = randi_range(0 , maxprob - 1)
		for monster_type in monster_dic:
			if prob < monster_dic[monster_type]:
				instance_monster(monster_type)
				break
			else :
				prob -= monster_dic[monster_type]

func init_manager():
	if  init_flag :
		for monster in world_info.get("init_monster",[]):
			instance_monster(monster)
		init_flag = false

func function_process(delta):
	init_manager()
	Bump_manager.manager_process(get_objs(), delta) 
	monster_manager(delta)

func all_free():
	queue_free()
	for monster in monsters :
		if monster != null : monster.all_free()
	rider.all_free()
	home.all_free()



