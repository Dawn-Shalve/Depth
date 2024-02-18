extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("Hard") or body.is_in_group("Player"):
		$Sprite2D.texture = load("res://assets/puzzles/puzzlebuttondown.png")
		Global.buttonpressed = true
		


func _on_body_exited(body):
	if body.is_in_group("Hard") or body.is_in_group("Player"):
		$Sprite2D.texture = load("res://assets/puzzles/puzzlebutton.png")
		Global.buttonpressed = false
