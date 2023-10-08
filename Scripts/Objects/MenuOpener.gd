extends Node

@export var menu_target : String

var touching_player : bool

var menu_scene : PackedScene

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	if menu_target == "cooking":
		menu_scene = preload("res://Scenes/UI/cooking.tscn")
	else:
		menu_scene = preload("res://Scenes/UI/equipment.tscn")

func _on_body_entered(body):
	print(body.get_name())
	if body.get_name() == "Player":
		touching_player = true

func _on_body_exited(body):
	if body.get_name() == "Player":
		touching_player = false
		
func _input(event):
	if event.is_action_pressed("interact") and touching_player and !UiManager.paused:
		MusicManager.play_sound("Button")
		UiManager.add_menu(menu_scene)
		
		
