extends Control
@onready var rich = $RichTextLabel
@onready var timer = $Timer
@onready var anim = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("rotate")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		if self.visible:
			self.visible = false
			Global.movement = true
			Global.canint = true
		else:
			self.visible = true
			Global.movement = false
			Global.canint = false
	
