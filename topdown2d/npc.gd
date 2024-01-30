extends StaticBody2D
var player = null
var uienable = false
var npcid = 1
@onready var sprite = self
@onready var ui = $ui
# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.visible = true

func handlecollision():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if uienable: 
		ui.visible = true
		Global.nearestnpc = 1
	else:
		ui.visible = false
		Global.nearestnpc = 0
	if Input.is_action_just_pressed("interact") and Global.currentlyinteracting == false and Global.nearnpc:
		sprite.visible = true
		Global.currentlyinteracting = true
		Global.convo = 0
	elif Input.is_action_just_pressed("interact") and Global.currentlyinteracting == true and Global.nearnpc:
		sprite.visible = false
		Global.currentlyinteracting = false
		Global.speak == "Hi! Im GD!"
		Global.convo = 1

func _on_rigid_body_2d_body_entered(body):
	if body.is_in_group(player):
		uienable = true
		Global.nearnpc = true


func _on_rigid_body_2d_body_exited(body):
	if body.is_in_group(player):
		uienable = false


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		uienable = true
		Global.nearnpc = true


func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		uienable = false
		Global.nearnpc = false
