extends Node

var bgm = load("res://Audio/Tree_tone_thingy_v3.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	play_bgm()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func play_bgm():
	$MusicPlayer.stream = bgm
	$MusicPlayer.play()

func play_sound(sound_name : String):
	find_child(sound_name).play()
	
