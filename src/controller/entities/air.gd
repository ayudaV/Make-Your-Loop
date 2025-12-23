class_name Air extends Tile


func _init(position:Vector3) -> void:
	name="air"
	self.position = position
	
func can_move_into(entity,direction):
	return true
func can_move_over(entity,direction):
	return false
	
func move_into(entity,direction):
	Globals.game_controller.set_element(position,entity)
	Globals.game_controller.set_element(entity.position,self)
	var aux = entity.position
	entity.position = position
	position = aux
