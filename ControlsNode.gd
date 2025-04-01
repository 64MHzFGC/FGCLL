extends Control

func _ready():
	$MarginContainer/VBoxContainer/Back.grab_focus()

func _on_back_pressed():
	get_tree().change_scene_to_file("res://settings.tscn")

func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		get_tree().change_scene_to_file("res://settings.tscn")
