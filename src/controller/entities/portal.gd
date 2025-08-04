class_name Portal extends Tile

var model = preload("res://src/portal/portal.tscn")
@export var connected_portal_position: Vector3

func _init(parent:Node, position:Vector3) -> void:
	name="portal"
	self.position = position
	render = model.instantiate()
	load_render(parent)
	
func can_move_into(entity,direction):
	var target=Globals.game_controller.get_element(connected_portal_position+direction)
	return target.can_move_into(entity,direction)

func can_move_over(entity,direction):
	return false
	
func move_into(entity,direction):
	Globals.game_controller.get_element(connected_portal_position+direction).move_into(entity,direction)
