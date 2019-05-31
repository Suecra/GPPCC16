extends KinematicBody2D

export(int) var movement_speed = 200

var movement = Vector2(0, 0)
var direction = Vector2(0, 1)
var attacking = false

func move(direction: Vector2):
	if direction != Vector2(0, 0):
		if not attacking:
			self.direction = direction.normalized()
		movement = direction * movement_speed
		movement = movement.clamped(movement_speed)
	else:
		movement = Vector2(0, 0)

func _attack(direction: Vector2):
	self.direction = direction.normalized()
	attacking = true

func deal_damage(damage):
	print("DAMAGE")

func _physics_process(delta):
	move_and_slide(movement)
	$DirectionalSprite.moving = movement != Vector2(0, 0)
	$DirectionalSprite.direction = direction
	movement = Vector2(0, 0)
	attacking = false

func _ready():
	set_physics_process(true)
	$DirectionalSprite.direction = direction