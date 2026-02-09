extends Control

const SFX_ID:int = 1
@warning_ignore("narrowing_conversion")
var sfx_id_volume:int = AudioServer.get_bus_volume_db(SFX_ID)

const MUSIC_ID:int = 2
@warning_ignore("narrowing_conversion")
var music_id_volume:int = AudioServer.get_bus_volume_db(MUSIC_ID)

const STEP_VOLUME_CHANGE:int = 5
func _ready() -> void:
	$ButtonSFXPlus.pressed.connect(_sfx_plus_volume)
	$ButtonSFXMinus.pressed.connect(_sfx_minus_volume)
	
	$ButtonMusicPlus.pressed.connect(_music_plus_volume)
	$ButtonMusicMinus.pressed.connect(_music_minus_volume)
	
	$SFXVolume.text = str(sfx_id_volume)
	$MusicVolume.text = str(music_id_volume)

func _sfx_plus_volume():
	_change_volume(true, SFX_ID)
func _sfx_minus_volume():
	_change_volume(false, SFX_ID)
	
func _music_plus_volume():
	_change_volume(true, MUSIC_ID)
func _music_minus_volume():
	_change_volume(false, MUSIC_ID)
	
func _change_volume(plus, id):
	@warning_ignore("narrowing_conversion")
	var id_volume:int = AudioServer.get_bus_volume_db(id)
	if plus:
		id_volume += STEP_VOLUME_CHANGE
	else:
		id_volume -= STEP_VOLUME_CHANGE
	AudioServer.set_bus_volume_db(id, id_volume)
	
	
	if id == SFX_ID:
		$SFXVolume.text = str(id_volume)
	elif id == MUSIC_ID:
		$MusicVolume.text = str(id_volume)
