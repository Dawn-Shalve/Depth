extends CharacterBody2D

@onready var anim = $AnimationPlayer
@onready var cam = $Camera2D2
var currentlyinteracting = false
var movement = true
const SPEED = 150.0
const JUMP_VELOCITY = -400.0
var justinteracted = false
@onready var timer = $Timer
@onready var interaction = $Camera2D2/Control

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	anim.play("fade-in")
	if Global.logglobal:
		global_position=Global.logglobal
		Global.logglobal = null
	add_to_group("Player")
	currentlyinteracting = false

func _physics_process(delta):
	# Add the gravity.
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction and Global.movement:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var directiony = Input.get_axis("up","down")
	if directiony and Global.movement:
		velocity.y = directiony * SPEED
	else:
		velocity.y = move_toward(velocity.y,0,SPEED)
	move_and_slide()

func _process(delta):
	if Input.is_action_just_pressed("interact") and Global.currentlyinteracting == false and Global.nearnpc:
		interaction.visible = true
		Global.movement = false
		Global.currentlyinteracting = true
		Global.interactionvisible = true
		justinteracted = true
	elif Input.is_action_just_pressed("interact") and Global.currentlyinteracting == true and Global.nearnpc:
		interaction.visible = false
		Global.movement = true
		Global.breaktext = true
		Global.currentlyinteracting = false
		Global.interactionvisible = false
	if Global.cutsceneactive:
		cam.enabled = false
	else:
		cam.enabled = true
	if Global.interactionvisible:
		interaction.visible = true
	else:
		interaction.visible = false


func _on_timer_timeout():
	justinteracted = false
