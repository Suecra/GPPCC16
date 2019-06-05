extends "res://Scripts/CharacterBase.gd"

var in_special_move = false
var teleport_position: Vector2

func _attack(direction: Vector2):
	._attack(direction)
	speed_multiplier = 0.9
	$MagicAttack.execute_if_ready(direction)
	
func _do_special_move(direction: Vector2):
	in_special_move = true
	teleport_position = Vector2(0, 0)

func _stop_special_move():
	if in_special_move:
		in_special_move = false
		teleport()

func teleport():
	position += teleport_position