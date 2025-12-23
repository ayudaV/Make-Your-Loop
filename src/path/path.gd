class_name Paths extends Node3D
@export var directions: Array[Vector3]

func get_entrances() -> Array[Vector3]:
	var result: Array[Vector3] = []
	#var basis := Basis(Vector3.UP, rotation.y)
	for dir in directions:
		match int(rotation_degrees.y):
			0: result.append(Vector3(dir.x, dir.y, dir.z))
			90:result.append(Vector3(dir.z, dir.y, -dir.x))
			180:result.append(Vector3(-dir.x, dir.y, -dir.z))
			-180:result.append(Vector3(-dir.x, dir.y, -dir.z))
			-90:result.append(Vector3(-dir.z, dir.y, dir.x))
	return result
