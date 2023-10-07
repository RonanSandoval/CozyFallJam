extends Camera2D

@export var left_limit : int
@export var right_limit : int

var player

func _ready():
	player= get_parent().get_node("Player")
	

func _process(delta):
	print(position.x)
	position.x=player.position.x
	position.y=player.position.y
	position.x = clamp(position.x, left_limit, right_limit)
