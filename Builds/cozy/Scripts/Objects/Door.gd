extends Node

@export var door_target : String

var touching_player : bool


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	print(body.get_name())
	if body.get_name() == "Player":
		touching_player = true

func _on_body_exited(body):
	if body.get_name() == "Player":
		touching_player = false
		
func _input(event):
	if event.is_action_pressed("interact") and touching_player:
		get_tree().change_scene_to_file("res://Scenes/" + door_target)
		
