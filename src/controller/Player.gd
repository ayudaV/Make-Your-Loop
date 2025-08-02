class_name Player extends Entity

func move(direction):
	var target=Globals.game_controller.get_element(position+direction)
	var target_floor=Globals.game_controller.get_element(position+direction+Vector3.DOWN)
	if target.can_move_into(self,direction) and target_floor.can_move_over(self,direction):
		target.move_into()
		target.move_over()
