extends Control
class_name MainMenu

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		_quit()
func _ready() -> void:
	var buts = $"1/Buts/1/Buts".get_children()
	buts[0].pressed.connect(_continue)
	buts[1].pressed.connect(_freeplay)
	buts[2].pressed.connect(_settings)
	buts[3].pressed.connect(_quit)
	
	$"1/Settings/1/Buts/SFX".value_changed.connect(set_sfx)
	$"1/Settings/1/Buts/MUSIC".value_changed.connect(set_music)
	$"1/Settings/1/Buts/Return".pressed.connect(_return_to_menu)

func _continue() -> void:
	var world = load("res://world/world.tscn").instantiate()
	add_sibling(world)
	queue_free()

func _freeplay() -> void:
	pass

func set_sfx(val:float) -> void:
	AudioServer.set_bus_volume_linear(2,val)
	if not $SFX.playing:
		$SFX.play()

func set_music(val:float) -> void:
	AudioServer.set_bus_volume_linear(1,val)

func _settings() -> void:
	$"1/Buts".visible = 0
	$"1/Settings".visible = 1

func _return_to_menu() -> void:
	$"1/Buts".visible = 1
	$"1/Settings".visible = 0

func _quit() -> void:
	get_tree().quit()
