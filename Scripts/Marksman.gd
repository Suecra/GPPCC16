extends "res://Scripts/CharacterBase.gd"

func _attack(direction: Vector2):
	._attack(direction)
	speed_multiplier = 0.8
	$ArrowAttack.execute_if_ready(direction)
