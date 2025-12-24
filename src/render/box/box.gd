class_name BoxRender extends CharacterBody3D

var step_speed = 0.1
@onready var matrix_pos:Vector3 = self.position


func update(position:Vector3):
	matrix_pos = position

func _physics_process(delta: float) -> void:
	position = lerp(position, matrix_pos, step_speed)
