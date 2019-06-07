extends "res://Scripts/Controller.gd"

export(float) var attack_speed = 1.0
export(bool) var looks_around = false
export(bool) var has_move_route = false
export(int) var move_route_length = 200

var player
var lost_player = false
var player_was_visible = false
var looking_around = false
var counter = 0.0
var route = 0.0

func _physics_process(delta):
	if is_player_visible():
		looking_around = false
		var position_delta = -(controlled_object.position - player.position)
		controlled_object.move(position_delta)
		counter += delta
		if counter >= attack_speed:
			controlled_object._attack(controlled_object.direction)
			counter = 0.0
	elif has_move_route:
		controlled_object.move(controlled_object.direction)
		counter += delta
		if counter >= attack_speed:
			controlled_object._attack(controlled_object.direction)
			counter = 0.0
		route += controlled_object.movement_speed * delta
		if route >= move_route_length || (controlled_object.is_on_wall() && route > 10):
			turn_around()
			route = 0
	elif looks_around:
		look_around()
	elif lost_player:
		look_around()

func is_player_visible():
	var result = controlled_object.player_spotted && player.visibility > 0
	if result:
		player_was_visible = true
	elif player_was_visible:
		lost_player = true
	return result

func look_around():
	if not looking_around:
		looking_around = true
		get_tree().create_timer(2).connect("timeout", self, "timeout")

func look_in_random_direction():
	if not is_player_visible():
		controlled_object.look(Vector2((randi() % 2) - 1, (randi() % 2) - 1))
		get_tree().create_timer(2).connect("timeout", self, "timeout")

func turn_around():
	controlled_object.look(-controlled_object.direction)

func timeout():
	look_in_random_direction()

func _enter_tree():
	._enter_tree()
	player = controlled_object.get_parent().get_node("Player")