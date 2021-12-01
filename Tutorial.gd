extends Node2D

var starting_dialog =  Dialogic.start("opening 1")
var ending_dialog = Dialogic.start("opening 2")
var has_played_walk = false
var has_played_jump = false

func _ready():
	$MusicTimer.start()
	add_child(starting_dialog)


func _on_MusicTimer_timeout():
	if !Global.is_playing:
		Global.is_playing = true
		MusicController.play_level_one()


func _on_Area2D_body_entered(body):
	add_child(ending_dialog)
	

func _process(delta):
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		if !has_played_walk:
			$Control/AnimationPlayer.play("fade")
			has_played_walk = true
	if Input.is_action_pressed("ui_jump"):
		if !has_played_jump:
			$Control/AnimationPlayer.play("fade2")
			has_played_jump = true
