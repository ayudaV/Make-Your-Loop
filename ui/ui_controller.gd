extends CanvasLayer

@export var rotation_speed: float = 5.0
@export var current_rotation = 360
@export var current_rotation_label = 0
var dict = {"right":"E", "down":"S", "left":"W", "up":"N"}
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Esc"):
		if Globals.paused:
			$AnimationPlayer.play("pause")
		else:
			$AnimationPlayer.play("despause")  
		Globals.paused = not Globals.paused

	if len(Globals.game_controller.loop_array) < 4:
		if Input.is_action_just_pressed("Right"):
			self.append_dir("right")
		if Input.is_action_just_pressed("Left"):
			self.append_dir("left")
		if Input.is_action_just_pressed("Up"):
			self.append_dir("up")
		if Input.is_action_just_pressed("Down"):
			self.append_dir("down")
	

func append_dir(dir):
	match dir:
		"right": Globals.game_controller.loop_array.append(Vector3.RIGHT)
		"left": Globals.game_controller.loop_array.append(Vector3.LEFT)
		"up": Globals.game_controller.loop_array.append(Vector3.FORWARD)
		"down": Globals.game_controller.loop_array.append(Vector3.BACK)

	match len(Globals.game_controller.loop_array):
		1: %L1.text = dict[dir]
		2: %L2.text = dict[dir]
		3: %L3.text = dict[dir]
		4: %L4.text = dict[dir]
	current_rotation -= 90
	current_rotation_label += 90
	if len(Globals.game_controller.loop_array) == 4:
		start()
		
func start():
	$AnimationPlayer.play("run")
	Globals.game_controller.can_move = true

func reset():
	%L1.text = ''
	%L2.text = ''
	%L3.text = ''
	%L4.text = ''
	Globals.game_controller.loop_array = []
	$Container.scale = Vector2(1, 1)
	
	
func _physics_process(delta):
	%CommandWheel.rotation = lerp_angle(%CommandWheel.rotation, deg_to_rad(current_rotation), rotation_speed * delta)
	for child in %CommandWheel.get_children():
		child.rotation = lerp_angle(child.rotation, deg_to_rad(current_rotation_label), rotation_speed * delta)


func _on_resume_button_up() -> void:
	$AnimationPlayer.play("despause")  
	Globals.paused = not Globals.paused

func _on_reset_button_up() -> void:
	Globals.reset.emit()
	reset()


func _on_exit_button_up() -> void:
	get_tree().quit()
