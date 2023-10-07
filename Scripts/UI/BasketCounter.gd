extends Node

func _process(delta):
	update_counter()

# Called when the node enters the scene tree for the first time.
func _ready():
	update_counter()

func update_counter():
	self.text =  str(InventoryManager.get_basket_quantity()) + " / " + str(InventoryManager.get_basket_size())
