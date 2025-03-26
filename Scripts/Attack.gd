extends Node2D

const CharacterBase = preload("res://Scripts/CharacterBase.gd")

export(int) var damage
export(float) var cooldown

var ready: bool
var fighter

func execute_if_ready(direction: Vector2):
	if ready:
		_execute(direction)
		ready = false
		get_tree().create_timer(cooldown).connect("timeout", self, "timeout")

func _execute(direction):
	pass

func _enter_tree():
	fighter = get_parent()

func hit(body):
	if body != fighter:
		if body is CharacterBase:
			body.deal_damage(damage)

func timeout():
	ready = true
