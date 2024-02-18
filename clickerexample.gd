extends Button
var clicker = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$RichTextLabel.text = str("I have clicked this button ", clicker, " times!")


func _on_button_down():
	clicker = clicker + 1
