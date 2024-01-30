extends Control
@onready var Option1 = $VBoxContainer/Option1
@onready var Option2 = $VBoxContainer/Option2
@onready var Option3 = $VBoxContainer/Option3
@onready var Option4 = $VBoxContainer/Option4

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact") and Global.nearnpc:
		if Global.nearestnpc == 1:
			$TextureRect.texture = load("res://icon.svg")
		else: 
			$TextureRect.texture = load("res://Screen Shot 2024-01-24 at 9.21.21 AM.png")
	Option1.text = Global.option1
	Option2.text = Global.option2
	Option3.text = Global.option3
	Option4.text = Global.option4
	
