extends Node2D



func _ready():
	$MusicTimer.start()
	




func _on_MusicTimer_timeout():
	MusicController.play_end_screen()
