extends TextureRect
@onready var talking = $"../ColorRect"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.npc == 1:
		self.texture = load("res://assets/Rowan/rowanportrait.png")
		talking.texture = load("res://assets/ui/rowantalk.png")
	if Global.npc == 2:
		self.texture = load("res://assets/Rhys Carter/portrait.png")
		talking.texture = load("res://assets/ui/rhystalk.png")
