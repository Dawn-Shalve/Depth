extends Node
var currentinventory = [1,2,2,1,2,1]
var inventoryfull = false
signal bird
signal word
var dropid = 0
var check = 28
var processid = 0
var inventorydict = {
	1:{
		"Texture":"res://assets/items/stick.png",
		"Name":"Stick",
		"Effect":{
			"Identifier":"",
			"Desc":"You throw the stick... It does nothing"
		},
		"Group":"Hard"
	},
	2:{
		"Texture":"res://assets/items/greenbean.png",
		"Name":"Greenbean",
		"Effect":{
			"Identifier":1,
			10:10
		},
		"Group":"Food"
	}
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if currentinventory.size() >= 27:
		inventoryfull = true
		if currentinventory.size() > 27:
			var diff = currentinventory.size() - 27
			check = 27
			for x in diff:
				currentinventory.remove_at(check)
				check += 1
		else:
			check = 27
	else:
		inventoryfull = false
