class_name Ground extends Tile
var in_array : Array[Vector3]
var out_array : Array[Vector3]

func _init(position:Vector3, _in_array:Array[Vector3], _out_array:Array[Vector3]) -> void:
	name="ground"
	self.position = position
	in_array = _in_array
	out_array = _out_array
