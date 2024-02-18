extends TextureProgressBar
var prevvalue = 0
var cool = true
@onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.value = Global.health
	if prevvalue != Global.health and cool:
		cool = false
		
		self.visible = true
		coolfunc()
	elif prevvalue == Global.health and cool:
		self.visible = false
	prevvalue = Global.health


func coolfunc():
	timer.start()
	await timer.timeout
	cool = true
