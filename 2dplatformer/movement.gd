extends CharacterBody2D
var dashmodifier = 1.5

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if Input.is_action_just_pressed("dash"):
		var input_dir = Input.get_vector("left", "right", "up", "down")
		var direction = (Vector2(input_dir.x, input_dir.y)).normalized()
		global_position += direction * dashmodifier * SPEED
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_pressed("crouch"):
		if is_on_floor():
			global_position += Vector2(0,-1)
		else:
			global_position += Vector2(0,-2.5)
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
