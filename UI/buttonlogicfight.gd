extends Node2D
var currentbutton = 1
var itemcurrent = 1
var roll = 0
var roll2 = 0
var enemydef = 0
var def = 5
var enemyhp = 0
@onready var pain = $Node2D/Sprite2D
var positionindex = {
	"x1":218,
	"x2":499,
	"x3":774,
	"x4":1055,
	"y1":38,
	"y2":162,
	"y3":286,
	"y4":410,
	"y5":534,
	"y6":658,
	"y7":782,
}
var posindx = {
	"x1":{
		"nums":[1,5,9,13,17,21,25]
	},
	"x2":{
		"nums":[2,6,10,14,18,22,26],
	},
	"x3":{
		"nums":[3,7,11,15,19,23,27]
	},
	"x4":{
		"nums":[4,8,12,16,20,24,28]
	}
}
@onready var enemybar = $TextureProgressBar2
signal done
@onready var timer = $Timer
@onready var itemlist = $Node2D
var desc = ""
@onready var timer2 = $Timer2
@onready var Roll = $Roll
@onready var Check = $Check
@onready var Def = $Def
@onready var dice = $TextureRect/dice
@onready var Run = $Run
var isrolling = false
signal select
@onready var Item = $Item
@onready var monsterimg = $port
@onready var anim = $AnimationPlayer
signal computingchanged
var cooldown = true
var encounter = 0
var currentx = 1
var currenty = 1
var currenthover = 1
var computing = false
var locking = 6
# Called when the node enters the scene tree for the first time.
func _ready():
	encounter = Global.encounter
	print(encounter)
	determinepic()
	getdetails(false)
	enemyhp = enemybar.max_value 
	enemybar.value = enemybar.max_value
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("select") and currentbutton == 3:
		cooldown = false
		coolfunc(0.5)
		get_tree().change_scene_to_file(Global.scenelog)
	if enemyhp <= 0 and cooldown:
		cooldown = false
		coolfunc(0.5)
		print("dead")
		Global.killed.append(Global.fightingid)
		Global.checkid = 1
		Global.fightingid = 0
		get_tree().change_scene_to_file(Global.scenelog)
	if Input.is_action_just_pressed("select") and isrolling and currentbutton == 5 and cooldown:
		cooldown = false
		checkvar()
	var itembutton = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	if itembutton and isrolling and cooldown:
		cooldown = false
		coolfunc(0.1)
		if itembutton == Vector2(-1,0):
			currentx -= 1
			currentx = wrapi(currentx,1,5)
			currenthover = posindx[str("x",currentx)]["nums"][int(currenty - 1)]
			print("(",currentx,",",currenty,")")
			print(currenthover)
			pain.position.x = positionindex[str("x",currentx)]
		if itembutton == Vector2(1,0):
			currentx += 1
			currentx = wrapi(currentx,1,5)
			currenthover = posindx[str("x",currentx)]["nums"][int(currenty - 1)]
			print("(",currentx,",",currenty,")")
			print(currenthover)
			pain.position.x = positionindex[str("x",currentx)]
		if itembutton == Vector2(0,-1):
			currenty -= 1
			currenty = wrapi(currenty,1,8)
			currenthover = posindx[str("x",currentx)]["nums"][int(currenty - 1)]
			print("(",currentx,",",currenty,")")
			print(currenthover)
			pain.position.y = positionindex[str("y",currenty)]
		if itembutton == Vector2(0,1):
			currenty += 1
			currenty = wrapi(currenty,1,8)
			currenthover = posindx[str("x",currentx)]["nums"][int(currenty - 1)]
			print("(",currentx,",",currenty,")")
			print(currenthover)
			pain.position.y = positionindex[str("y",currenty)]
	$TextureProgressBar.value = Global.health
	if Global.health <= 0:
		get_tree().change_scene_to_file("res://combat/death.tscn")
	if currentbutton == 1:
		Roll.texture = load("res://assets/ui/buttons/rollhover.png")
	else:
		Roll.texture = load("res://assets/ui/buttons/rolle.png")
	if currentbutton == 2:
		Check.texture = load("res://assets/ui/buttons/checkhover.png")
	else:
		Check.texture = load("res://assets/ui/buttons/check.png")
	if currentbutton == 3:
		Run.texture = load("res://assets/ui/buttons/RUNhover.png")
	else:
		Run.texture = load("res://assets/ui/buttons/Run.png")
	if currentbutton == 4:
		Def.texture = load("res://assets/ui/buttons/defhover.png")
	else:
		Def.texture = load("res://assets/ui/buttons/def.png")
	if currentbutton == 5:
		Item.texture = load("res://assets/ui/buttons/itemhover.png")
	else:
		Item.texture = load("res://assets/ui/buttons/item.png")
	var buttoncontrols = Input.get_axis("ui_left","ui_right")
	if buttoncontrols and isrolling == false:
		if buttoncontrols == 1 and cooldown:
			cooldown = false
			coolfunc(0.5)
			computing = true
			currentbutton = currentbutton + 1
			currentbutton = wrapi(currentbutton, 1, locking)
			print("check  ", currentbutton)
		if buttoncontrols == -1 and cooldown:
			cooldown = false
			coolfunc(0.5)
			computing = true
			currentbutton = currentbutton - 1
			currentbutton = wrapi(currentbutton, 1,locking)
			print("check  ", currentbutton)
	if Input.is_action_just_pressed("select") and cooldown and currentbutton == 1 and isrolling ==false:
		coolfunc(0.5)
		diceshow( true , true)
		anim.play("diceinitiate")
		isrolling = true
		locking = currentbutton
		await select
		anim.play("diceroll")
		timer2.wait_time = 5
		timer2.start()
		await timer2.timeout
		diceroll()
		timer2.wait_time = 0.5
		timer2.start()
		await timer2.timeout
		anim.play("dicedecide")
		var damage = roll + roll2
		var combined = damage - (enemydef - 3)
		enemyhp = enemyhp - (damage - (enemydef - 3))
		enemybar.value = enemyhp
		print(enemybar.value)
		var rolled = true
		damageanim(int(combined), true)
		timer2.wait_time = 5
		timer2.start()
		await timer2.timeout
		diceshow( false , true)
		
		openplatformer()
	if Input.is_action_just_pressed("select") and cooldown and isrolling == false and currentbutton == 2:
		Global.clear.emit()
		locking = 2
		isrolling = true
		getdetails(true)
	if Input.is_action_just_pressed("select") and cooldown and isrolling == false and currentbutton == 4:
		Global.clear.emit()
		isrolling = true
		Global.def = Global.def + 3
		openplatformer()
		await Global.clearbattle
		Global.def = Global.def - 3
	if Input.is_action_just_pressed("select") and isrolling and currentbutton == 1 and cooldown:
		select.emit()
	if Input.is_action_just_pressed("select") and not isrolling and currentbutton == 5 and cooldown:
		cooldown = false
		coolfunc(0.5)
		itemlist.visible = true
		pain.visible = true
		$TextureRect/RichTextLabel.visible = false
		isrolling = true
		itemlogic.word.emit()
		
		
	
		
	



