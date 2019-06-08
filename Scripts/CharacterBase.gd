extends KinematicBody2D

export(int) var hp = 5
export(int) var movement_speed = 60
export(float) var special_cooldown = 4.0
export(Vector2) var initial_direction = Vector2(0, 1)

var movement = Vector2(0, 0)
var direction = Vector2(0, 1)
var attacking = false
var current_hp
var speed_multiplier = 1
var special_ready = true
var visibility = 0.0

func move(direction: Vector2):
	if direction != Vector2(0, 0):
		if not attacking:
			look(direction)
		movement = direction * movement_speed
		movement = movement.clamped(movement_speed)
	else:
		movement = Vector2(0, 0)

func look(direction: Vector2):
	self.direction = direction.normalized()
	if find_node("Vision"):
		$Vision.rotation = direction.angle() - PI / 2

func _attack(direction: Vector2):
	look(direction)
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
	$DamageBlink.play("blink")
	if current_hp <= 0:
		_faint()

func _faint():
	queue_free()

func _physics_process(delta):
	move_and_slide(movement * speed_multiplier)
	update_visibility()
	_update_graphics()
	movement = Vector2(0, 0)
	attacking = false
	speed_multiplier = 1

func _update_graphics():
	$WhiteSprite.moving = movement != Vector2(0, 0)
	$WhiteSprite.direction = direction
	$BlackSprite.moving = movement != Vector2(0, 0)
	$BlackSprite.direction = direction

func update_visibility():
	var tiles = get_tiles_on_current_position()
	if tiles[1] == 4:
		visibility = 0
	else:
		if tiles[0] == 0:
			if tiles[1] == -1:
				visibility = 0
			else:
				visibility = 0.5
			
		else:
			visibility = 1.0

func get_tiles_on_current_position():
	var layer1 = get_parent().get_node("BBCopy1/Layer1")
	var layer2 = get_parent().get_node("BBCopy2/Layer2")
	var tile_v = position / 16
	var result = []
	result.append(layer1.get_cellv(tile_v))
	result.append(layer2.get_cellv(tile_v))
	return result

func _ready():
	current_hp = hp
	look(initial_direction)
	set_physics_process(true)
	$WhiteSprite.direction = direction
	$BlackSprite.direction = direction