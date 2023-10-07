extends Node

var inventory_dict : Dictionary = {}
var equipment_dict : Dictionary = {}
var money : int = 0
var basket_size : int

# Called when the node enters the scene tree for the first time.
func _ready():
	update_basket_size()
	test_values()

func test_values():
	inventory_dict["Egg"] = 3
	inventory_dict["Flour"] = 2
	inventory_dict["Maple Syrup"] = 3
	inventory_dict["Apple"] = 2
	equipment_dict["Boots"] = 2
	money = 400

### INVENTORY ###

func add_inventory(type : String, count : int) -> void:
	if inventory_dict.has(type):
		inventory_dict[type] += count
	else:
		inventory_dict[type] = count

func subtract_inventory(type : String, count : int) -> void:
	assert(inventory_dict.get(type) - count >= 0)
	if inventory_dict.get(type) - count == 0:
		inventory_dict.erase(type)
	else:
		inventory_dict[type] -= count
		
func get_inventory() -> Dictionary:
	return inventory_dict
	
func get_inventory_count(type) -> int:
	if inventory_dict.has(type):
		return inventory_dict[type]
	else:
		return 0

### EQUIPMENT ###

func get_equipment() -> Dictionary:
	return equipment_dict

func add_equipment(type) -> void:
	if equipment_dict.has(type):
		equipment_dict[type] += 1
	else:
		equipment_dict[type] = 1

func get_equipment_count(type) -> int:
	if equipment_dict.has(type):
		return equipment_dict[type]
	else:
		return 0

### MONEY ###

func add_money(count) -> void:
	money += count
	
func subtract_money(count) -> void:
	assert (money - count >= 0)
	money -= count
	print(money)
	
func get_money() -> int:
	return money

### BASKET ###

func update_basket_size():
	basket_size = [15, 20, 25, 30][get_equipment_count("Basket")]
	
func get_basket_size() -> int:
	return basket_size
	
func get_basket_quantity() -> int:
	var item_count : int = 0
	for item in inventory_dict.keys():
		item_count += inventory_dict[item]
	return item_count

func is_basket_full() -> bool:
	return get_basket_quantity() == basket_size

func get_basket_ratio() -> float:
	return float(get_basket_quantity()) / float(basket_size)
