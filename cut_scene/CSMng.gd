extends Node
class_name CutSceneMng

@export_category("controls")
@export var dialogue:DialoguePanel
@export var died_menu:DiedMenu
@export var win_menu:WinMenu

@export_category("ctrls")

@export var pl_ctrl:PlayerController
@export var boss_ctrl:BossController

@export_category("")
@export var cs_start:CSExecutor
@export var cs_dying:CSExecutor
@export var cs_phases:Array[CSExecutor]
@export var cs_win:CSExecutor

var cur_phase_id:int = 0

var _lg:String

func _ready() -> void:
	pl_ctrl.pl.died.connect(_on_player_died)
	
	var all = [cs_start, cs_dying,cs_win]
	all.append_array(cs_phases)
	for cse:CSExecutor in all:
		cse.boss = boss_ctrl.boss
		cse.pl = pl_ctrl.pl
		cse.d = dialogue
	
func start() -> void:
	lg("Start")
	cs_start.finished.connect(_start_battle,CONNECT_ONE_SHOT)
	cs_start.start()

func _start_battle() -> void:
	lg("Start battle")
	boss_ctrl.boss.hp.fill()
	boss_ctrl.boss.phase_ended.connect(_next_boss_phase,CONNECT_ONE_SHOT)
	pl_ctrl.on()
	boss_ctrl.on()

func _next_boss_phase() -> void:
	pl_ctrl.off()
	boss_ctrl.off()
	
	if cur_phase_id == cs_phases.size():
		_to_last()
		return
	
	var e = cs_phases[cur_phase_id]
	lg("new phase %s" % cur_phase_id)
	cur_phase_id += 1
	
	e.finished.connect(_start_battle,CONNECT_ONE_SHOT)
	e.start()

func _on_player_died() -> void:
	lg("player died")
	boss_ctrl.off()
	pl_ctrl.off()
	cs_dying.finished.connect(_to_out,CONNECT_ONE_SHOT)
	cs_dying.start()
	
func _to_last() -> void:
	lg("boss died")
	cs_win.finished.connect(_level_win,CONNECT_ONE_SHOT)
	cs_win.start()

func _to_out() -> void:
	lg("to out")
	died_menu.open()

func _level_win() -> void:
	lg("to win") 
	win_menu.open()

func lg(s:String) -> void:
	Lg.add("CSMng -> %s" % s)
