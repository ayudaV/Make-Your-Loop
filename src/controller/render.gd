extends Node3D
var air = preload("res://assets/debug/air.tscn")
var grass = preload("res://assets/debug/grass.tscn")
var ground = preload("res://assets/debug/ground.tscn")
var portal = preload("res://assets/debug/portal.tscn")
var piston = preload("res://assets/debug/piston.tscn")
var piston_head = preload("res://assets/debug/piston_head.tscn")
var player = preload("res://assets/debug/player.tscn")

func render_matrix(entity_matrix:Array, static_matrix_size:Vector3):
	free_all_children(self)
	for x in range(static_matrix_size.x):
		for y in range(static_matrix_size.y):
			for z in range(static_matrix_size.z):
				var instance:Node3D
				match entity_matrix[x][y][z].name:
					"ground": 
						instance = ground.instantiate()
						instance.setup_dir(entity_matrix[x][y][z].in_array)
					"grass": instance = grass.instantiate()
					"portal": instance = portal.instantiate()
					"piston": instance = piston.instantiate()
					"piston_head": instance = piston_head.instantiate()
					"player": instance = player.instantiate()
					_: instance = air.instantiate()
				instance.position = Vector3(x,y,z)
				
				add_child(instance)

func free_all_children(parent_node):
	# Get all children as an array.
	# We iterate over a copy of the array (using .duplicate()) or iterate backwards
	# because deleting nodes while iterating forwards can cause issues.
	var children = parent_node.get_children()
	for child in children:
		child.queue_free()
