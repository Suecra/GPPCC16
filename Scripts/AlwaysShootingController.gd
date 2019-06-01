extends "res://Scripts/Controller.gd"

func _physics_process(delta):
	controlled_object._attack(Vector2(0, 1))
