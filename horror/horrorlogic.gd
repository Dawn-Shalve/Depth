extends Node2D
@onready var background = $background
@onready var monster1timer = $monster1
@onready var monster2timer = $monster2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func monsterrand():
	var monstertimer = randf_range(5,100)
