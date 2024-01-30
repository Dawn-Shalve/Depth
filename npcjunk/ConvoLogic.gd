extends Node
var GD = {
	"Start":"Hi! I'm Rowan!",
	 "Choice1":{
		"Choice1-GD":{
			"Choice1-1GD":"Thats Rude, but how do you do?",
			"Choice1-2GD":"Hi! how are you?",
			"Choice1-3GD":"Uhhh... What? how about a how are you",
			"Choice1-4GD":"Okay... but how are you"
		},
		"Choice1-PLOP":{
			"Choice1-PLOP1":"Screw you",
			"Choice1-PLOP2":"Hi!",
			"Choice1-PLOP3":"Whats 9+10",
			"Choice1-PLOP4":"Bye!",
		},
		}
		}



# Called when the node enters the scene tree for the first time.
func _ready():
	Global.start = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.convo == 1:
		if Global.phase == 0:
			if Global.start == false:
				Global.speak = GD.get("Start")
				Global.start = true
			Global.option1 = GD["Choice1"]["Choice1-PLOP"]["Choice1-PLOP1"]
			Global.option2 = GD["Choice1"]["Choice1-PLOP"]["Choice1-PLOP2"]
			Global.option3 = GD["Choice1"]["Choice1-PLOP"]["Choice1-PLOP3"]
			Global.option4 = GD["Choice1"]["Choice1-PLOP"]["Choice1-PLOP4"]
		if Global.option == 1:
			Global.speak = GD["Choice1"]["Choice1-GD"]["Choice1-1GD"]
			Global.phase+1
		if Global.option == 2:
			Global.speak = GD["Choice1"]["Choice1-GD"]["Choice1-2GD"]
			Global.phase+1
		if Global.option == 3:
			Global.speak = GD["Choice1"]["Choice1-GD"]["Choice1-3GD"]
			Global.phase+1
		if Global.option == 4:
			Global.speak = GD["Choice1"]["Choice1-GD"]["Choice1-4GD"]
			Global.phase+1
	if Global.phase == 2:
		pass
	
