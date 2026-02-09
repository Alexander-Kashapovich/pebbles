extends PanelContainer
class_name PauseMenu

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		_switch()

func _ready() -> void:
	$"1/1/Resume".pressed.connect(_resume)
	$"1/1/Settings".toggled.connect(_settings)
	$"1/1/Exit".pressed.connect(_exit)
	visible = 0

func _switch() -> void:
	get_tree().paused = !get_tree().paused
	visible = !visible

func _resume() -> void:
	_switch()

func _settings(val:bool) -> void:
	pass

func _exit() -> void:
	owner.to_mm()
	get_tree().paused = !get_tree().paused
