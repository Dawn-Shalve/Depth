extends Area2D
@onready var sprite = $Sprite2D
var itemid = 0
var notpicking = false
@onready var timer = $timer
signal po
# Called when the node enters the scene tree for the first time.
func _ready():
	itemid = itemlogic.dropid
	if itemid == 0:
		itemid= randi_range(1,2)
	else:
		self.global_position = Global.player_global_position
		self.global_position.x += 32
	getinfo(itemid)
	itemlogic.dropid = 0
	print(itemlogic.inventorydict[itemid]["Group"])
	$CharacterBody2D.add_to_group(str(itemlogic.inventorydict[itemid]["Group"]))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func getinfo(int):
	sprite.texture = load(str(itemlogic.inventorydict[int]["Texture"]))


func _on_body_entered(body):
	if body.is_in_group("Player"):
		if itemlogic.inventoryfull:
			pass
		else:
			app()

func app():
	if itemlogic.currentinventory.size() <= 27:
		notpicking = true
		itemlogic.currentinventory.append(itemid)
		itemlogic.processid = itemid
		itemlogic.bird.emit()
		self.queue_free()

