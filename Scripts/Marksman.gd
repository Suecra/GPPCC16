extends "res://Scripts/CharacterBase.gd"

var in_special_move = false
var player_spotted = false

func _attack(direction: Vector2):
	._attack(direction)
	if not in_special_move:
		speed_multiplier = 0.8
	$ArrowAttack.execute_if_ready(direction)

func _physics_process(delta):
	if in_special_move:
		speed_multiplier = 1.5

func _do_special_move(direction: Vector2):
	in_special_move = true
	get_tree().create_timer(2.5).connect("timeout", self, "special_move_timeout")

func special_move_timeout():
	in_special_move = false

func _on_Vision_body_entered(body):
	if body.name == "Player":
		player_spotted = true

func _on_Vision_body_exited(body):
	if body.name == "Player":
		player_spotted = false
