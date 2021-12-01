extends Control


func _input(event):
	if Input.is_action_just_pressed("ui_pause"):
		$AnimationPlayer.play("Open")


func _on_AnimationPlayer_animation_finished(anim_name):
	$VBoxContainer/VBoxContainer/Button.grab_focus()
	$AnimationPlayer.play("Idle")


func _on_Button_pressed():
	$AnimationPlayer.play_backwards("Open")
