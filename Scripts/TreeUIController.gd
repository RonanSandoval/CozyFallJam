extends Node

signal game_paused
signal game_resumed

var scene : PackedScene

var paused : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	scene = preload("res://Scenes/UI/inventory.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	# opening and closing inventory
	if event.is_action_pressed("open_inventory"):
		if get_child_count() == 0:
			var instance : Node = scene.instantiate()
			add_child(instance)
			paused = true
			game_paused.emit()
		else:
			clear_menus()

func clear_menus():
	for child in get_children():
		child.queue_free()
	paused = false
	game_resumed.emit()
