extends Node2D
var cutscenehasplayed = false
@onready var anim = $anim
@onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		horrorcutscene()



func horrorcutscene():
	if not cutscenehasplayed:
		Global.movement = false
		Global.cutsceneactive = true
		Global.convo = 2
		Global.cutscene = 1
		anim.play("horror cutscene")
		await anim.animation_finished
		Global.cutscenedialog == 1
		await $Control/ColorRect/VBoxContainer/Button.pressed or $Control/ColorRect/VBoxContainer/Button2.pressed or $Control/ColorRect/VBoxContainer/Button3.pressed or $Control/ColorRect/VBoxContainer/Button4.pressed
		timer.wait_time = 5
		$Control/ColorRect/VBoxContainer/Button.visible = false
		$Control/ColorRect/VBoxContainer/Button2.visible = false
		$Control/ColorRect/VBoxContainer/Button3.visible = false
		$Control/ColorRect/VBoxContainer/Button4.visible = false
		timer.start()
		await timer.timeout
		anim.play("horror cutscene2")
		await anim.animation_finished
		anim.play("fade out")
		await anim.animation_finished
		get_tree().change_scene_to_file("res://topdown2d/cabin.tscn")

func transferto3dplatformer():
	get_tree().change_scene_to_file("res://3dplatformer/world.tscn")


func _on_area_2d_2_body_entered(body):
	if body.is_in_group("player"):
		transferto3dplatformer()
