extends Area2D
var cool = true
@onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


		

func coolfunc():
	cool = false
	timer.start()
	await timer.timeout
	cool = true

func _on_body_entered(body):
	if body.is_in_group("Player") and cool:
		Global.health -= 20
		print("imma kill you")
		coolfunc()
