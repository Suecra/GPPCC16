extends Node2D

export(int) var damage
export(float) var cooldown

var ready: bool
var fighter

func execute(direction: Vector2):
	if ready:
		$DirectionalSprite.visible = true
		$DirectionalSprite.direction = direction
		ready = false
		get_tree().create_timer(cooldown).connect("timeout", self, "timeout")

func _ready():
	ready = true
	$DirectionalSprite.visible = false
	$DirectionalSprite.moving = true
	$DirectionalSprite/Area2D.connect("body_entered", self, "body_entered")

func _enter_tree():
	fighter = get_parent()

func body_entered(body):
	if body != fighter:
		if body is KinematicBody2D:
			body.deal_damage(damage)

func timeout():
	ready = true