extends RichTextLabel
@onready var timer = $"../Timer"
@onready var anim = $"../../AnimationPlayer"
var talked = false
var canpress = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$"../ColorRect/VBoxContainer/Button".text = Global.option1
	$"../ColorRect/VBoxContainer/Button2".text = Global.option2
	$"../ColorRect/VBoxContainer/Button3".text = Global.option3
	$"../ColorRect/VBoxContainer/Button4".text = Global.option4
	if Global.cutsceneactive:
		await anim.animation_finished
		if not talked:
			talked = true
			_dialoguecutscene( Global.speak )
			


func _dialoguecutscene( string ):
	Global.canpress = false
	for letter in string:
		timer.start()
		self.add_text( letter )
		await timer.timeout
	Global.canpress = true
	Global.phase = Global.phase + 1
	


func _on_button_pressed():
	if Global.canpress == true:
		Global.option = 1
		Global.nextline = true
		self.clear()
		_dialoguecutscene( Global.speak )
		
		


func _on_button_2_pressed():
	if Global.canpress == true:
		Global.option == 2
		Global.nextline = true
		self.clear()
		_dialoguecutscene( Global.speak )


func _on_button_3_pressed():
	if Global.canpress == true:
		Global.option == 3
		Global.nextline = true
		self.clear()
		_dialoguecutscene( Global.speak )

func _on_button_4_pressed():
	if Global.canpress == true:
		Global.option == 4
		Global.nextline = true
		self.clear()
		_dialoguecutscene( Global.speak )
