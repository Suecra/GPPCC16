extends "res://Scripts/CharacterBase.gd"

func _attack(direction):
	._attack(direction)
	$Attack.execute(direction)
