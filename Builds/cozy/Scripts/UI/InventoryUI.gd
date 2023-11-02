extends Node

var inv_item_scene : PackedScene = preload("res://Scenes/UI/inventory_item.tscn")

@export var inv_type : String

# Called when the node enters the scene tree for the first time.
func _ready():
	var my_inv : Dictionary
	if inv_type == "equipment":
		my_inv = InventoryManager.get_equipment()
	else:
		my_inv = InventoryManager.get_inventory()
		
	for item in my_inv.keys():
		var instance : Node = inv_item_scene.instantiate()
		add_child(instance)
		instance.get_child(1).text = item
		
		var img_path : String = "res://Sprites/Ingredients/" + item + ".png"
		if (ResourceLoader.exists(img_path)):
			instance.get_child(0).texture = load(img_path)
		
		if inv_type == "equipment":
			instance.get_child(2).text = "Level " + str(my_inv[item])
		else:
			instance.get_child(2).text = str(my_inv[item])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
