extends Node2D
var roll = 0
var Monstersummon
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact"):
		pass



func rolldice():
	roll = randf_range(1,6)


func _initialcombatload():
	if Global.convoinfluence:
		pass
	else:
		if Global.location == 1:
			var monsterinstance = randi_range(1,5)
			Monstersummon = Monsterdictionary.location1.get(monsterinstance)
			print(Monstersummon)
			
