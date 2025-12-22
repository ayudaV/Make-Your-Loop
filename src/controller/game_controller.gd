class_name GameController extends Node

var loop_position=0
@export var loop_size:int=4
@export var loop_array:Array[Vector3]
@export var levels:Levels
@export var current_level:LevelMetadata
var level_index = 0

var level_matrix:Array
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
		%Timer.start(2)
		
func start_level():
	add_child(current_level.level_scenario.instantiate())
	level_matrix=current_level.static_matrix
	matrix_size=current_level.static_matrix_size
	entity_matrix=level_matrix.duplicate()
	for x in range(matrix_size.x):
		for z in range(matrix_size.z):
			for y in range(matrix_size.y):
				if level_matrix[z][x][y]=="grass":
					entity_matrix[z][x][y]=Grass.new(self, Vector3(x,y,z))
				elif level_matrix[z][x][y]=="ground":
					entity_matrix[z][x][y]=Ground.new(self, Vector3(x,y,z), [], [])
				elif level_matrix[z][x][y]=="air":
					entity_matrix[z][x][y]=Air.new(self, Vector3(x,y,z))
				elif level_matrix[z][x][y]=="player":
					player=Player.new(self, Vector3(x,y,z))
					entity_matrix[z][x][y]=player
				elif level_matrix[z][x][y]=="piston":
					entity_matrix[z][x][y]=Piston.new(self, Vector3(x,y,z))
				elif level_matrix[z][x][y]=="portal":
					var portal=Portal.new(self, Vector3(x,y,z))
					entity_matrix[z][x][y]=portal
					portal_list.append(portal)
	if portal_list.size()!=0:
		portal_list[0].connected_portal_position=portal_list[1].position
		portal_list[1].connected_portal_position=portal_list[0].position
	setup_finished=true
func get_element(position):
	return entity_matrix[position.z][position.x][position.y]
	
func set_element(position,value):
	entity_matrix[position.z][position.x][position.y]=value


func _on_timer_timeout() -> void:
	can_move = true
