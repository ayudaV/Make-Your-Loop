class_name Player extends Entity

func move(direction):
	var target=Globals.game_controller.get_element(position+direction)
	var target_floor=Globals.game_controller.get_element(position+direction+Vector3.FORWARD)
	if target.can_move_into(self,direction) and target_floor.can_move_over(self,direction):
		target.move_into(self,direction)
		target_floor.move_over(self,direction)
