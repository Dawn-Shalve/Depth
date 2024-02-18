extends RichTextLabel
@onready var timer = $"../Timer2"

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.clear.connect(fun)
	Global.starttalking.connect(divertido)
	Global.clear.emit()
	await Global.computingdone
	Global.starttalking.emit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _dialoguefight( string ):
	for letter in string:
		timer.start()
		self.add_text( letter )
		await timer.timeout


func fun():
	self.clear()
	
func divertido():
	_dialoguefight( Global.desc )
