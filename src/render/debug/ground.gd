extends MeshInstance3D

func setup_dir(directions:Array):
	for dir in directions:
		match dir:
			Vector3.BACK: $BACK.visible = false
			Vector3.FORWARD: $FORWARD.visible = false
			Vector3.RIGHT: $RIGHT.visible = false
			Vector3.LEFT: $LEFT.visible = false
