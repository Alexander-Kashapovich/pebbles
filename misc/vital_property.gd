extends Resource
class_name VitalProperty

@export var max_val:float = 100

var _val:float

signal modified(val:float)
signal out
signal full

func _init() -> void:
	_val = max_val

func fill() -> void:
	_val = max_val
	modified.emit(_val)
	full.emit()

func has(amount:float) -> bool:
	return 1 if (_val - amount) > 0 else 0

func percentage() -> float:
	return _val/max_val

func force_increase(amount:float) -> void:
	_val += amount
	if _val >= max_val:
		full.emit()
		_val = max_val
	modified.emit(_val)

func force_decrease(amount:float) -> void:
	_val -= amount
	if _val < 0:
		_val = 0
		out.emit()
	modified.emit(_val)
