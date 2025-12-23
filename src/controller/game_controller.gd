class_name GameController extends Node

var loop_position=0
@export var loop_size:int=4
@export var loop_array:Array[Vector3]
@export var levels:Levels
@export var current_level:LevelMetadata
var level_index = 0

var matrix_size:Vector3
var entity_matrix:Array
var player:Player
var can_move = false
var portal_list=[]
var setup_finished=false
func reset():
	can_move = false

func _ready() -> void:
	Globals.game_controller=self
	Globals.reset.connect(reset)
	current_level = levels.levels[level_index]
	start_level()
	
func _process(delta: float) -> void:
	if can_move and setup_finished:
		player.move(loop_array[loop_position])
		loop_position=(loop_position+1)%loop_size
		can_move = false
		%Render.render_matrix(entity_matrix, matrix_size)
		%Timer.start(2)
		
func start_level():
	var level_instance = current_level.level_scenario.instantiate()

	add_child(level_instance)
	entity_matrix=current_level.get_level_matrix(level_instance)
	matrix_size=current_level.static_matrix_size
	player=current_level.get_player()
	add_child(Node3D.new())
	setup_finished=true
	%Render.render_matrix(entity_matrix, matrix_size)

func get_element(position):
	return entity_matrix[position.x][position.y][position.z]
	
func set_element(position,value):
	entity_matrix[position.x][position.y][position.z]=value


func _on_timer_timeout() -> void:
	can_move = true
