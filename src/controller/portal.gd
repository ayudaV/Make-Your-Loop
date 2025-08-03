class_name Portal extends Tile

var model = preload("res://src/portal/portal.tscn")

func _init(parent:Node, position:Vector3) -> void:
	name="portal"
	self.position = position
	render = model.instantiate()
	load_render(parent)
