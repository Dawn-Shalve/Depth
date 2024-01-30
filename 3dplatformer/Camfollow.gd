extends Node3D



@onready var TargetNode = $"../CharacterBody3D"
@onready var StartOffset = self.transform.origin - TargetNode.transform.origin
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.transform.origin = TargetNode.transform.origin + StartOffset
