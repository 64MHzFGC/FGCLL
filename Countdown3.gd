extends MarginContainer

func _ready():
	show()
	await get_tree().create_timer(1).timeout
	hide()
