extends RigidBody2D
class_name Rootbullet
@onready var timer = $Timer
@onready var timer2 = $Timer2
var bullet_speed = 400
var cooldown = true
var spread = 0.4
# Called when the node enters the scene tree for the first time.
func _ready():
	self.rotation = global_position.angle_to_point(Global.player_global_position) + randf_range(-spread, spread)
	self.linear_velocity = Vector2.from_angle(self.rotation) * bullet_speed
	timer.start()
	await timer.timeout
	self.queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func coolfunc():
	timer2.start()
	await timer2.timeout


func _on_area_2d_body_entered(body):
	if body.is_in_group("player") and cooldown:
		Global.health = Global.health - (10-Global.def)
		print(Global.health)
		cooldown = false
		coolfunc()
