extends MarginContainer

func _ready():
	await get_tree().create_timer(2).timeout
	show()
	await get_tree().create_timer(1).timeout
	hide()
