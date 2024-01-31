extends RichTextLabel
@onready var timer = $"../Timer"
@onready var timer2 = $"../Timer2"
var justclicked = false
var uiopen = false
var cantalk = true
var isrunning = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact") and Global.currentlyinteracting == false and Global.nearnpc:
		self.clear()
		Global.convo = 0
		uiopen = false
	elif Input.is_action_just_pressed("interact") and Global.currentlyinteracting == true and Global.nearnpc:
		uiopen = true
		Global.convo = 1
		_dialogue ( Global.speak )
	if justclicked:
		self.clear()
		justclicked = false
		_dialogue( Global.speak )
	if Global.cutsceneactive:
		if Global.cutscenedialog == 1:
			_dialoguecutscene( Global.speak )
			Global.cutscenedialog = 0
func _dialogue( string ):
	if not isrunning:
		isrunning = true
		cantalk = false
		for letter in string:
			if uiopen and justclicked == false and cantalk:
				timer.start()
				self.add_text( letter )
				await timer.timeout
			else:
				break
				cantalk = true
				
		isrunning = false
		cantalk = true
		
func _dialoguecutscene( string ):
	for letter in string:
		timer.start()
		self.add_text( letter )
		await timer.timeout

func _on_option_1_pressed():
	justclicked = true
	Global.option = 1


func _on_option_2_pressed():
	justclicked = true
	Global.option = 2



func _on_option_3_pressed():
	justclicked = true
	Global.option = 3



func _on_option_4_pressed():
	justclicked = true
	Global.option = 4

