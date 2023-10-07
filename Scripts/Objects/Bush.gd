extends Node

@export var bush_type : String
@export var bush_count : int

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
	if event.is_action_pressed("interact") and touching_player and bush_count > 0:
		if !InventoryManager.is_basket_full():
			InventoryManager.add_inventory(bush_type, 1)
			print( InventoryManager.get_inventory_count(bush_type))
			bush_count -= 1
		
