extends Node

var inventory_dict : Dictionary = {}
var equipment_dict : Dictionary = {}
var money : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func add_inventory(type, count):
	if inventory_dict.has(type):
		inventory_dict[type] += count
	else:
		inventory_dict[type] = count

func subtract_inventory(type, count):
	assert(inventory_dict.get(type) - count >= 0)
	
	if inventory_dict.get(type) - count == 0:
		inventory_dict.erase(type)
	else:
		inventory_dict[type] -= count

func add_equipment(type):
	if equipment_dict.has(type):
		equipment_dict[type] += 1
	else:
		equipment_dict[type] = 1

func add_money(count):
	money += count
	
func subtract_money(count):
	assert (money - count >= 0)
	
	money -= count
