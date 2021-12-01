extends Node2D


func _ready():
	$MusicTimer.start()




func _on_MusicTimer_timeout():
	if !Global.is_playing:
		Global.is_playing = true
		MusicController.play_level_two()


func _on_Suraci_health_updated(health):
	$CanvasLayer/Ui/HBoxContainer/ProgressBar.value = health


func _on_Sound_body_entered(body):
	$Ending/AudioStreamPlayer2D.play()
	$Ending/Timer.start()
	


func _on_Ending_body_exited(body):
	$Ending/AudioStreamPlayer2D.stop()
	$Ending/Timer.stop()


func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/Ending.tscn")
	MusicController.stop_music()

func _enter_tree():
	if Global.last_position:
		$Suraci.global_position = Global.last_position
