extends Control

func _ready():
	$MarginContainer/VBoxContainer/Back.grab_focus()

func _on_resolution_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1920,1080))
		1:
			DisplayServer.window_set_size(Vector2i(1600,900))
		2:
			DisplayServer.window_set_size(Vector2i(1280,720))

func _on_back_pressed():
	get_tree().change_scene_to_file("res://settings.tscn")

func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		get_tree().change_scene_to_file("res://settings.tscn")
