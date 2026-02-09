extends PanelContainer
class_name DialoguePanel

var _d:Dialogue
var cur_id:int = 0

@onready var _timer:Timer = $Timer

signal dialogue_start
signal dialogue_end

func _ready() -> void:
	_timer.timeout.connect(_upd)

func start(d:Dialogue) -> void:
	lg("Started")
	visible = 1
	_d = d
	cur_id = 0
	_timer.start()
	_upd()
 
func _stop() -> void:
	_d = null
	visible = 0
	dialogue_end.emit()
	_timer.stop()

func _upd() -> void:
	if cur_id == _d.textes.size():
		_stop()
		return

	var stroka:String = _d.textes[cur_id]
	cur_id += 1
	_set_txt(stroka)

func _set_txt(s:String) -> void:
	lg("set text::" + s)
	$"1/Label".text = s

func lg(s:String) -> void:
	Lg.add("%s -> %s" % [get_script().get_global_name(),s])
