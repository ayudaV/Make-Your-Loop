class_name Entity

var position:Vector3
var name:String
var render:Node3D

func move_into(entity,direction): 
	pass
	
func move_over(entity,direction):
	pass

func can_move_over(entity,direction):
	return false
	
func can_move_into(entity,direction):
	return false

func load_render(parent:Node):
	parent.add_child(render)
	render.position = position
	
func update_render():
	render.update(position)
