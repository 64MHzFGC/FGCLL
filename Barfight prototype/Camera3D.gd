extends Node3D



func _physics_process(delta):
	
	var posdiff = (get_parent().get_node("P1").position.x - get_parent().get_node("P2").position.x)
	var negdiff = posdiff * -1
	
	position.x = (get_parent().get_node("P1").position.x + get_parent().get_node("P2").position.x)/2
	if posdiff <= 2:
		position.z = (get_parent().get_node("P1").position.x - get_parent().get_node("P2").position.x + 0.1 * negdiff) / -1
	if posdiff >= -2:
		position.z = (get_parent().get_node("P1").position.x - get_parent().get_node("P2").position.x + 0.1 * posdiff) / 1
	if position.z >= 11.4:
		position.z = 11.4
	if position.z <= 9.4:
		position.z = 9.4
	position.y = position.z / 1000 + 2.1
	if position.y <= 2.1:
		position.y = 2.1
