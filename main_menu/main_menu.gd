extends Control
class_name MainMenu

func _ready() -> void:
	$Go.pressed.connect(_go)
	$Exit.pressed.connect(get_tree().quit)
	
func _go() -> void:
	var world = load("res://world/world.tscn").instantiate()
	add_sibling(world)
	queue_free()
