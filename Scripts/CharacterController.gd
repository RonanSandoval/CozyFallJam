extends CharacterBody2D


var SPEED = 300.0
var JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var player_node : Node
var food_node : Node

func _ready():
	UiManager.game_paused.connect(_on_ui_game_paused)
	UiManager.game_resumed.connect(_on_ui_game_resumed)
	UiManager.update_ui_node()
	InventoryManager.food_held.connect(_on_food_held)
	InventoryManager.food_dropped.connect(_on_food_dropped)
	
	JUMP_VELOCITY = [-800.0, -1000.0, -1100.0, -1200.0][InventoryManager.get_equipment_count("Boots")]
	player_node = get_child(0)
	food_node = get_child(3)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor() and not food_node.visible:
		# Jump size is dependant on basket fullness
		JUMP_VELOCITY = [-600.0, -800.0, -1000.0, -1200.0][InventoryManager.get_equipment_count("Boots")]
		velocity.y = JUMP_VELOCITY * (1 - (InventoryManager.get_basket_ratio() * 0.50))

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		player_node.set_flip_h(direction > 0)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _on_ui_game_paused():
	set_physics_process(false)

func _on_ui_game_resumed():
	set_physics_process(true)

func _on_food_held():
	food_node.visible = true
	var img_path : String = "res://Sprites/Food/" + RecipeManager.get_recipe_image_name(InventoryManager.get_held_food())
	if (ResourceLoader.exists(img_path)):
		food_node.texture = load(img_path)

func _on_food_dropped():
	food_node.visible = false
