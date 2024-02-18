extends Node
var currentinventory = []
var inventorydict = {
	1:"Pepperoni Pizza",
	2:"Green Bean"
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func additem(int):
	if currentinventory.size == 32:
		keepitem()
	else:
		currentinventory.append(int)

func inventoryrender():
	var currentselection = 1
	for x in currentinventory:
		var load = currentinventory[currentselection]
		var currentslot = inventorydict[load]
		
		currentselection = currentselection + 1
		
		

func keepitem():
	pass
