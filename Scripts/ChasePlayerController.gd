extends "res://Scripts/Controller.gd"

export(float) var attack_speed = 1.0
export(bool) var looks_around = false
export(bool) var has_move_route = false
export(int) var move_route_length = 200
export(bool) var move_after_player_lost = false

var player
var lost_player = false
var player_was_visible = false
var looking_around = false
var counter = 0.0
var route = 0.0
var wall_counter

func _physics_process(delta):
	player = controlled_object.get_parent().get_node("Player")
	if is_player_visible():
		looking_around = false
		var position_delta = -(controlled_object.position - player.position)
		controlled_object.move(position_delta)
		attack(delta)
	elif lost_player:
		if move_after_player_lost:
			go_move_route(delta)
		else:
			print("look around")
			look_around()
	elif looks_around:
		look_around()
	elif has_move_route:
		go_move_route(delta)

func go_move_route(delta):
	controlled_object.move(controlled_object.direction)
	attack(delta)
	route += controlled_object.movement_speed * delta
	if controlled_object.is_on_wall():
		wall_counter += 1
	else:
		wall_counter = 0
	if route >= move_route_length || (wall_counter >= 1 && route > 10):
		turn_around()
		route = 0
		wall_counter = 0

func attack(delta):
	counter += delta
	if counter >= attack_speed:
		controlled_object._attack(controlled_object.direction)
		counter = 0.0

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
