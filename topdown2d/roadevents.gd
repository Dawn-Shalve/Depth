extends Node2D
var cutscenehasplayed = false
@onready var anim = $anim
@onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.continuecut:
		anim.play("blank")
		Global.continuecut = false


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		horrorcutscene()



func horrorcutscene():
	if not cutscenehasplayed:
		Global.movement = false
		Global.cutsceneactive = true
		Global.canint = false
		Global.convo = 2
		Global.cutscene = 1
		anim.play("horror cutscene")
		
		await anim.animation_finished
		Global.interactionvisible = true
		await Global.bigdickrandy
		timer.wait_time = 2.5
		timer.start()
		await timer.timeout
		Global.interactionvisible = false
		Global.cutscenedialog == 1
		anim.play("horror cutscene2")
		await anim.animation_finished
		anim.play("fade out")
		await anim.animation_finished
		Global.clear.emit()
		get_tree().change_scene_to_file("res://topdown2d/cabin.tscn")

func transferto3dplatformer():
	get_tree().change_scene_to_file("res://3dplatformer/world.tscn")


func _on_area_2d_2_body_entered(body):
	if body.is_in_group("player"):
		transferto3dplatformer()
