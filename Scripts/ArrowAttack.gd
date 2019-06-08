extends "res://Scripts/Attack.gd"

var Arrow = preload("res://Scenes/Arrow.tscn")

func _execute(direction):
	var arrow = Arrow.instance()
	fighter.get_parent().add_child(arrow)
	arrow.owner = fighter.get_parent()
	arrow.attack = self
	arrow.fighter = fighter
	arrow.damage = damage
	arrow.position = fighter.global_position + direction.clamped(10)
	arrow.add_collision_exception_with(fighter)
	arrow._fire(direction)

func _ready():
	ready = true