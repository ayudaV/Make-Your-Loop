extends CanvasLayer

@export var directions_array = []
@export var rotation_speed: float = 5.0
@export var current_rotation = 360
@export var current_rotation_label = 0
var dict = {"right":"E", "down":"S", "left":"W", "up":"N"}
func _process(delta: float) -> void:
	if len(directions_array) < 4:
		if Input.is_action_just_pressed("Right"):
			self.append_dir("right")
		if Input.is_action_just_pressed("Left"):
			self.append_dir("left")
		if Input.is_action_just_pressed("Up"):
			self.append_dir("up")
		if Input.is_action_just_pressed("Down"):
			self.append_dir("down")
		
func append_dir(dir):
	print("aaa")
	directions_array.append(dir)
	match len(directions_array):
		1: %L1.text = dict[dir]
		2: %L2.text = dict[dir]
		3: %L3.text = dict[dir]
		4: %L4.text = dict[dir]
	current_rotation -= 90
	current_rotation_label += 90
func _physics_process(delta):
	%CommandWheel.rotation = lerp_angle(%CommandWheel.rotation, deg_to_rad(current_rotation), rotation_speed * delta)
	for child in %CommandWheel.get_children():
		child.rotation = lerp_angle(child.rotation, deg_to_rad(current_rotation_label), rotation_speed * delta)
