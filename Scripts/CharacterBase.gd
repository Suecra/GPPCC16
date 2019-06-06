extends KinematicBody2D

export(int) var hp = 5
export(int) var movement_speed = 60
export(float) var special_cooldown = 4.0

var movement = Vector2(0, 0)
var direction = Vector2(0, 1)
var attacking = false
var current_hp
var speed_multiplier = 1
var special_ready = true

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

func special_move(direction: Vector2):
	if special_ready:
		_do_special_move(direction.clamped(1))
		special_ready = false
		get_tree().create_timer(special_cooldown).connect("timeout", self, "timeout")

func _do_special_move(direction: Vector2):
	pass

func _stop_special_move():
	pass

func timeout():
	special_ready = true

func deal_damage(damage):
	current_hp -= damage
	if current_hp <= 0:
		_faint()
	else:
		$DamageBlink.play("blink")

func _faint():
	get_parent().remove_child(self)

func _physics_process(delta):
	move_and_slide(movement * speed_multiplier)
	_update_graphics()
	movement = Vector2(0, 0)
	attacking = false
	speed_multiplier = 1

func _update_graphics():
	$WhiteSprite.moving = movement != Vector2(0, 0)
	$WhiteSprite.direction = direction
	$BlackSprite.moving = movement != Vector2(0, 0)
	$BlackSprite.direction = direction

func _ready():
	current_hp = hp
	set_physics_process(true)
	$WhiteSprite.direction = direction
	$BlackSprite.direction = direction