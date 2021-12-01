extends Area2D




func _on_Match_body_entered(body):
	if Global.match_count < Global.max_match_count:
		Global.match_count += 1
	else:
		Global.match_count += 0
	$CollisionShape2D.call_deferred("set_disabled", true)
	$AnimationPlayer.play("Fade")
