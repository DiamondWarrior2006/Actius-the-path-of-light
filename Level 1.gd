extends Node2D



func _ready():
	$MusicTimer.start()


func _on_Timer_timeout():
	if !Global.is_playing:
		Global.is_playing = true
		MusicController.play_level_two()


func _on_Suraci_health_updated(health):
	$CanvasLayer/Ui/HBoxContainer/ProgressBar.value = health


func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://Scenes/Level 2.tscn")
	MusicController.stop_music()


func _enter_tree():
	if Global.last_position:
		$Suraci.global_position = Global.last_position
