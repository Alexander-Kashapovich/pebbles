extends Node2D
class_name Boss

@export var hp:VitalProperty

signal phase_ended
func _ready() -> void:
	hp.out.connect(phase_end)
func attack() -> void:
	pass

func apply_damage(val:float) -> void:
	hp.force_decrease(val)
	$Sound.play()

func phase_end() -> void:
	phase_ended.emit()
	$PhaseMusic._change_phase()
