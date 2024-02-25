extends Node
class_name Bump_manager

var bump_Dicitionary : Dictionary 


static func manager_process(handle_list :Array[Obj], delta):
	for i in range(0,handle_list.size()):
		#print(collidee)
		for j in range(i + 1,handle_list.size()):
			var collider = handle_list[i]
			var collidee = handle_list[j]
			if collider != collidee :
				if not Geometry2D.intersect_polygons( collider.get_polygon_in_world(), collidee.get_polygon_in_world()).is_empty() :
					if collidee.allow_bump(collider) and collider.allow_bump(collidee):
						collidee.bump_handler(collider)
						collider.bump_handler(collidee)
	pass
