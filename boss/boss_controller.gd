extends Node
class_name BossController

@export var boss:Boss
@export var target:Player

@onready var _timer:Timer = $Timer

func _ready() -> void:
	_timer.timeout.connect(upd)
	off()

func on() -> void:
	_timer.start()

func off() -> void:
	_timer.stop()

func upd() -> void:
	boss.attack()
	target.apply_damage(30)
