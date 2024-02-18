extends RigidBody2D
@onready var timer2 = $Timer2
var cooldown = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("player") and cooldown:
		Global.health = Global.health - (10-Global.def)
		print(Global.health)
		cooldown = false
		coolfunc()


func coolfunc():
	timer2.start()
	await timer2.timeout
