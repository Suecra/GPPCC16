extends "res://Scripts/CharacterBase.gd"

var player_spotted = false

func _attack(direction: Vector2):
	._attack(direction)
	speed_multiplier = 0.8
	$Attack.execute_if_ready(direction)

func _do_special_move(direction: Vector2):
	move_and_slide(direction * 1200);
	$Attack._execute(direction)

func _on_Vision_body_entered(body):
	if body.name == "Player":
		player_spotted = true

func _on_Vision_body_exited(body):
	if body.name == "Player":
		player_spotted = false
