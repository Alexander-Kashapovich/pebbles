extends Node
class_name PlayerController

@export var pl:Player
@export var target:Boss

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		pl.attack()
		target.apply_damage(30)


func _ready() -> void:
	off()

func on() -> void:
	set_process_input(1)

func off() -> void:
	set_process_input(0)
