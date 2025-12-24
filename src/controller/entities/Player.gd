class_name Player extends Entity

var render:PlayerRender

func _init(position:Vector3, _render:PlayerRender) -> void:
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
		if target is Box:
			target.move(direction)
			target = Globals.game_controller.get_element(position+direction)
		target.move_into(self,direction)
		target_floor.move_over(self,direction)
		update()
		
func update():
	render.update(position)
