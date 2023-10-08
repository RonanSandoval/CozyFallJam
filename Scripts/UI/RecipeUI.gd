extends Node


var recipe_name : String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	recipe_name = get_child(1).get_child(0).text
	print(recipe_name)
	for ingredient in RecipeManager.get_recipe_ingredients_name(recipe_name):
		InventoryManager.subtract_inventory(ingredient[0], ingredient[1])
		InventoryManager.hold_food(str(get_child(0).texture.get_image()))
		UiManager.clear_menus()
