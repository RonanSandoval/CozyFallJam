extends Node


# Called when the node enters the scene tree for the first time.
func _process(delta):
	update_counter()

func update_counter():
	self.text = str(InventoryManager.get_money())
