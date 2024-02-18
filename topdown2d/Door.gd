extends StaticBody2D
var testy = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	doorswap(Global.buttonpressed)


func doorswap(bool):
	if bool:
		$Sprite2D.texture = load("res://assets/puzzles/dooropened.png")
		$CollisionShape2D.disabled = bool
	if bool == false:
		$Sprite2D.texture = load("res://assets/puzzles/doorclosed.png")
		$CollisionShape2D.disabled = bool
