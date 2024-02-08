extends Node
class_name Bump_manager

var bump_Dicitionary : Dictionary 


static func manager_process(handle_list :Array[Obj], delta):
	for collidee in handle_list:
		#print(collidee)
		for collider in handle_list:
			if collider != collidee :
				
				if collidee.allow_bump(collider):
					if not Geometry2D.intersect_polygons( collider.get_polygon_in_world(), collidee.get_polygon_in_world()).is_empty() :
						collidee.bump_handler(collider.get_addon_info())
	pass
