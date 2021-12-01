extends Area2D




func _on_Spikes_body_entered(body):
	if "Suraci" in body.name:
		if body.health > 0:
			body.damage(10)

