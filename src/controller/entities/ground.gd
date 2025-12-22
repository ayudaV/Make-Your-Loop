class_name Ground extends Tile
var model = preload("res://assets/debug/ground.tscn")

func _init(parent:Node, position:Vector3) -> void:
	name="ground"
	self.position = position
	render = model.instantiate()
	load_render(parent)
