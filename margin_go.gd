extends MarginContainer

func _ready():
	await get_tree().create_timer(3).timeout
	show()
	await get_tree().create_timer(1).timeout
	hide()
