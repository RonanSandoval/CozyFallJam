extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	play_bgm()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func play_bgm():
	$MusicPlayer.play()

func play_sound(sound_name : String):
	find_child(sound_name).play()
	
