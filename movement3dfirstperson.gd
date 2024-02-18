extends CharacterBody3D
@export var speed = 10
@export var jump_velocity = 4.5
var look_sensitivity = 0.01
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var velocity_y = 0
@onready var camera:Camera3D = $neck/Camera3D
func _physics_process(delta):
	var horizontal_velocity = Input.get_vector("left","right","up","down").normalized() * speed
	if Global.movement:
		velocity = horizontal_velocity.x * global_transform.basis.x + horizontal_velocity.y * global_transform.basis.z
	else:
		velocity = Vector3(0,0,0)
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity_y = jump_velocity
	else:
		velocity_y -= gravity * delta
		velocity.y = velocity_y
	move_and_slide()
	if Input.is_action_just_pressed("pause"): 
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE else Input.MOUSE_MODE_VISIBLE
func _input(event):
	if event is InputEventMouseMotion and Global.movement:
		rotate_y(-event.relative.x * look_sensitivity)
		camera.rotate_x(-event.relative.y * look_sensitivity)
		camera.rotation.x = clamp(camera.rotation.x, -PI/2, PI/2)