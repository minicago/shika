extends Node2D
class_name World_function

var rider : Obj
var home : Obj
var lowlevel : World

var init_flag:bool = true
var world_info:Dictionary = {}
var rider_data:Dictionary = {}

var time_total = 0

var monster_buf: Array = []

func get_rider():
	return rider
	
func get_home():
	return home

func lose():
	if get_rider() == null : return false
	return not get_rider().alive
	
func win():
	if get_rider() == null : return false
	return get_rider().get_addon_info("win", false)
	
func set_world_info(value :Dictionary):
	world_info = value.duplicate(true)
	monster_buf = world_info.get("init_monster",[]).duplicate()
	
func get_world_info(key , value = null):
	return world_info.get(key,value)
	
func world_info_append(key , value):
	world_info[key] = value
	
func set_rider_data(value : Dictionary):
	rider_data = value
	instance_home()
	instance_rider()

func instance_rider():
	rider = Obj.new()
	Register_table.obj_data["customized"] = rider_data.duplicate()
	rider.obj_init("customized",null,lowlevel)
	rider.function.toward = world_info.get("home_position", Vector2(10000.0, 0) ).normalized()

func instance_home():
	home = Obj.new()
	home.obj_init("home",null,lowlevel)
	home.set_obj_position(world_info.get("home_position", Vector2(10000.0, 0)) )
	
func instance_monster(name):
	world_info_append( "monster_num", get_world_info("monster_num", 0 ) + 1 )
	var monster = Obj.new()
	monster.obj_init(name,null,lowlevel)
	monster.set_obj_position(
		get_rider().get_obj_position() + monster.get_addon_info("appear_position",
		monster.get_addon_info("appear_dist", randf_range(1200.0,1500.0)) *
		get_rider().get_toward().rotated(randf_range(-0.3*PI,0.3*PI)) )
	)
	monster.call_handler("monster_init" , {})
	return monster
	
func instance_bullet(name, dic = {}):
	var bullet = Obj.new()
	bullet.obj_init(name,null,lowlevel)
	bullet.call_handler("bullet_init" , dic)
	return bullet
	
func get_objs() -> Array[Obj]:
	return lowlevel.get_objs()
	


func monster_manager(delta):
	var penalty = 1.0
	

	if get_world_info("monster_num", 0.0) >= world_info.get("max_monsters",10):
		penalty *= 5.0 + (get_world_info("monster_num", 0.0) - world_info.get("max_monsters",10))


	time_total += delta
	if time_total > penalty * world_info.get("monster_frequence"):
		if not monster_buf.is_empty():
			instance_monster(monster_buf[0] )
			monster_buf.remove_at(0)
		else :
			time_total -=  penalty * world_info.get("monster_frequence")
			var monster_dic = world_info.get("monster_probility",{})
			if not monster_dic.is_empty() : instance_monster(Register_table.rand_from_dic(monster_dic) )


func init_manager():
	if  init_flag :
		for i in range(1,7) :
			rider.call_handler( "rider_init" , {} ) 
		#for monster in world_info.get("init_monster",[]):
			#instance_monster(monster)
		init_flag = false

func function_process(delta):
	init_manager()
	Bump_manager.manager_process(get_objs(), delta) 
	monster_manager(delta)

func all_free():
	queue_free()
	rider.all_free()
	home.all_free()



