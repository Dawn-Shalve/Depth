extends Area2D
@onready var anim = $"../../AnimationPlayer"
var entityid = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	entityid = Global.entityids
	Global.entityids =+ 1
	print(Global.killed)
	if Global.killed[Global.checkid] == entityid:
		Global.killed.remove_at(Global.checkid)
		Global.checkid = 0
		print(Global.killed)
		self.queue_free()
	anim.play("treegoblinpace")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("Player"):
		Global.logglobal = body.global_position
		swap()

func swap():
	Global.encounter = 1
	Global.fightingid = entityid
	get_tree().change_scene_to_file("res://UI/fight.tscn")
