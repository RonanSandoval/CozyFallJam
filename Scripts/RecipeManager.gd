extends Node

var recipe_dict : Dictionary

# Called when the node enters the scene tree for the first time.
func _ready():
	recipe_dict = read_json("res://Data/recipes.json")
	print(is_recipe_cookable(0))
	print(is_recipe_cookable(1))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func get_recipe(id : int) -> Dictionary:
	for recipe in recipe_dict["recipes"]:
		if recipe["id"] == id:
			return recipe
	return {}

func is_recipe_cookable(id : int) -> bool:
	for ingredient in get_recipe(id)["ingredients"]:
		if InventoryManager.get_inventory_count(ingredient[0]) < ingredient[1]:
			return false
	return true

func read_json(path) -> Dictionary:
	var file = FileAccess.open(path, FileAccess.READ)
	var contents = file.get_as_text()
	file.close()
	return JSON.parse_string(contents)
