class_name Piston extends Tile

func _init(position:Vector3, is_open:bool) -> void:
	name="piston"
	self.position = position
	self.is_open = is_open
