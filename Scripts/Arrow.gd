extends "res://Scripts/Projectile.gd"

func _fire(direction: Vector2):
	._fire(direction)
	rotation = direction.angle() - PI
	set_physics_process(true)

func _physics_process(delta):
	var movement = speed * direction
	movement = movement.clamped(speed)
	move_and_slide(movement)
	for i in get_slide_count():
		hit(get_slide_collision(i).collider)
		despawn()
		break