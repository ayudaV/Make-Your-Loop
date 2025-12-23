extends Node3D
@export var conected_portal : Node3D
@export var directions: Array[Vector3]

func get_entrances() -> Array[Vector3]:
	var result: Array[Vector3] = []
	var basis := Basis(Vector3.UP, rotation.y)
	for dir in directions:
		result.append(basis * dir)
	return result

func get_conected_portal_pos():
	return conected_portal.position
