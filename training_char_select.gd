extends Node3D


func _ready():
	$CharacterSelect/MarginContainer/HBoxContainer/Guy.grab_focus()
	get_parent().get_node("training_char_select/Node3D/P2BEAN").position.z = 7.25
	$CharacterSelect/MarginContainer/HBoxContainer2/SHINE.disabled = true

func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		get_tree().change_scene_to_file("res://stages/menu.tscn")


func _on_guy_pressed():
	get_parent().get_node("training_char_select/Node3D/P1BEAN").position.z = -4
	get_parent().get_node("training_char_select/Node3D/P1MAN").position.z = 7.25
	$CharacterSelect/MarginContainer/HBoxContainer2/SHINE.disabled = false
	$CharacterSelect/MarginContainer/HBoxContainer/SHINE.grab_focus()

func _on_bean_pressed():
	get_parent().get_node("training_char_select/Node3D/P1MAN").position.z = -4
	get_parent().get_node("training_char_select/Node3D/P1BEAN").position.z = 7.25
	$CharacterSelect/MarginContainer/HBoxContainer2/SHINE.disabled = false
	$CharacterSelect/MarginContainer/HBoxContainer/SHINE.grab_focus()

func _on_shine_pressed():
	get_tree().change_scene_to_file("res://training.tscn")
