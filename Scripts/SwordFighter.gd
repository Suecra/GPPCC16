extends "res://Scripts/CharacterBase.gd"

func _attack(direction: Vector2):
	._attack(direction)
	$Attack.execute_if_ready(direction)
