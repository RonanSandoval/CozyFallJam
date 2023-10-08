extends Timer

var customer_count : int

var customer_scene : PackedScene = preload("res://Scenes/customer.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	begin_customers()

func begin_customers():
	start(1)


func _on_timeout():
	var instance : Node = customer_scene.instantiate()
	add_child(instance)
	instance.customer_served.connect(_on_customer_served)
	customer_count += 1
	instance.position.x = -980 - (customer_count * 250)
	instance.position.y = 560
	
	if customer_count < 2 + InventoryManager.get_equipment_count("Line"):
		start(randi_range(1,2) + customer_count * 2)
	else:
		stop()

func update_queue():
	for customer_id in range(0, get_child_count()):
		get_child(customer_id).position.x = -980 - (customer_id * 250)

func _on_customer_served():
	customer_count -= 1
	update_queue()
	if(customer_count ==  2 + InventoryManager.get_equipment_count("Line") - 1):
		print('restart')
		start(randi_range(1,2) + customer_count * 2)

func _on_line_expanded():
	if(customer_count ==  2 + InventoryManager.get_equipment_count("Line") - 1):
		print('restart')
		start(randi_range(1,2) + customer_count * 2)
