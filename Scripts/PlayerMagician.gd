extends "res://Scripts/Magician.gd"

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
	$Teleporter.position = teleport_position
	$Teleporter/AnimationPlayer.play("teleport_animation")
	$Teleporter.visible = true

func _stop_special_move():
	._stop_special_move()
	$Teleporter.visible = false
