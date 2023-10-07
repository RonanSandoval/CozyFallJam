extends Node

var inventory_dict : Dictionary = {}
var equipment_dict : Dictionary = {}
var money : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	test_values()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func test_values():
	inventory_dict["Egg"] = 3
	inventory_dict["Flour"] = 2
	inventory_dict["Maple Syrup"] = 3
	inventory_dict["Apple"] = 2
	equipment_dict["Basket"] = 2
	money = 400

func add_inventory(type, count) -> void:
	if inventory_dict.has(type):
		inventory_dict[type] += count
	else:
		inventory_dict[type] = count

func subtract_inventory(type, count) -> void:
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

func add_money(count) -> void:
	money += count
	
func subtract_money(count) -> void:
	assert (money - count >= 0)
	money -= count
	print(money)
	
func get_money() -> int:
	return money
