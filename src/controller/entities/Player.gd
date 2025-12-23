class_name Player extends Entity

var render:CharacterBody3D

func _init(position:Vector3, _render:CharacterBody3D) -> void:
	name="player"
	self.position = position
	render = _render

func move(direction):
	var target:Entity=Globals.game_controller.get_element(position+direction)
	var target_floor:Entity=Globals.game_controller.get_element(position+direction+Vector3.DOWN)

	print("Current position: " + str(position), 
	" Target: " + target.name, 
	" Target floor: " + target_floor.name, 
	" Move direction: " + str(direction))
	
	if target.can_move_into(self,direction) and target_floor.can_move_over(self,direction):
		target.move_into(self,direction)
		target_floor.move_over(self,direction)
		render.update(position)
