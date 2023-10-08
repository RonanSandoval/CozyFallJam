extends Node

const animal_imgs : Array = [
	"duck.png",
	"monkey.png",
	"raccoon.png",
]

const favourites : Array = [
	"Cranberry Cocktail",
	"Pancakes",
	"Apple Pie"
]

const MAX_PATIENCE : float = 80
var patience : float = MAX_PATIENCE
var my_id : int

signal customer_served

var touching_player : bool

func _ready():
	my_id = randi_range(0, animal_imgs.size() - 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if patience > 0:
		patience -= delta
		if patience < 0:
			patience = 0
	$Patience.set_size(Vector2(patience, 20))

func _on_body_entered(body):
	if body.get_name() == "Player":
		touching_player = true

func _on_body_exited(body):
	if body.get_name() == "Player":
		touching_player = false
		
func _input(event):
	if event.is_action_pressed("interact") and InventoryManager.is_holding_food() and not UiManager.paused:
		InventoryManager.add_money(calculate_money())
		InventoryManager.drop_food()
		customer_served.emit()
		queue_free()
		
func calculate_money() -> int:
	print(InventoryManager.get_held_food())
	var base_value = RecipeManager.get_recipe_price_name(InventoryManager.get_held_food())
	var patience_value = int((patience / MAX_PATIENCE) * base_value)
	var fave_value =  2 if InventoryManager.get_held_food() == favourites[my_id] else 1
	print(base_value)
	print(patience_value)
	print(fave_value)
	return (base_value + patience_value) *  fave_value
