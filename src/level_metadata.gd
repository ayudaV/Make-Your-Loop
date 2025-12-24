class_name LevelMetadata extends Resource

@export var level_name: String
@export var static_matrix_size: Vector3
@export var level_scenario: PackedScene
var player: Player
var pistons: Array[Piston]
var boxes: Array[Box]

func get_player() -> Player:
	return player 
	
func get_pistons() -> Array[Piston]:
	return pistons 
func get_boxes() -> Array[Box]:
	return boxes 
	
func get_level_matrix(level_instance):
	var entity_matrix:Array[Array] = []
	var paths:Array[Node] = level_instance.get_node("Paths").get_children()
	var interactables:Array[Node] = level_instance.get_node("Interactables").get_children()
	var character = level_instance.get_node("Player") as PlayerRender
	player = Player.new(character.position, character)
	
	for x in range(static_matrix_size.x):
		entity_matrix.append([])
		for y in range(static_matrix_size.y):
			entity_matrix[x].append([])
			for z in range(static_matrix_size.z):
				entity_matrix[x][y].append(Air.new(Vector3(x, y, z)))

	for path:Paths in paths:
		entity_matrix[path.position.x][path.position.y][path.position.z] = Ground.new(
			path.position, 
			path.get_entrances(), 
			path.get_entrances())

	for interactable in interactables:
		match interactable.get_groups()[0]:
			"portal": 
				entity_matrix[interactable.position.x][interactable.position.y][interactable.position.z] = Portal.new(
					interactable.position, 
					interactable.get_entrances(), 
					interactable.get_entrances(),
					interactable.get_conected_portal_pos()
					)
			"piston": 
				var piston = Piston.new(interactable.position, interactable.is_open, interactable)
				entity_matrix[interactable.position.x][interactable.position.y][interactable.position.z] = piston
				pistons.append(piston)
			"box": 
				var box = Box.new(interactable.position, interactable)
				entity_matrix[interactable.position.x][interactable.position.y][interactable.position.z] = box
				boxes.append(box)

		entity_matrix[player.position.x][player.position.y][player.position.z] = player
	return entity_matrix
