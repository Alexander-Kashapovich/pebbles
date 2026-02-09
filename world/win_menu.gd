extends PanelContainer
class_name  WinMenu


func _ready() -> void:
	$"1/1/Button".pressed.connect(_win)
	visible = 0

func open() -> void:
	visible = 1

func _win() -> void:
	owner.to_mm()
