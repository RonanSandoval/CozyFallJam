extends Node

signal game_paused
signal game_resumed

signal ui_changed

var inventory_scene : PackedScene

var ui_node : Node
var paused : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	ui_node = get_tree().root.get_node("Node2D/UI")
	inventory_scene = preload("res://Scenes/UI/inventory.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	
	# opening and closing inventory
	if event.is_action_pressed("open_inventory"):
		MusicManager.play_sound("Button")
		if ui_node.get_child_count() == 0:
			add_menu(inventory_scene)
		else:
			clear_menus()

func add_menu(new_menu : PackedScene):
	var instance : Node = new_menu.instantiate()
	ui_node.add_child(instance)
	paused = true
	MusicManager.play_sound("MenuOpen")
	game_paused.emit()

func clear_menus():
	for child in ui_node.get_children():
		child.queue_free()
	paused = false
	MusicManager.play_sound("MenuClose")
	game_resumed.emit()
	
func update_ui_node():
	ui_node = get_tree().root.get_node("Node2D/UI")
