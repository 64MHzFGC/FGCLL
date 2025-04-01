extends Control
var paused = false


func pause():
	get_tree().paused = true
	show()
	paused = true
	$MarginContainer/VBoxContainer/Resume.grab_focus()

func resume():
	get_tree().paused = false
	paused = false
	hide()



func _process(delta):
	if paused == false:
		if Input.is_action_just_pressed("Pause"):
			pause()
		if Input.is_action_just_pressed("Select"):
			get_tree().reload_current_scene()



func _on_resume_pressed():
	resume()

func _on_default_settings_pressed():
	resume()
	get_tree().change_scene_to_file("res://settings.tscn")

func _on_training_settings_pressed():
	resume()
	get_tree().change_scene_to_file("res://settings.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_char_select_pressed():
	resume()
	get_tree().change_scene_to_file("res://character_select.tscn")
