extends Node

var s:String

func add(_s:String) -> void:
	s += "[%s] %s \n" % [Engine.get_process_frames(),_s]
