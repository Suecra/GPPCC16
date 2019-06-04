extends "res://Scripts/CharacterBase.gd"

func _attack(direction: Vector2):
	._attack(direction)
	speed_multiplier = 0.8
	$Attack.execute_if_ready(direction)

func _do_special_move(direction: Vector2):
	move_and_slide(direction * 1200);
	$Attack._execute(direction)