func coolfunc(int):
	timer.wait_time = int
	timer.start()
	await timer.timeout
	cooldown = true


func determinepic():
	var name = ""
	if encounter == 1:
		monsterimg.texture = load("res://assets/monsters/treegoblin.png")
		anim.play("treegoblinscale")
		name = "Tree Goblin"
		Global.desc = str(name, " steps forth!")
		Global.computingdone.emit()
	if encounter == 2:
		monsterimg.texture = load("res://assets/Elijah Carter/portrait.png")
		anim.play("elijahscale")

func diceshow( bool,bool2 ):
	$TextureRect/RichTextLabel.visible = not bool2
	dice.visible = bool

func diceroll():
	roll = randi_range(1,3)
	roll2 = randi_range(4,6)
	toggledicevisible(roll,roll2,false)

func toggledicevisible(roll,roll2,bool):
	$"TextureRect/dice/1".visible = bool
	$"TextureRect/dice/2".visible = bool
	$"TextureRect/dice/3".visible = bool
	$"TextureRect/dice/4".visible = bool
	$"TextureRect/dice/5".visible = bool
	$"TextureRect/dice/6".visible = bool
	var visi1 = get_node("TextureRect/dice/" + str(roll))
	var visi2 = get_node("TextureRect/dice/" + str(roll2))
	visi1.visible = true
	visi2.visible = true
	
