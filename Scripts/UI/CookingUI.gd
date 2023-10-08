extends Node

var cooking_scene : PackedScene = preload("res://Scenes/UI/recipe.tscn")
var recipe_scene : PackedScene = preload("res://Scenes/UI/ingredient.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in RecipeManager.get_recipe_count():
		var recipe : Node = cooking_scene.instantiate()
		add_child(recipe)
		var recipe_info : Node = recipe.get_child(1) 
		recipe_info.get_child(0).text = RecipeManager.get_recipe_name(i)
		
		#image
		var img_path : String = "res://Sprites/Food/" + RecipeManager.get_recipe_image(i)
		if (ResourceLoader.exists(img_path)):
			recipe.get_child(0).texture = load(img_path)
		
		# disable button if uncookable
		if !RecipeManager.is_recipe_cookable(i):
			recipe.get_child(2).disabled = true
		
		# add ingredients
		for ingredient in RecipeManager.get_recipe_ingredients(i):
			print(ingredient[0] + " - " + str(ingredient[1]))
			var ingredient_node : Node = recipe_scene.instantiate()
			recipe_info.get_child(1).add_child(ingredient_node)
			var ingredient_count : String = str(InventoryManager.get_inventory_count(ingredient[0])) + " / " + str(ingredient[1]) 
			ingredient_node.get_child(1).text = ingredient_count


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
