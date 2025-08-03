class_name GameController extends Node

var loop_position=0
@export var loop_size:int
@export var level:LevelMetadata
@export var loop_array:Array[Vector3]

var level_matrix
var matrix_size
var entity_matrix 
var player 
var can_move = false
func _ready() -> void:
	Globals.game_controller=self
	start_level()
	
func _process(delta: float) -> void:
	if can_move:
		player.move(loop_array[loop_position])
		loop_position=(loop_position+1)%loop_size
		can_move = false
		%Timer.start(2)
		
func start_level():
	level_matrix=level.static_matrix
	matrix_size=level.static_matrix_size
	entity_matrix=level_matrix.duplicate(true)
	for x in range(matrix_size.x):
		for z in range(matrix_size.z):
			for y in range(matrix_size.y):
				if level_matrix[x][z][y]=="ground":
					entity_matrix[x][z][y]=Ground.new()
					entity_matrix[x][z][y].position=Vector3(x,z,y)
				elif level_matrix[x][z][y]=="air":
					entity_matrix[x][z][y]=Air.new()
					entity_matrix[x][z][y].position=Vector3(x,z,y)
				elif level_matrix[x][z][y]=="player":
					player=Player.new()
					entity_matrix[x][z][y]=player
					Globals.player=player
					entity_matrix[x][z][y].position=Vector3(x,z,y)
					
	can_move=true

func get_element(position):
	return entity_matrix[position[0]][position[1]][position[2]]
	
func set_element(position,value):
	entity_matrix[position[0]][position[1]][position[2]]=value
	var string
	if value is Player:
		string="player"
	else: 
		string="air"
	level_matrix[position[0] as int][position[1] as int][position[2]as int]=string

func _on_timer_timeout() -> void:
	can_move = true
