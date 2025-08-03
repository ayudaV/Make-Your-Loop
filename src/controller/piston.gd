class_name Piston extends Tile

var model = preload("res://src/piston/piston.tscn")

func _init(parent:Node, position:Vector3) -> void:
	name="piston"
	self.position = position
	render = model.instantiate()
	load_render(parent)
