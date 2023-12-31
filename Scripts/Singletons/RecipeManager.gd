extends Node

var recipe_dict : Dictionary

# Called when the node enters the scene tree for the first time.
func _ready():
	recipe_dict = read_json("res://Data/recipes.json")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func get_recipe(id : int) -> Dictionary:
	for recipe in recipe_dict["recipes"]:
		if recipe["id"] == id:
			return recipe
	return {}

func get_recipe_name(id : int) -> String:
	for recipe in recipe_dict["recipes"]:
		if recipe["id"] == id:
			return recipe["name"]
	return "ERROR"
	
func get_recipe_ingredients(id : int) -> Array:
	for recipe in recipe_dict["recipes"]:
		if recipe["id"] == id:
			return recipe["ingredients"]
	return []
	
func get_recipe_image(id : int) -> String:
	for recipe in recipe_dict["recipes"]:
		if recipe["id"] == id:
			return recipe["image"]
	return ""
	
func get_recipe_image_name(name : String) -> String:
	for recipe in recipe_dict["recipes"]:
			if recipe["name"] == name:
				return recipe["image"]
	return ""

func get_recipe_price_name(name : String) -> int:
	for recipe in recipe_dict["recipes"]:
		if recipe["name"] == name:
			return recipe["price"]
	return 0

func get_recipe_ingredients_name(name : String) -> Array:
	for recipe in recipe_dict["recipes"]:
		if recipe["name"] == name:
			return recipe["ingredients"]
	return []
	
func get_recipe_count() -> int:
	var recipes : Array = recipe_dict["recipes"]
	return recipes.size()

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
