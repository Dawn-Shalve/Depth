extends Node
var nearestnpc = 0
var nearnpc = false
var firstint = false
var currentlyinteracting = false
var phase = 0
var convo = 0
var location = 0
var monster = 0
var convoinfluence = 0
var option = 0
var optionchanged = false
var start = false
var speak = "BLANK"
var option1 = "BLANK"
var option2 = "BLANK"
var option3 = "BLANK"
var option4 = "BLANK"
var choices = {
	"GD":{"test":1,},
	"Option1": 0,
	"Option2": 0,
	"Option3": 0,
}
# Called when the node enters the scene tree for the first time.


func _ready():
	nearestnpc = false
	nearnpc = false
	currentlyinteracting = false
	phase = 0
	convo = 0
	option = 0
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	if Input.is_action_just_pressed("devmenu"):
		get_tree().change_scene_to_file("res://devitems/menuswap.tscn")
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if Input.is_action_just_pressed("interact") and Global.currentlyinteracting == false and Global.nearnpc:
		currentlyinteracting = true
	elif Input.is_action_just_pressed("interact") and Global.currentlyinteracting == true and Global.nearnpc:
		currentlyinteracting = false
	elif Input.is_action_just_pressed("interact") and Global.currentlyinteracting == false and Global.nearnpc and firstint == false:
		firstint = true
		currentlyinteracting = false
		convo = 0
	if Input.is_action_just_pressed("pause"):
		pass

