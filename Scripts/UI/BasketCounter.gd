extends Node

func _process(delta):
	update_counter()

func update_counter():
	self.text =  str(InventoryManager.get_basket_quantity()) + " / " + str(InventoryManager.get_basket_size())
