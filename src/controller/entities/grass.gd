class_name Grass extends Tile

func _init(position:Vector3) -> void:
	name="grass"
	self.position = position
	
func can_move_into(entity,direction):
	return false
func can_move_over(entity,direction):
	return false
	
