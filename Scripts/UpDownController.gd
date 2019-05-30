extends "res://Scripts/Controller.gd"

var y_direction = 1

func _physics_process(delta):
	if controlled_object.is_on_wall():
		y_direction *= -1
	controlled_object.move(Vector2(0, y_direction))
