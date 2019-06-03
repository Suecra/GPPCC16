extends KinematicBody2D

export(int) var hp = 5
export(int) var movement_speed = 200

var movement = Vector2(0, 0)
var direction = Vector2(0, 1)
var attacking = false
var current_hp
var speed_multiplier = 1

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
	current_hp -= damage
	if current_hp <= 0:
		_faint()
	else:
		$DamageBlink.play("Blink")

func _faint():
	get_parent().remove_child(self)

func _physics_process(delta):
	move_and_slide(movement * speed_multiplier)
	_update_graphics()
	movement = Vector2(0, 0)
	attacking = false
	speed_multiplier = 1

func _update_graphics():
	$DirectionalSprite.moving = movement != Vector2(0, 0)
	$DirectionalSprite.direction = direction

func _ready():
	current_hp = hp
	set_physics_process(true)
	$DirectionalSprite.direction = direction