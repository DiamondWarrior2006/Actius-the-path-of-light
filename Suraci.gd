extends KinematicBody2D

signal health_updated(health)
signal dead()

const up = Vector2.UP
var gravity = 20
const acceleration = 960
const max_speed = 200
const jump_height = -400

var motion = Vector2()
var max_jump_count = 2
var is_jumping = false
var in_air = false
var is_dead = false
var input_vector = Vector2()
var landing : bool

export (int) var max_health = 50

onready var health = max_health setget _set_health

func _physics_process(delta):
	if is_dead == false:
		motion.y += gravity
		
		var friction = false
		
		
		if Input.is_action_pressed("ui_right"):
			motion.x = min(motion.x + acceleration, max_speed)
			$Sprite.flip_h = false
			input_vector.x = 1
		elif Input.is_action_pressed("ui_left"):
			motion.x = max(motion.x - acceleration, -max_speed)
			$Sprite.flip_h = true
			input_vector.x = -1
		else:
			friction = true
			input_vector.x = 0
		
		
		if is_on_floor():
			in_air = false
			if Input.is_action_just_pressed("ui_jump"):
				jump()
			if friction == true:
				motion.x = lerp(motion.x, 0, 0.2)
		else:
			if friction == true:
				motion.x = lerp(motion.x, 0, 0.05)
			if is_jumping && motion.y >= 0:
				is_jumping = false
			
			if in_air == false:
				if Input.is_action_just_pressed("ui_jump"):
					gravity = 0.5
					motion = Vector2.ZERO
					in_air = true
					$Timers/FallTimer.start()

			if in_air == true:
				if Input.is_action_just_pressed("ui_drop"):
					gravity = 20
					motion = Vector2()
					in_air = false
					$Timers/FallTimer.stop()
		
		
		var snap = Vector2.DOWN * 32 if !is_jumping else Vector2.ZERO
		
		motion = move_and_slide_with_snap(motion, snap, up)
		
		_process_animation()

func _process_animation():
	if is_on_floor():
		if input_vector.y > 0.75 && is_jumping == true:
			$Sprite.play("jump")
		elif input_vector.x < -0.75 or input_vector.x > 0.75:
			$Sprite.play("walk")
		else:
			$Sprite.play("idle")
		if landing:
			$Sprite.play("landing")
			landing = false
	else:
		if motion.y < 0:
			$Sprite.play("jump")
		elif motion.y > 0:
			$Sprite.play("falling")
		if !landing:
			landing = true

func jump():
	gravity = 20
	motion.y = jump_height
	is_jumping = true
	input_vector.y = 1

func kill():
	is_dead = true
	motion = Vector2(0,0)
	$Timers/DeathTimer.start()

func damage(amount):
	_set_health(health - amount)
	flash()

func _set_health(value):
	var prev_health = health
	health = clamp(value, 0, max_health)
	if health != prev_health:
		emit_signal("health_updated", health)
		if health == 0:
			kill()


func flash():
	$Sprite.material.set_shader_param("hit_strength", 1)
	$Timers/HitTimer.start()


func _on_VisibilityNotifier2D_screen_exited():
	Global.total_match = 8
	Global.is_playing = true
	get_tree().reload_current_scene()


func _on_FallTimer_timeout():
	gravity = 20
	motion = Vector2()
	in_air = false


func _on_DeathTimer_timeout():
	Global.total_match = 8
	Global.is_playing = true
	get_tree().reload_current_scene()


func _on_HitTimer_timeout():
	$Sprite.material.set_shader_param("hit_strength", 0)



