extends "res://Scripts/Magician.gd"

const SWORD_FIGHTER = 0
const MAGICIAN = 1
const MARKSMAN = 2

var old_movement_speed: int

func _update_graphics():
	._update_graphics()
	$Silhouette.moving = movement != Vector2(0, 0)
	$Silhouette.direction = direction

func _physics_process(delta):
	if in_special_move:
		teleport_position += movement * delta
		$Teleporter.position = teleport_position
		movement = Vector2(0, 0)

func _do_special_move(direction: Vector2):
	._do_special_move(direction)
	old_movement_speed = movement_speed
	movement_speed = 100
	$Teleporter.position = teleport_position
	$Teleporter/AnimationPlayer.play("teleport_animation")
	$Teleporter.visible = true

func _stop_special_move():
	._stop_special_move()
	movement_speed = old_movement_speed
	$Teleporter.visible = false

func transform_to(fighter_class):
	if fighter_class != MAGICIAN:
		var player
		if fighter_class == SWORD_FIGHTER:
			player = load("res://Scenes/PlayerSwordFighter.tscn").instance()
		elif fighter_class == MAGICIAN:
			player = load("res://Scenes/PlayerMagician.tscn").instance()
		elif fighter_class == MARKSMAN:
			player = load("res://Scenes/PlayerMarksman.tscn").instance()
		player.position = position
		name = "Temp"
		player.name = "Player"
		player.owner = get_parent()
		get_parent().add_child(player)
		player.deal_damage(0)
		queue_free()