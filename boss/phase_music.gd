extends AudioStreamPlayer

const MUSIC_PHASES:Dictionary[int, AudioStream] = {
	0:preload("res://Music/phase1.mp3"),
	1:preload("res://Music/phase2.mp3"),
	2:preload("res://Music/phase3.mp3"),
	3:preload("res://Music/phase4.mp3"),
}
var current_phase:int = 0
func _change_phase():
	if current_phase < 3:
		current_phase +=1
		stream = MUSIC_PHASES[current_phase]
		play()
