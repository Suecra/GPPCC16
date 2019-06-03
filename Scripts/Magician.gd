extends "res://Scripts/CharacterBase.gd"

func _attack(direction: Vector2):
	._attack(direction)
	speed_multiplier = 0.9
	$MagicAttack.execute_if_ready(direction)
