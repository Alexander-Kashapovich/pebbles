extends PanelContainer
class_name DiedMenu


func _ready() -> void:
	$"1/1/Button".pressed.connect(_retry)
	visible = 0

func open() -> void:
	visible = 1

func _retry() -> void:
	owner.to_mm()
