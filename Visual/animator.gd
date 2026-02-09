extends Node
class_name Animator

var sp:Sprite2D

var _acc:float

var spf:float = 0.125

func _init(_sp:Sprite2D) -> void:
	sp = _sp

func _ready() -> void:
	stop()

func start() -> void:
	set_process(1)
	sp.frame = 0

func stop() -> void:
	set_process(0)
