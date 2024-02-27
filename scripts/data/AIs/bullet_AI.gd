extends Node
class_name Bullet_AI

static var bomb_AI = func(_self:Obj_function ,delta):
	_self.set_speed(Vector2(0,0))
	_self.lowlevel.UI.scale *= pow(_self.get_item_info("scale",500.0), delta)

static func _static_init():
	Register_table.AI["bomb"] = bomb_AI
