extends Control
@onready var inventorylist = $ItemList2
@onready var tab = $TabBar
@onready var zmenu = $"."
@onready var pain = $TextureRect
var firsthover = 1
var lasthover = 3
var helditemid = 0
var findkey = null
signal hugh
var check = 1
var firsthovery = [-2,-1,0]
var lasthovery = [25,26,27]
var nameguess = null
var positionindex = {
	"x1": -107,
	"x2": -65,
	"x3": -23,
	"y1": -46,
	"y2": -33,
	"y3": -20,
	"y4": -7,
	"y5": 6,
	"y6":19,
	"y7":32,
	"y8":45,
	"y9":59,
}
var posindx = {
	"x1":{
		"nums":[1,4,7,10,13,16,19,22,25]
	},
	"x2":{
		"nums":[2,5,8,11,14,17,20,23,26],
	},
	"x3":{
		"nums":[3,6,9,12,15,18,21,24,27]
	}
}
var currentx= 1
var currenty= 1
var currenthover = 1
var maxcurrent = 0
var currenttab = 0
var booltoggle = true
var minleft = 0
var maxright = 0
var cooldown = true
@onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	inventoryrender()
	lasthover = firsthover + 2
	Global.player_global_position = global_position
	maxcurrent = itemlogic.currentinventory.size()
	currenttab = int($TabBar.get_tab_count())
	if Input.is_action_just_pressed("select") and booltoggle == false and cooldown:
		cooldown = false
		coolfunc(1)
		handle_selection()
	if Input.is_action_just_pressed("zmenu"):
		togglezmenu(booltoggle)
	if currenttab == 1:
		inventorylist.clear()
	var buttonlock = Input.get_vector("left","right","up","down")
	if buttonlock and cooldown and booltoggle == false:
		cooldown = false
		coolfunc(0.5)
		if buttonlock == Vector2(-1,0):
			currentx -= 1
			currentx = wrapi(currentx,1,4)
			currenthover = posindx[str("x",currentx)]["nums"][int(currenty - 1)]
			print("(",currentx,",",currenty,")")
			print(currenthover)
			pain.position.x = positionindex[str("x",currentx)]
		if buttonlock == Vector2(1,0):
			currentx += 1
			currentx = wrapi(currentx,1,4)
			currenthover = posindx[str("x",currentx)]["nums"][int(currenty - 1)]
			print("(",currentx,",",currenty,")")
			print(currenthover)
			pain.position.x = positionindex[str("x",currentx)]
		if buttonlock == Vector2(0,-1):
			currenty -= 1
			currenty = wrapi(currenty,1,10)
			currenthover = posindx[str("x",currentx)]["nums"][int(currenty - 1)]
			print("(",currentx,",",currenty,")")
			print(currenthover)
			pain.position.y = positionindex[str("y",currenty)]
		if buttonlock == Vector2(0,1):
			currenty += 1
			currenty = wrapi(currenty,1,10)
			currenthover = posindx[str("x",currentx)]["nums"][int(currenty - 1)]
			print("(",currentx,",",currenty,")")
			print(currenthover)
			pain.position.y = positionindex[str("y",currenty)]
func inventoryrender():
	inventorylist.clear()
	var invamount = itemlogic.currentinventory.size()
	for x in invamount:
		var load = itemlogic.currentinventory[x]
		inventorylist.add_item(itemlogic.inventorydict[load]["Name"],(load(itemlogic.inventorydict[load]["Texture"])), false)

func coolfunc(int):
	timer.wait_time = int
	timer.start()
	await timer.timeout
	cooldown = true

func togglezmenu(bool):
	zmenu.visible = bool
	Global.movement = not bool
	booltoggle = not booltoggle
	coolfunc(0.5)
	inventoryrender()


func handle_selection():
	print(itemlogic.currentinventory)
	check = 0
	checkvar()
	await hugh
	
	
func checkvar():
	if currenthover > itemlogic.currentinventory.size():
		pass
	else:
		check += 1
		itemlogic.dropid = itemlogic.currentinventory[currenthover - 1]
		itemlogic.currentinventory.remove_at(currenthover - 1)
		hugh.emit()
		var platformer = load("res://logic/itemdrop.tscn").instantiate()
		get_tree().root.add_child(platformer)
		print(itemlogic.currentinventory)
