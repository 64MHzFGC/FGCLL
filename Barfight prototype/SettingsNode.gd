extends Control

func _ready():
	$MarginContainer/VBoxContainer/Audio.grab_focus()

func _on_audio_pressed():
	get_tree().change_scene_to_file("res://audio.tscn")

func _on_video_pressed():
	get_tree().change_scene_to_file("res://video.tscn")

func _on_controls_pressed():
	get_tree().change_scene_to_file("res://controls.tscn")

func _on_back_pressed():
	get_tree().change_scene_to_file("res://stages/menu.tscn")
