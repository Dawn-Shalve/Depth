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
var road = {
	"Start":"You Shouldn't be here, it's dangerous",
	"Choice1":"...",
	"phase2":"Follow me."
}
var cabin = {
	"Rowan":{
		"Phase1":"Who are you?",
		"Phase2op1":"Stay Silent",
		"Phase2op2":"I don't know",
		"Phase5":"Rowan."
	},
	"Rhys":{
		"Phase1":"I’m Rhys. Im a monster hunter from around here. Why were you out there all alone?",
		"Phase3":"It doesn’t matter. There’s monsters out at night. You shouldn’t leave this cabin until dawn.",
		"Phase4":"What is your name, traveler?",
		"Phase6":"Rowan... Interesting name.",
		"Phase7":"Make yourself at home. I’ll make food, you look hungry.",
		"Neutral":"Foods not done yet, are you sure you don't want to look around"
	}
}
var optionplaceholders = {
	"arrow":"-->",
	"dot":"...",
	"blank":"BLANK",
}
var option1visible = true
var option2visible = true
var option3visible = true
var option4visible = true
var RHYSPHASE2skip = true
var maxoption = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.start = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.convo == 2:
		if Global.phase == 1:
			Global.speak = road.get("Start")
			Global.option1 = road["Choice1"]
			option2visible = false
			option3visible = false
			option4visible = false
			maxoption = 2
			if Global.nextline:
				Global.phase = Global.phase + 1
		if Global.phase == 2:
			Global.speak = road.get("phase2")
			Global.bigdickrandy.emit()
			
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
	if Global.convo == 3:
		if Global.phase == 1:
			Global.speak = cabin["Rowan"]["Phase1"]
			Global.option1 = optionplaceholders["arrow"]
			option2visible = false
			option3visible = false
			option4visible = false
			maxoption = 1
			if Global.nextline:
				Global.speak = cabin["Rhys"]["Phase1"]
				Global.phase = 2
				Global.npc = 1
				Global.option1 = cabin["Rowan"]["Phase2op1"]
				Global.option2 = cabin["Rowan"]["Phase2op2"]
				Global.canchoose = true
				option2visible = true
				option3visible = false
				option4visible = false
				maxoption = 3
				Global.nextline = false
				
		if Global.phase == 2:
			Global.speak = cabin["Rhys"]["Phase1"]
			Global.npc = 2
			if Global.nextline:
				Global.phase = 3
				Global.npc = 2
				Global.option1 = optionplaceholders["arrow"]
				Global.canchoose = false
				option2visible = false
				option3visible = false
				option4visible = false
				maxoption = 1
				Global.nextline = false
		if Global.phase == 3:
			Global.speak = cabin["Rhys"]["Phase3"]
			Global.npc = 2
			if Global.nextline:
				Global.phase = 4
				Global.npc = 2
				Global.nextline = false
				Global.option1 = optionplaceholders["arrow"]
				option2visible = false
				option3visible = false
				option4visible = false
		if Global.phase == 4:
			Global.speak = cabin["Rhys"]["Phase4"]
			if Global.nextline:
				Global.phase = 5
				Global.npc = 1
				Global.nextline = false
		if Global.phase == 5:
			Global.speak = cabin["Rowan"]["Phase5"]
			if Global.nextline:
				Global.phase = 6
				Global.npc = 2
				Global.nextline = false
		if Global.phase == 6:
			Global.speak = cabin["Rhys"]["Phase6"]
			if Global.nextline:
				Global.phase = 7
				Global.npc = 2
				Global.nextline = false
		if Global.phase == 7:
			Global.speak = cabin["Rhys"]["Phase7"]
			Global.npc = 2
			if Global.nextline:
				Global.phase = 8
				Global.nextline = false
		if Global.phase == 8:
			Global.continuecut = true
			Global.phase = 0
			if Global.nextline:
				Global.nextline = false
				Global.continuecut = true
	if Global.convo == 6:
		Global.speak = cabin["Rhys"]["Neutral"]

