extends "res://Scripts/CharacterBase.gd"

func _attack(direction: Vector2):
	._attack(direction)
	$ArrowAttack.execute_if_ready(direction)
