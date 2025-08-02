class_name GameController extends Node

@export var loop_array:Array[Vector3]
var loop_position=0
@export var loop_size:int
@export var level:LevelMetadata

var level_matrix
var matrix_size
var entity_matrix 
var player
func _ready() -> void:
	Globals.game_controller=self
	start_level()
	loop()

func loop():
	while true:
		player.move(loop_array[loop_position])
		loop_position=(loop_position+1)%loop_size
func start_level():
	level_matrix=level.static_matrix
	matrix_size=level.static_matrix_size
	entity_matrix=level_matrix.duplicate()
	for i in range(matrix_size[0]):
		for j in range(matrix_size[1]):
			for k in range(matrix_size[2]):
				if entity_matrix[i][j][k]=="ground":
					entity_matrix[i][j][k]=Ground.new()
					entity_matrix[i][j][k].position=Vector3(i,j,k)
				elif entity_matrix[i][j][k]=="air":
					entity_matrix[i][j][k]=Air.new()
					entity_matrix[i][j][k].position=Vector3(i,j,k)
				elif entity_matrix[i][j][k]=="player":
					player=Player.new()
					entity_matrix[i][j][k]=player
					entity_matrix[i][j][k].position=Vector3(i,j,k)
					

func get_element(position):
	return entity_matrix[position[0]][position[1]][position[2]]
	
func set_element(position,value):
	entity_matrix[position[0]][position[1]][position[2]]=value
