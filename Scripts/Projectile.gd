extends KinematicBody2D

export(float) var speed
export(float) var lifetime

var direction
var attack
var timer: SceneTreeTimer
var despawned

func _fire(direction: Vector2):
	self.direction = direction.normalized()
	get_tree().create_timer(lifetime).connect("timeout", self, "timeout")
	despawned = false

func timeout():
	if not despawned:
		despawn()

func despawn():
	despawned = true
	get_parent().remove_child(self)

func _ready():
	set_physics_process(false)
