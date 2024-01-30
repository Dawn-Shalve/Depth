extends CharacterBody3D

@onready var char = $"."
@onready var pivot = $"../CamOrigin"
const SPEED = 5.0
const JUMP_VELOCITY = 4.5
@onready var TargetPath = $"."
@export var sens = 0.5
var camxrot = 0
var camyrot = 0
var charxrot = 0
var dashmodifier = 1.5
var dashing = false
var doublejump = 0
var charyrot = 0
var coins = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
func _physics_process(delta):
	# Add the gravity.
	if Input.is_action_just_pressed("crouch"):
		var input_dir = Input.get_vector("left", "right", "up", "down")
		var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if is_on_floor():
			global_position += Vector3(0,-1,0)
		else:
			global_position += Vector3(0,-2.5,0)
	
	if Input.is_action_just_pressed("dash"):
		var input_dir = Input.get_vector("left", "right", "up", "down")
		var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		global_position += SPEED * direction * dashmodifier
	
	if not is_on_floor():
		velocity.y -= gravity * delta
	if is_on_floor():
		doublejump = 0
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and doublejump <= 2:
		velocity.y = JUMP_VELOCITY
		doublejump = doublejump + 1
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	move_and_slide()
	
func _input(event):
	if event is InputEventMouseMotion:
		pivot.rotate_y(deg_to_rad(-event.relative.x * sens))
		pivot.rotate_x(deg_to_rad(-event.relative.y * sens))
		pivot.rotation.x = clamp(pivot.rotation.x, deg_to_rad(-45), deg_to_rad(45))
		pivot.rotation.z = clamp(pivot.rotation.x, deg_to_rad(0), deg_to_rad(0))
		char.rotate_y(deg_to_rad(-event.relative.x * sens))
		char.rotation.x = clamp(pivot.rotation.x, deg_to_rad(0), deg_to_rad(0))
		char.rotation.z = clamp(pivot.rotation.x, deg_to_rad(0), deg_to_rad(0))
		camxrot = pivot.rotation.x
		camyrot = pivot.rotation.y
		charxrot = char.rotation.x

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pass
