extends Node2D
class_name Player

@export var hp:VitalProperty

signal died

func _ready() -> void:
	hp.out.connect(die)

func attack() -> void:
	pass

func apply_damage(val:float) -> void:
	$Sound.play()
	hp.force_decrease(val)
	
func die() -> void:
	died.emit()
