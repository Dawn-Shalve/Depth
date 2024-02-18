extends VBoxContainer
var cooldown = true
@onready var anim = $"../../AnimationPlayer"
@onready var timer = $"../../Timer2"
@onready var buttpress = $Button
var optionarraylist = 1
var currentbutton = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var max = ConvoLogic.maxoption
	anim.play(str(currentbutton))
	if ConvoLogic.option1visible:
		$Button.visible = true
	else:
		$Button.visible = false
	if ConvoLogic.option2visible :
		$Button2.visible = true
	else:
		$Button2.visible = false
	if ConvoLogic.option3visible:
		$Button3.visible = true
	else:
		$Button3.visible = false
	if ConvoLogic.option4visible:
		$Button4.visible = true
	else:
		$Button4.visible = false
	var buttoncontrols = Input.get_axis("ui_down","ui_up")
	##Gets Button Axis and then increases or decreases currentbutton and wraps it
	if buttoncontrols:
		if buttoncontrols == 1 and cooldown:
			cooldown = false
			coolfunc()
			currentbutton = currentbutton + 1
			currentbutton = wrapi(currentbutton, 1, ConvoLogic.maxoption)
			print("check  ", currentbutton)
		if buttoncontrols == -1 and cooldown:
			cooldown = false
			coolfunc()
			currentbutton = currentbutton - 1
			currentbutton = wrapi(currentbutton, 1, ConvoLogic.maxoption)
			print("check  ", currentbutton)
	if Input.is_action_just_pressed("select"):
		if Global.canchoose:
			Global.selection = true
			Global.optionarray.append(Global.currentbutton)
			buttpress.emit_signal("pressed")
			print(Global.optionarray)
		else:
			buttpress.emit_signal("pressed")

func coolfunc():
	timer.start()
	await timer.timeout
	cooldown = true
