extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_dplatformer_pressed():
	get_tree().change_scene_to_file("res://3dplatformer/world.tscn")


func _on_topdown_2d_pressed():
	get_tree().change_scene_to_file("res://topdown2d/worldtopdown2d.tscn")


func _on_d_platformer_pressed():
	get_tree().change_scene_to_file("res://2dplatformer/world-1-1.tscn")
