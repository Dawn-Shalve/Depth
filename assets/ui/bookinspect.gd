extends RichTextLabel
@onready var timer = $"../Timer"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _dialoguebook( string ):
	for letter in string:
		timer.start()
		self.add_text( letter )
		await timer.timeout
	Global.phase = Global.phase + 1