func openplatformer():
	itemlist.visible = false
	var platformer = load("res://2dplatformer/player.tscn").instantiate()
	self.add_child(platformer)
	timer2.start()
	await timer2.timeout
	startattack()
	
func startattack():
	if encounter == 1:
		var attackpattern = randi_range(1,2)
		print(attackpattern)
		if attackpattern == 1:
			attack1()
		if attackpattern == 2:
			attack2()
		if attackpattern == 3:
			attack3()


func attack1():
	for x in 16:
		var rootbullet: Rootbullet = load("res://combat/rootbullet.tscn").instantiate()
		add_child(rootbullet)
		timer2.wait_time = 0.3
		timer2.start()
		await timer2.timeout
	playerturn()
func attack2():
	for x in 1:
		anim.play("rootdaggerjump")
		await anim.animation_finished
	playerturn()
	
func attack3():
	pass


func damageanim(int, bool):
	$RichTextLabel.visible = bool
	$RichTextLabel.text = str(int)
	anim.play("damagetell")
	await anim.animation_finished
	$RichTextLabel.visible = not bool

func playerturn():
	locking = 6
	Global.clearbattle.emit()
	
	isrolling = false
	$TextureRect/RichTextLabel.visible = true
	if currentbutton == 1:
		toggledicevisible(roll,roll2,true)


func getdetails(bool):
	enemybar.set_max(Monsterdictionary.location2[encounter]["Health"])
	enemydef = Monsterdictionary.location2[encounter]["Def"]
	if bool:
		locking = 2
		isrolling = true
		desc = Monsterdictionary.location2[encounter]["Desc"]
		Global.desc = str(desc,"
		Health: ", int(Monsterdictionary.location2[encounter]["Health"]), "
		Defense: ", enemydef)
		Global.clear.emit()
		Global.starttalking.emit()
		isrolling = true
		locking = 2
		timer2.wait_time = 7
		timer2.start()
		await timer2.timeout
		Global.clear.emit()
		openplatformer()
		
	timer2.wait_time = 5
	timer2.start()
	await timer2.timeout




func checkvar():
	coolfunc(10)
	if currenthover > itemlogic.currentinventory.size():
		pass
	else:
		var curr = itemlogic.currentinventory[currenthover -1]
		if itemlogic.inventorydict[curr]["Effect"]["Identifier"] is String:
			Global.desc = itemlogic.inventorydict[curr]["Effect"]["Desc"]
			print("Described!")
			itemlist.visible = false
			Global.clear.emit()
			Global.starttalking.emit()
			timerfunc(5)
			$TextureRect/RichTextLabel.visible = true
			await timer.timeout
			openplatformer()
			$TextureRect/RichTextLabel.visible = false
		elif itemlogic.inventorydict[curr]["Effect"]["Identifier"] is int:
			Global.health += itemlogic.inventorydict[curr]["Effect"][10]
			Global.health = wrapi(Global.health,Global.health,100)
			print("healed!")
			itemlist.visible = false
			itemlogic.currentinventory.remove_at(curr)
			timerfunc(5)
			await timer.timeout
			
			openplatformer()
		
func timerfunc(int):
	timer.wait_time = int
	timer.start()
