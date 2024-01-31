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
		$Control.visible = false
		anim.play("cabin_2")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func cabinevent1():
	Global.movement = false
	Global.phase = 1
	Global.npc = 1
	Global.convo = 3
	Global.cutsceneactive = true
	anim.play("cabin_1")
	Global.convo = 3
	$Control/ColorRect/VBoxContainer/Button2.visible = false
	$Control/ColorRect/VBoxContainer/Button3.visible = false
	$Control/ColorRect/VBoxContainer/Button4.visible = false
	Global.npc = 1
	await anim.animation_finished
	await $Control/ColorRect/VBoxContainer/Button.pressed
	Global.npc = 2
	$Control/ColorRect/VBoxContainer/Button2.visible = true
	await $Control/ColorRect/VBoxContainer/Button.pressed or $Control/ColorRect/VBoxContainer/Button2.pressed
	$Control/ColorRect/VBoxContainer/Button2.visible = false
	await $Control/ColorRect/VBoxContainer/Button.pressed or $Control/ColorRect/VBoxContainer/Button2.pressed
	await $Control/ColorRect/VBoxContainer/Button.pressed or $Control/ColorRect/VBoxContainer/Button2.pressed
	Global.npc = 1
	await $Control/ColorRect/VBoxContainer/Button.pressed or $Control/ColorRect/VBoxContainer/Button2.pressed
	Global.npc = 2
	await $Control/ColorRect/VBoxContainer/Button.pressed or $Control/ColorRect/VBoxContainer/Button2.pressed
	await $Control/ColorRect/VBoxContainer/Button.pressed or $Control/ColorRect/VBoxContainer/Button2.pressed
	$Control.visible = false
	$Camera2D.enabled = false
	Global.cutsceneactive = false
	Global.movement = true
	Global.cabinanim = true
	anim.play("cabin_2")
