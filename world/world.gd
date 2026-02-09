extends Node2D
class_name World

func _ready() -> void:
	$CutSceneMng.start()

func  to_mm() -> void:
	var mm = load("res://main_menu/main_menu.tscn").instantiate()
	add_sibling(mm)
	queue_free()
