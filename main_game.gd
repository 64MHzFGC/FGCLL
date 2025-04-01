extends Node3D


func _ready():
	(get_parent().get_node("WORLD/P1/Hitboxes/LPp1").position.z) = -25
	(get_parent().get_node("WORLD/P2/Hitboxes/LPp2").position.z) = -25
	await get_tree().create_timer(3).timeout
	(get_parent().get_node("WORLD/P1/Hitboxes/LPp1").position.z) = -20
	(get_parent().get_node("WORLD/P2/Hitboxes/LPp2").position.z) = -20
