extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	var item_type : String = get_parent().get_child(1).text
	InventoryManager.subtract_inventory(item_type, 1)
	var new_count : int = InventoryManager.get_inventory_count(item_type)
	if new_count == 0:
		get_parent().queue_free()
	else:
		get_parent().get_child(2).text = str(new_count)
