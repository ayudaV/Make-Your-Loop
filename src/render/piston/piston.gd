class_name PistonRender extends Node3D
@export var is_open = false

var open_head_pos = Vector3(0, 0.45, 0)
var close_head_pos = Vector3(0, -0.55, 0)
var step_speed = 0.1

func _physics_process(delta: float) -> void:
	if is_open:
		$Head.position = lerp($Head.position, open_head_pos, step_speed)
	else:
		$Head.position = lerp($Head.position, close_head_pos, step_speed)
