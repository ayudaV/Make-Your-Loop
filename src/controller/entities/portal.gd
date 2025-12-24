class_name Portal extends Tile

var connected_portal_position: Vector3
var in_array : Array[Vector3]
var out_array : Array[Vector3]

func _init(position:Vector3, _in_array:Array[Vector3], _out_array:Array[Vector3], _connected_portal_position) -> void:
	name="portal"
	self.position = position
	connected_portal_position = _connected_portal_position
	in_array = _in_array
	out_array = _out_array
	
func can_move_into(entity,direction):
	var target=Globals.game_controller.get_element(connected_portal_position+direction)
	return target.can_move_into(entity,direction)

func can_move_over(entity,direction):
	return false
	
func move_into(entity,direction):
	Globals.game_controller.get_element(connected_portal_position+direction).move_into(entity,direction)
