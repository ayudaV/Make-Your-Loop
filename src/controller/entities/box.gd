class_name Box extends Entity

var render:BoxRender

func _init(position:Vector3, _render:BoxRender) -> void:
	name="box"
	self.position = position
	render = _render

func move(direction):
	var target:Entity=Globals.game_controller.get_element(position+direction)
	var target_floor:Entity=Globals.game_controller.get_element(position+direction+Vector3.DOWN)
	var entity_floor:Entity=Globals.game_controller.get_element(position+Vector3.DOWN)

	print("[Box] Current position: " + str(position), 
	" Target: " + target.name, 
	" Target floor: " + target_floor.name, 
	" Move direction: " + str(direction))
	
	if target.can_move_into(self,direction) and target_floor.can_move_over(self,direction) and entity_floor.can_move_out(self,direction):
		target.move_into(self,direction)
		target_floor.move_over(self,direction)
		update()
		return true
	return false
		
func can_move_into(entity:Entity,direction):
	var target:Entity=Globals.game_controller.get_element(position+direction)
	var target_floor:Entity=Globals.game_controller.get_element(position+direction+Vector3.DOWN)
	if entity is Player and target.can_move_into(self,direction) and target_floor.can_move_over(self,direction):
		return true
	return false
	
func can_move_over(entity,direction):
	return false

func update():
	render.update(position)
