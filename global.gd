extends Node
var nearestnpc = 0
var nearnpc = false
var movement = true
var buttonpressed = false
var breaktext = false
var interactionvisible = false
var killed = [0]
var fightingid = null
var devmode = true
var checkid = 0
var nextline = false
var player_global_position = null
var currentbutton = 1
signal clearbattle
var selection = 0
var encounter = 0
var logglobal = null
var entityids = 1
var scenelog = null
var optionarray = []
var canchoose = false
signal bigdickrandy
signal clear
signal starttalking
signal computingdone
var desc = "BLANK"
var cabinanim = false
var canint = true
var def = 5
var bookinspect = false
var firstint = false
var cutsceneactive = false
var cutscene = 0 
var cutscenedialog = 0
var continuecut = false
var computingoption = false
var currentlyinteracting = false
var phase = 1
var npc = 0
var canpress = false
var convo = 0
var location = 0
var monster = 0
var convoinfluence = 0
var option = 0
var optionchanged = false
var health = 100
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
	if Input.is_action_just_pressed("DEVPRINT"):
		print("--------------------------------------------------")
		print(Global.currentbutton)
		print(ConvoLogic.maxoption)
		print(Global.movement)

