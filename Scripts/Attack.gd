extends Node2D

export(int) var damage
export(float) var cooldown

var ready: bool

func execute(direction: Vector2):
	if ready:
		$DirectionalSprite.direction = direction
		ready = false
		get_tree().create_timer(cooldown).connect("timeout", self, "timeout")

func _ready():
	ready = true
	#$DirectionalSprite.visible = false
	#$DirectionalSprite.moving = true

func timeout():
	ready = true