class_name Air extends Tile

func _ready():
	name="air"
func can_move_into(entity,direction):
	return true
func can_move_over(entity,direction):
	return false
	
func move_into(entity,direction):
	Globals.game_controller.set_element(position,entity)
	Globals.game_controller.set_element(entity.position,self)
