class_name Piston extends Tile
@export var is_open:bool
var render:PistonRender

func _init(position:Vector3, _is_open:bool, _render:PistonRender) -> void:
	name="piston"
	self.position = position
	is_open = _is_open
	render = _render
	

func update():
	render.is_open = is_open
