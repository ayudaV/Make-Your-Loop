extends Node3D
var air = preload("res://src/render/debug/air.tscn")
var grass = preload("res://src/render/debug/grass.tscn")
var ground = preload("res://src/render/debug/ground.tscn")
var portal = preload("res://src/render/debug/portal.tscn")
var piston = preload("res://src/render/debug/piston.tscn")
var piston_head = preload("res://src/render/debug/piston_head.tscn")
var player = preload("res://src/render/debug/player.tscn")
var box = preload("res://src/render/debug/box.tscn")

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
					"pistonHead": instance = piston_head.instantiate()
					"player": instance = player.instantiate()
					"box": instance = box.instantiate()
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
