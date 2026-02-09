extends Control
class_name PropertyBar
## only UI component

@onready var val_bar:ColorRect = $Val
@onready var tmp_bar:ColorRect = $Tmp
@onready var particle:GPUParticles2D = $Val/Particle

@export 
var _max_val:float
var _cur:float


@export var unit:Node
@export var property:StringName = &"hp"

func _ready() -> void:
	set_process(0)
	if not unit.is_node_ready():
		await unit.ready
	var prop:VitalProperty = unit.get(property)
	setup(prop)
	
	val_bar.size = size
	tmp_bar.size = size
func setup(prop:VitalProperty) -> void:
	_max_val = prop.max_val
	prop.modified.connect(_set_cur)
	
	#bad
	_set_cur(prop._val)

func _set_cur(new_val:float) -> void:
	
	#upd bars must be earlier condition check
	var old_val:float = _cur
	
	_cur = clamp(new_val,0,_max_val)
	_upd_bars()
	
	if new_val < old_val:
		_particle_shot(old_val - new_val)
		set_process(1)
	else:
		set_process(0)
		#for this
		tmp_bar.size.x = val_bar.size.x
	


func _upd_bars() -> void:
	#reversed
	#(1 - _cur/_max_val)
	#val_bar.position = size * (1 - cur/max)
	val_bar.size.x = size.x * _cur/_max_val

func _particle_shot(amount:float) -> void:
	
	particle.position = val_bar.position + Vector2(
		val_bar.size.x,
		val_bar.size.y/2
		)

	particle.amount_ratio = 0.2 + 0.8*(amount/_max_val)
	particle.restart()

func _process(delta: float) -> void:
	#reversed
	#tmp_bar.position.x += (-tmp_bar.position.x + val_bar.position.x) * delta
	tmp_bar.size.x += (-tmp_bar.size.x + val_bar.size.x) * delta
	
	if (-tmp_bar.size.x + val_bar.size.x > 5):
		tmp_bar.size = val_bar.size
		set_process(0)
