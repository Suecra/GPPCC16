extends "res://Scripts/Controller.gd"

export(float) var time_offset = 0.0
export(float) var attack_speed = 1.0

var counter = 0.0
var wait: float

func _physics_process(delta):
	if wait <= 0.0:
		counter += delta
		if counter >= attack_speed:
			controlled_object._attack(controlled_object.direction)
			counter = 0.0
	else:
		wait -= delta

func _ready():
	wait = time_offset
	counter = attack_speed
