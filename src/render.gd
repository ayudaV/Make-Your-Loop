extends Node

@export var scene_metadata:LevelMetadata

@onready var ground_grass = preload("res://assets/GLTF format/ground_grass.glb")

func _ready() -> void:

	for x in range(scene_metadata.static_matrix_size.x):
		for z in range(scene_metadata.static_matrix_size.z):
			for y in range(scene_metadata.static_matrix_size.y):
				var ground_grass_instance:Node3D = ground_grass.instantiate()
				ground_grass_instance.position = Vector3(x,y,z)
				add_child(ground_grass_instance)
