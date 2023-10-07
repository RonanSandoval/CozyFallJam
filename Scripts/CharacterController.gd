extends CharacterBody2D


var SPEED = 300.0
var JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var player_node : Node

func _ready():
	JUMP_VELOCITY = [-400.0, -600.0, -800.0, -1000.0][InventoryManager.get_equipment_count("Boots")]
	player_node = get_child(0)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		# Jump size is dependant on basket fullness
		velocity.y = JUMP_VELOCITY * (1 - (InventoryManager.get_basket_ratio() * 0.75))

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		player_node.set_flip_h(direction > 0)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
