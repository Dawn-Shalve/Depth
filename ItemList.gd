extends ItemList
var currentinventory = [1,2,2,1,1]
var inventorydict = {
	0:{
		"Texture":"res://assets/items/stick.png",
		"Name": "Stick"
	},
	1:{
		"Texture":"res://assets/items/stick.png",
		"Name":"Stick",
	},
	2:{
		"Texture":"res://assets/items/greenbean.png",
		"Name":"Greenbean",
	}
}

# Called when the node enters the scene tree for the first time.
func _ready():
	itemlogic.bird.connect(word)
	itemlogic.word.connect(bird)
	inventoryrender()

func word():
	additem(itemlogic.processid)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func bird():
	inventoryrender()
func _process(delta):
	pass


func additem(int):
	if itemlogic.currentinventory.size() == 32:
		keepitem()
	else:
		itemlogic.currentinventory.append(int)
		inventoryrender()

func inventoryrender():
	self.clear()
	var invamount = itemlogic.currentinventory.size()
	for x in invamount:
		var load = itemlogic.currentinventory[x]
		self.add_item(itemlogic.inventorydict[load]["Name"],(load(itemlogic.inventorydict[load]["Texture"])), false)
		
		

func keepitem():
	pass


func _on_item_clicked(index, at_position, mouse_button_index):
	pass # Replace with function body.
