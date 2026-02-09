extends CSExecutor
class_name CSE_Dialogue

@export var text:Dialogue

func start() -> void:
	lg("start text " + text.textes[0] + ".....")
	d.dialogue_end.connect(finished.emit,CONNECT_ONE_SHOT)
	d.start(text)
