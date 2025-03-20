extends Control

func _ready():
	$MarginContainer/VBoxContainer/Versus.grab_focus()

func _on_versus_pressed():
	get_tree().change_scene_to_file("res://character_select.tscn")

func _on_training_pressed():
	get_tree().change_scene_to_file("res://character_select.tscn")

func _on_settings_pressed():
	get_tree().change_scene_to_file("res://settings.tscn")

func _on_quit_pressed():
	get_tree().quit()
