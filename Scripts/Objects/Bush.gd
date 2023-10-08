extends Node

@export var bush_type : String
@export var bush_count : int

var touching_player : bool

var full_bush_img
var used_bush_img

func _ready():
	full_bush_img = "res://Sprites/Bush/" + bush_type + ".png"
	used_bush_img = "res://Sprites/Bush/" + bush_type + "_empty.png"
	get_child(0).texture = load(full_bush_img)
	get_child(0).scale = Vector2(0.5, 0.5)

func _on_body_entered(body):
	if body.get_name() == "Player":
		touching_player = true

func _on_body_exited(body):
	if body.get_name() == "Player":
		touching_player = false
		
func _input(event):
	if event.is_action_pressed("interact") and touching_player and bush_count > 0:
		if !InventoryManager.is_basket_full() and not UiManager.paused:
			InventoryManager.add_inventory(bush_type, 1)
			print( InventoryManager.get_inventory_count(bush_type))
			bush_count -= 1
			if (bush_count == 0):
				get_child(0).texture = load(used_bush_img)
			
		
