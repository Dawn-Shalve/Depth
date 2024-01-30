extends CharacterBody2D

var currentlyinteracting = false
var movement = true
const SPEED = 150.0
const JUMP_VELOCITY = -400.0
var justinteracted = false
@onready var timer = $Timer
@onready var interaction = $Camera2D/interact

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	add_to_group("player")
	currentlyinteracting = false

func _physics_process(delta):
	# Add the gravity.
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction and movement:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var directiony = Input.get_axis("up","down")
	if directiony and movement:
		velocity.y = directiony * SPEED
	else:
		velocity.y = move_toward(velocity.y,0,SPEED)
	move_and_slide()

func _process(delta):
	if Input.is_action_just_pressed("interact") and Global.currentlyinteracting == false and Global.nearnpc:
		interaction.visible = true
		movement = false
		Global.currentlyinteracting = true
		justinteracted = true
	elif Input.is_action_just_pressed("interact") and Global.currentlyinteracting == true and Global.nearnpc:
		interaction.visible = false
		movement = true
		Global.currentlyinteracting = false
	if Input.is_action_just_pressed("pause"):
		pass


func _on_timer_timeout():
	justinteracted = false
