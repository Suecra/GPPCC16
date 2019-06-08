extends "res://Scripts/Projectile.gd"

var chased_character: PhysicsBody2D

func _fire(direction):
	._fire(direction)
	chased_character = null
	set_physics_process(true)

func _physics_process(delta):
	if chased_character != null:
		direction = chased_character.position - position
	var movement = speed * direction
	movement = movement.clamped(speed)
	move_and_slide(movement)
	for i in get_slide_count():
		hit(get_slide_collision(i).collider)
		despawn()
		break

func body_detected(body):
	if chased_character == null:
		if body is CharacterBase && body != attack.get_parent(): 
			chased_character = body
