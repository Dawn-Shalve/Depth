extends Node2D
@onready var anim = $AnimationPlayer
@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	if not Global.cabinanim:
		cabinevent1()
		Global.convo = 3
	else:
		Global.movement = false
		anim.play("cabin_1_2")
		await anim.animation_finished
		Global.movement = true
		Global.canint = true
		$Control.visible = false
		anim.play("cabin_2")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.continuecut:
		anim.play("blank")
		Global.continuecut = false


func cabinevent1():
	Global.clear.emit()
	Global.movement = false
	Global.canint=false
	Global.npc = 1
	Global.convo = 3
	Global.cutsceneactive = true
	anim.play("cabin_1")
	await anim.animation_finished
	await anim.animation_finished
	$Control.visible = false
	$Camera2D.enabled = false
	Global.cutsceneactive = false
	Global.movement = true
	Global.cabinanim = true
	anim.play("cabin_2")
	Global.canint = true
