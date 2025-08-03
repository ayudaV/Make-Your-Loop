class_name Player extends Entity

var model = preload("res://src/player/player.tscn")

func _init(parent:Node, position:Vector3) -> void:
	name="player"
	self.position = position
	render = model.instantiate()
	load_render(parent)

func move(direction):
	var target:Entity=Globals.game_controller.get_element(position+direction)
	var target_floor:Entity=Globals.game_controller.get_element(position+direction+Vector3.DOWN)
	print(target.name, target_floor.name, position, direction)

	if target.can_move_into(self,direction) and target_floor.can_move_over(self,direction):
		target.move_into(self,direction)
		target_floor.move_over(self,direction)
		self.position = position+direction
		update_render()
