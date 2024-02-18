extends RichTextLabel
@onready var timer = $"../Timer"
var displayed = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.nearestnpc == 3 and Global.nearnpc and not displayed and Input.is_action_just_pressed("interact"):
		_dialoguebook( Global.speak )
		displayed =true



func _dialoguebook( string ):
	for letter in string:
		timer.start()
		self.add_text( letter )
		await timer.timeout
	Global.phase = Global.phase + 1
