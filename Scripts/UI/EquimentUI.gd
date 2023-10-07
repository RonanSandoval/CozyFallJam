extends Node

@export var upgrade_name : String
@export var price_array : Array[int]

var recipe_info : Node
var current_price : int

# Called when the node enters the scene tree for the first time.
func _ready():
	recipe_info = get_child(1)
	current_price = price_array[InventoryManager.get_equipment_count(upgrade_name)]
	update_text()
	update_affordability()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		pass

func update_text():
	var current_level : int = InventoryManager.get_equipment_count(upgrade_name)
	if price_array.size() > current_level: 
		current_price = price_array[InventoryManager.get_equipment_count(upgrade_name)]
		recipe_info.get_child(1).text = "Level " + str(current_level)
		get_child(2).text = str(price_array[InventoryManager.get_equipment_count(upgrade_name)])
		update_affordability()
	else:
		recipe_info.get_child(1).text = "MAX LEVEL"
		get_child(2).text = "MAX"
		get_child(2).disabled = true

func update_affordability():
		if current_price > InventoryManager.get_money():
			get_child(2).disabled = true
		else:
			get_child(2).disabled = false

func _on_button_pressed():
	InventoryManager.subtract_money(current_price)
	InventoryManager.add_equipment(upgrade_name)
	print("pressed " + upgrade_name)
	
	update_text()

