extends Control

func _ready():
	$MarginContainer/VBoxContainer/Mainvolume.grab_focus()

func _on_volume_value_changed(value):
	AudioServer.set_bus_volume_db(0,value/5)

func _on_back_pressed():
	get_tree().change_scene_to_file("res://settings.tscn")

func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		get_tree().change_scene_to_file("res://settings.tscn")
