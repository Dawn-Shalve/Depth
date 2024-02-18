extends RichTextLabel
@onready var timer = $"../Timer"
@onready var anim = $"../AnimationPlayer"
var talked = false
var canpress = false
var lastsaid = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.clear.connect(fun)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$"../ColorRect/VBoxContainer/Button".text = Global.option1
	$"../ColorRect/VBoxContainer/Button2".text = Global.option2
	$"../ColorRect/VBoxContainer/Button3".text = Global.option3
	$"../ColorRect/VBoxContainer/Button4".text = Global.option4
	if Global.cutsceneactive:
		if not talked:
			talked = true
			_dialoguecutscene( Global.speak )
	if Input.is_action_just_pressed("interact") and Global.canpress:
		self.clear()
		_dialoguecutscene( Global.speak )
	



func _dialoguecutscene( string ):
	lastsaid = string
	
	Global.canpress = false
	for letter in string:
		timer.start()
		self.add_text( letter )
		await timer.timeout
		if Global.breaktext:
			self.clear()
			Global.breaktext = false
			break
	Global.canpress = true
	


func _on_button_pressed():
	if Global.canpress == true:
		Global.option = 1
		Global.nextline = true
		self.clear()
		timer.start()
		timer.wait_time = .8
		await timer.timeout
		timer.wait_time = 0.05
		Global.breaktext = false
		_dialoguecutscene( Global.speak )
		
		

func fun():
	self.clear()
