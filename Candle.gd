extends Area2D

var is_lit = false

func _ready():
	$Particles2D.emitting = false
	$Light2D.enabled = false


func _on_Candle_body_entered(body):
	if is_lit == false:
		if "Suraci" in body.name:
			$Light2D.enabled = true
			$Particles2D.emitting = true
			$Sound.play()
			is_lit = true
			Global.total_match -= 1
