extends Control

var ControlVolume = 1
var ChangeVolume = -50

func _ready():
	$MarginContainer/VBoxContainer/Mainvolume.grab_focus()
	if Input.is_action_just_pressed("Move_leftp1"):
		ChangeVolume += 1
	if Input.is_action_just_pressed("Move_leftp2"):
		ChangeVolume -= 1
	if Input.is_action_just_pressed("Move_rightp1"):
		ChangeVolume += 1
	if Input.is_action_just_pressed("Move_rightp2"):
		ChangeVolume -= 1
	(get_parent().get_node("AudioNode/MarginContainer/VBoxContainer/ProgressBar").value) = 100 + ChangeVolume


func _on_back_pressed():
	get_tree().change_scene_to_file("res://settings.tscn")
