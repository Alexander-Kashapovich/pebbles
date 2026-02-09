@abstract
extends Resource
class_name CSExecutor

signal finished


var d:DialoguePanel
var pl:Player
var boss:Boss

@abstract
func start() -> void

func lg(s:String) -> void:
	Lg.add("%s -> %s" % [get_script().get_global_name(),s])
