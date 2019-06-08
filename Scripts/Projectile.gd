extends KinematicBody2D

const CharacterBase = preload("res://Scripts/CharacterBase.gd")

export(float) var speed
export(float) var lifetime

var direction
var attack
var timer: SceneTreeTimer
var despawned
var damage
var fighter

func _fire(direction: Vector2):
	self.direction = direction.normalized()
	get_tree().create_timer(lifetime).connect("timeout", self, "timeout")
	despawned = false

func timeout():
	if not despawned:
		despawn()

func despawn():
	despawned = true
	queue_free()

func hit(body):
	if body != fighter:
		if body is CharacterBase:
			body.deal_damage(damage)

func _ready():
	set_physics_process(false)
