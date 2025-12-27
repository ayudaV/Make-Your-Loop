class_name Goal extends Tile

func _init(position:Vector3) -> void:
	name="goal"
	self.position = position
	
func can_move_into(entity,direction):
	return true
func can_move_over(entity,direction):
	return false
	
func move_into(entity,direction):
	Globals.game_controller.set_element(position,entity)
	Globals.game_controller.set_element(entity.position,Air.new(entity.position))
	entity.position = position
