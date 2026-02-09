extends Node2D
class_name Visual

enum Anima
{
	LOOP,
	ONE_SHOT
}

@export var sp:Sprite2D

var animators:Dictionary[Anima,Animator]
var cur_animator:Animator

func _ready() -> void:
	sp.centered = false
	
	var l: = LoopAnimator.new(sp)
	var on := OneShotAnimator.new(sp)
	add_child(l)
	add_child(on)
	animators[Anima.LOOP] = l
	animators[Anima.ONE_SHOT] = on
	cur_animator = l

func turn(dir:float) -> void:
	scale.x = dir

func set_tex(t:Texture2D,frames:int,behavior:Anima) -> void:
	cur_animator.stop()
	
	if animators[behavior] != cur_animator:
		cur_animator = animators[behavior]
	
	sp.texture = t
	
	sp.offset = Vector2(
		-t.get_width()/(2.0 * frames),
		-t.get_height())
	
	sp.hframes = frames
	
	if frames > 1:
		cur_animator.start()


#fps | spf
# 8 | 0.125
# 16
func set_fps(val:float) -> void:
	var spf = 1.0/val
	for a in animators.values():
		a.spf = spf
