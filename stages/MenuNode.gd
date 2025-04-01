extends Control

var button = 1

func _ready():
	if button == 1:
		$MarginContainer/VBoxContainer/Versus.grab_focus()
	if button == 2:
		$MarginContainer/VBoxContainer/Training.grab_focus()
	if button == 3:
		$MarginContainer/VBoxContainer/Settings.grab_focus()
	if button == 4:
		$MarginContainer/VBoxContainer/Quit.grab_focus()

func _on_versus_pressed():
	get_tree().change_scene_to_file("res://character_select.tscn")

func _on_training_pressed():
	get_tree().change_scene_to_file("res://training_char_select.tscn")

func _on_settings_pressed():
	get_tree().change_scene_to_file("res://settings.tscn")

func _on_quit_pressed():
	get_tree().quit()
