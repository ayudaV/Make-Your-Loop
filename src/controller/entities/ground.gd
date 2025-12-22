class_name Ground extends Tile
var model = preload("res://assets/debug/ground.tscn")

func _init(parent:Node, position:Vector3, in_array:Array[Vector3], out_array:Array[Vector3]) -> void:
	name="ground"
	self.position = position
	self.in_array = in_array
	self.out_array = out_array
	render = model.instantiate()
	load_render(parent)
