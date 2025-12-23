class_name Piston extends Tile
@export var is_open:bool
var character:Node3D

func _init(position:Vector3, _is_open:bool, _character:Node3D) -> void:
	name="piston"
	self.position = position
	is_open = _is_open
	character = _character
