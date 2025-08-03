extends CharacterBody3D

var step_speed = 0.1

var matrix_pos = Vector3(1,1,1)

func update(position:Vector3):
	matrix_pos = position

func _physics_process(delta: float) -> void:
	position = lerp(position, matrix_pos, step_speed)
	if not position.is_equal_approx(matrix_pos): look_at(matrix_pos)
