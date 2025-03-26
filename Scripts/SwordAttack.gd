extends "res://Scripts/Attack.gd"

func _execute(direction):
	$DirectionalSprite.visible = true
	$DirectionalSprite.direction = direction

func _ready():
	ready = true
	$DirectionalSprite.visible = false
	$DirectionalSprite.moving = true
	$DirectionalSprite/Area2D.connect("body_entered", self, "hit")
