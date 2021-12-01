extends StaticBody2D

var is_lit = false

func _ready():
	$CPUParticles2D.emitting = false
	$Light2D.enabled = false



func _on_Area2D_body_entered(body):
	if is_lit == false:
		if "Suraci" in body.name:
			$CPUParticles2D.emitting = true
			$Light2D.enabled = true
			$Sound.play()
			Global.total_match -= 1
			is_lit = true


