extends MeshInstance3D

var color1 = Color(0.3,0.3,0.3,1)

func _input(event):
color1 = get_node(“InterfaceRoot/TabC_Colors/CP_Mesh”).get_pick_color()
