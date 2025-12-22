class_name Grass extends Tile

var model = preload("res://assets/debug/grass.tscn")

func _init(parent:Node, position:Vector3) -> void:
	name="grass"
	self.position = position
	render = model.instantiate()
	load_render(parent)
	
func can_move_into(entity,direction):
	return false
func can_move_over(entity,direction):
	return false
	
