extends Node3D



func _physics_process(delta):
	
	var posdiff = (get_parent().get_node("P1").position.x - get_parent().get_node("P2").position.x)
	
	position.x = (get_parent().get_node("P1").position.x + get_parent().get_node("P2").position.x)/2
	if posdiff <= 2:
		position.z = (posdiff * -0.9 + 1)
	if posdiff >= 2:
		position.z = posdiff / 0.9 - 1
	if position.z >= 11.4:
		position.z = 11.4
	if position.z <= 9.8:
		position.z = 9.8
	position.y = position.z / 500 + 2.1
	if position.y <= 2.1:
		position.y = 2.1
