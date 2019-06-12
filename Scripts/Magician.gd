extends "res://Scripts/CharacterBase.gd"

var in_special_move = false
var teleport_position: Vector2
var player_spotted = false

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
	var transf = Transform2D(rotation, position + teleport_position)
	if not test_move(transf, Vector2(0, 0)) && not out_of_bounds(position + teleport_position):
		position += teleport_position

func _on_Vision_body_entered(body):
	if body.name == "Player":
		player_spotted = true

func _on_Vision_body_exited(body):
	if body.name == "Player":
		player_spotted = false