extends "res://Scripts/Attack.gd"

var Magic = preload("res://Scenes/Magic.tscn")

func _execute(direction):
	var magic = Magic.instance()
	fighter.get_parent().add_child(magic)
	magic.owner = fighter.get_parent()
	magic.attack = self
	magic.fighter = fighter
	magic.damage = damage
	magic.position = fighter.global_position + direction.clamped(10)
	magic.add_collision_exception_with(fighter)
	magic._fire(direction)

func _ready():
	ready = true
