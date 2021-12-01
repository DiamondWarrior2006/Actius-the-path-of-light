extends Area2D

var sound_has_played = false

func _ready():
	$CPUParticles2D.emitting = false

func _on_Checkpoint_body_entered(body):
	if "Suraci" in body.name:
		Global.last_position = global_position
		$CPUParticles2D.emitting = true
		if !sound_has_played:
			sound_has_played = true
			$Sound.play()
