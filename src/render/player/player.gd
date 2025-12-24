class_name PlayerRender extends CharacterBody3D

var step_speed = 0.1
@onready var matrix_pos:Vector3 = self.position

func update(position:Vector3):
	matrix_pos = position

func _physics_process(delta: float) -> void:
	position = lerp(position, matrix_pos, step_speed)
	if not Vector2(position.x, position.z).is_equal_approx(Vector2(matrix_pos.x, matrix_pos.z)): 
		look_at(matrix_pos)
